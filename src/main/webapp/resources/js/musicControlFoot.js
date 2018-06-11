var footPlayer;
var footProgressFlag = 0;

initFoot(302);

function initFoot(sq) {
	footPlayer = WaveSurfer.create({
		container : '#footWaveform',
	});
	
	loadFoot(sq);
	
	footPlayer.on('ready', function () {
		footPlayer.duration = footPlayer.getDuration();
		$('#footDuration').text(formatTime(footPlayer.duration));
		$('#footProgress').text( formatTime(0));
		
		if (musicMain.getMusicPage()) {
			for(var i = 0; i <= maxDetailNum; i++) {
				if (detailPlayer[i].sq == footPlayer.sq) {
					musicMain.setDetailNum(i);
				}
			}
		}
		musicMain.setFootReady(true);
	});
	
	footPlayer.on('audioprocess', footProgress);
}


function loadFoot(sq) {
	footPlayer.sq = sq;
	musicMain.setFootReady(false);
	musicMain.setDetailNum(-1);
	footPlayer.load( "/heartbeat/resources/music/" + sq + ".mp3");
}

function switchFootProgress() {
	if (footProgressFlag == 0) {
		footProgressFlag = 1;
	} else {
		footProgressFlag = 0;
		footPlayer.seekTo(Number($('#footProgressBar').val()));
	}
}

function footProgress()  {
	if (footProgressFlag == 0) {
		$('#footProgress').text( formatTime(footPlayer.getCurrentTime()) );
	    $('#footProgressBar').val(footPlayer.getCurrentTime()/footPlayer.duration);
	}
}

function changeFootProgress() {
	$('#footProgress').text( formatTime($('#footProgressBar').val() * footPlayer.duration) );
	
	var num = musicMain.getDetailNum();
	if (num != -1) {
		detailPlayer[num].seekTo(Number($('#footProgressBar').val()));
	}
}

function playFromFoot() {
	var num = musicMain.getDetailNum();
	if (num != -1) {
		detailPlayer[num].play();
	}
	footPlayer.play();
}

function pauseFromFoot() {
	var num = musicMain.getDetailNum();
	if (num != -1) {
		detailPlayer[num].pause();
	}
	footPlayer.pause();
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