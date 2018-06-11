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
	    getDetailComments(detailNum);
	    
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

function checkSameDetailNum(j) {
	if (detailPlayer[j].sq == footPlayer.sq) {
		musicMain.setDetailNum(j);
		if (footPlayer.isPlaying()) {
			detailPlayer[j].seekTo(Number($('#footProgressBar').val()));
			detailPlayer[j].play();
		}
	}
}

function getDetailComments(detailNum) {
	$.ajax({
		type : 'GET',
		url : '/heartbeat/do/getDetailComments/' + detailPlayer[detailNum].sq,
		dataType : 'json',
		success : function(data) {
			detailPlayer[detailNum].comments = data;
			showDetailComments(detailNum);
		},
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}

	});
}

function showDetailComments(detailNum) {
//	var commentsLength = detailPlayer[detailNum].comments.length;
	var commentsIcon = "";
	
	console.log(5);
	console.log(detailPlayer[detailNum]);
	console.log(detailPlayer[detailNum].comments[100]);
	console.log(detailPlayer[detailNum].comments[100].nick);
	
//	for (var i = 0; i < commentsLength; i++) {
//		var leftPos = detailPlayer[detailNum].comments[i].TIME_STAMP / detailPlayer[detailNum].duration * $('#detailComments' + detailNum).width();
//		commentsIcon = commentsIcon + '<img src="/heartbeat/resources/img/profile/302.png" style=' +
//			'"position: absolute; width: 15px; height: 15px; left: ' + leftPos + 'px;">'
//	}
//	$('#detailComments' + detailNum).html(commentsIcon);
}
