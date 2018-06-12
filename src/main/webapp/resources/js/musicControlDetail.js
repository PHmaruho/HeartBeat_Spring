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
	    getDetailComments(detailNum);
	    
	    if (maxDetailNum >= 1) {
	    	checkFootReady(checkSameDetailNum, detailNum)
	    }
	});
	
	detailPlayer[detailNum].on('audioprocess', function () {
	    $('#detailProgress' + detailNum).text( formatTime(detailPlayer[detailNum].getCurrentTime()) );
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
	var comments = detailPlayer[detailNum].comments;
	
	for (var i in comments) {
		var leftPos = comments[i].time_stamp / detailPlayer[detailNum].duration * $('#detailComments' + detailNum).width();
		var newHtml = '<img src="/heartbeat/resources/img/profile/302.png" class="cwi-detail-player-comments" ' +
		'style= "left: ' + leftPos + 'px;" id="commentsIcon' + detailNum + '-' + i + '">';
		commentsIcon = commentsIcon + newHtml;
	}
	$('#detailComments' + detailNum).html(commentsIcon);
	
	$('#detailComments' + detailNum).on('mouseover', function(e) {
		var target = $(e.target);
		if (target.is('img')) {
			target.toggleClass('cwi-commnets-on');
			var iconHtml = '<img src="/heartbeat/resources/img/profile/302.png" class="cwi-detail-player-comments">';
			var nickHtml = 'a';
			var replyHtml = 'asdfasdfasdf';
			console.log(target.position().left);
			$('#detailCommentsOn' + detailNum).css({'left' : target.position().left, 'position' : 'absolute'});
			$('#detailCommentsIcon' + detailNum).html(iconHtml);
			$('#detailCommentsNick' + detailNum).html(nickHtml);
			$('#detailCommentsReply' + detailNum).html(replyHtml);
		}
	});
	
	$('#detailComments' + detailNum).on('mouseout', function(e) {
		var target = $(e.target);
		if (target.is('img')) {
			target.toggleClass('cwi-commnets-on');
			$('#detailCommentsIcon' + detailNum).html();
			$('#detailCommentsNick' + detailNum).html();
			$('#detailCommentsReply' + detailNum).html();
		}
	});
	
}


