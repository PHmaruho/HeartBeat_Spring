var detailPlayer = [];
var maxDetailNum = $('#maxDetailNum').val();


(function() {
	musicMain.setMusicPage(true);
	for (var i = 0; i <= maxDetailNum; i++) {
		initDetail(i, $('#detailMusicSq' + i).val());
	}
})();

function initDetail(detailNum, sq) {
	var waveContainer = '#detailWaveForm' + detailNum;
	
	detailPlayer[detailNum] = WaveSurfer.create({
		container : waveContainer,
		waveColor: '#D2EDD4',
		progressColor: '#46B54D',
		barWidth : 5,
		barHeight : 1,
		height : 100,
		barRadius : 6,
		responsive : 10,
		hideScrollbar : true
	});
	
	loadDetail(detailNum, sq)
	detailPlayer[detailNum].sq = sq;
	detailPlayer[detailNum].setMute(true);
	
	detailPlayer[detailNum].on('ready', function () {
		detailPlayer[detailNum].duration = detailPlayer[detailNum].getDuration();
	    $('#detailDuration' + detailNum).text( formatTime(detailPlayer[detailNum].getDuration()) );
	    $('#detailProgress' + detailNum).text( formatTime(0));
	    detailPlayer[detailNum].ready = true;
	    
	    if (maxDetailNum >= 1) {
	    	checkFootReady(checkSameDetailNum, detailNum)
	    }
	});
	
	detailPlayer[detailNum].on('audioprocess', function () {
	    $('#detailProgress' + detailNum).text( formatTime(detailPlayer[detailNum].getCurrentTime()) );
	    detailPlayer[detailNum].ready = false;
	});
	
	detailPlayer[detailNum].on('seek', function (e) {
		var num = detailNum;
		seekFromDetail(e, num);
	});
}

function loadDetail(detailNum, sq) {
	detailPlayer[detailNum].load( "/heartbeat/resources/music/" + sq + ".mp3");
}

function playFromDetail(detailNum) {
	pauseAllDetail();
	if (detailPlayer[detailNum].sq == footPlayer.sq) {
	} else {
		loadFoot(detailPlayer[detailNum].sq);
	}
	checkFootReady(playAll, detailNum);
}

function playAll(detailNum) {
	var e = detailPlayer[detailNum].getCurrentTime();
	footPlayer.play(e);
	detailPlayer[detailNum].play();
}

function pauseAllDetail() {
	for (var i = 0; i <= maxDetailNum; i++) {
		detailPlayer[i].pause();
	}
}

function pauseFromDetail(detailNum) {
	detailPlayer[detailNum].pause();
	footPlayer.pause();
}

function seekFromDetail(e, detailNum) {
	if (musicMain.getDetailNum() == detailNum) {
		$('#footProgressBar').val(e)
		$('#footProgress').text( formatTime(footPlayer.duration * e) );
		footPlayer.seekTo(e);
	}
}

function checkFootReady(callback, parameter) {
	var repeat = setInterval(isReady, 50);
	var params = arguments.length;
	
	function isReady() {
		if(musicMain.getFootReady() == true) {
			clearInterval(repeat);
			if (typeof callback === "function") {
				if(params == 1) {
					callback();
				} else if(params == 2) {
					callback(parameter);
				} else {
					console.log('checkFootReady parameter error');
				}
			} else {
				console.log('checkFootReady callback error');
			}
		}
	}
}


function checkSameDetailNum(j) {
	if (detailPlayer[j].sq == footPlayer.sq) {
		musicMain.setDetailNum(j);
		if (footPlayer.isPlaying()) {
			detailPlayer[j].seekTo(Number($('#footProgressBar').val()));
			detailPlayer[j].play();
		}
	}
}
//
//
//
//detailPlayer.on('seek', function (e) {
//    seekDetailToFoot(e);
//});
