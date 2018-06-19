var detailPlayer = [];
var maxDetailNum = $('#maxDetailNum').val();
var isCommentsOn = false;
var spanFlag = false;

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
		waveColor: 'rgba(229, 216, 92, 1.0)',
		progressColor: 'rgba(255, 0, 0, 0.7)',
		barWidth : 5,
		barHeight : 3,
		height : 100,
		barRadius : 6,
		responsive : 10,
		hideScrollbar : true,
		cursorColor : 'rgba(0,0,0,0.0)'
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
		var time = detailPlayer[detailNum].getCurrentTime();
		var floorTime = Math.floor(time);
	    $('#detailProgress' + detailNum).text( formatTime(time) );
	    
	    if (!getIsCommentsOn() && detailPlayer[detailNum].comments[floorTime] != undefined &&
	    		$('#detailCommentsOn' + detailNum).attr('title') != floorTime) {
	    	commentsMouseover($('#commentsIcon' + detailNum + '-' + floorTime), detailNum);
	    } else if (!getIsCommentsOn() && detailPlayer[detailNum].comments[floorTime] == undefined) {
	    	commentsMouseout(detailNum);
	    }
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
	if (detailPlayer[detailNum].sq != footPlayer.sq) {
		loadFoot(detailPlayer[detailNum].sq);
	}
	checkFootReady(playAll, detailNum);
}

function playAll(detailNum) {
	console.log('playAll');
	playDisplayButton();
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
	pauseDisplayButton();
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
	var commentsIcon = "";
	var comments = detailPlayer[detailNum].comments;
	
	for (var i in comments) {
		var leftPos = comments[i].time_stamp / detailPlayer[detailNum].duration * $('#detailComments' + detailNum).width();
		
		var newHtml = 
			'<img class="cwi-detail-player-comments" style= "position:absolute; left:' + leftPos + 'px;" '+
			'src = "/heartbeat/resources/img/profile/' + comments[i].member_sq + '.png"' +
			'id="commentsIcon' + detailNum + '-' + i + '" alt="' + i + '">';
		commentsIcon = commentsIcon + newHtml;
	}
	$('#detailCommentIconsLine' + detailNum).html(commentsIcon);
	
	$('#detailComments' + detailNum).on('mousemove', function(e) {
		var target = $(e.target);
		
		if (target.parent().is('#detailCommentIconsLine' + detailNum)) {
			setIsCommentsOn(true);
			spanFlag = false;
			if (target.attr('alt') != $('#detailCommentsOn' + detailNum).attr('title')) {
				commentsMouseover(target, detailNum);
			}
		} else if (target.is('span') || target.is('img')) {
			setIsCommentsOn(true);
			spanFlag = false;
		} else {
			spanFlag = true;
			setTimeout(function() {
				if (spanFlag) {
					commentsMouseout(detailNum);
				}
			}, 200);
		}
	});
	
	$('#detailComments' + detailNum).on('mouseleave', function(e) {
		commentsMouseout(detailNum);
	});
	
	
}

function commentsMouseover(target, detailNum) {
	var selected = detailPlayer[detailNum].comments[target.attr('alt')];
	$('.cwi-commnets-on').removeClass('cwi-commnets-on');
	target.toggleClass('cwi-commnets-on');
	var iconHtml =
		'<img src="/heartbeat/resources/img/profile/' + selected.member_sq + '.png" class="cwi-detail-player-comments">';
	var nickHtml = selected.nick;
	var replyHtml = selected.reply_comment;
	
	$('#detailCommentsOn' + detailNum).attr('title', selected.time_stamp);
	$('#detailCommentsOn' + detailNum + '-2').html(nickHtml);
	
	if (target.position().left / $('#detailCommentIconsLine' + detailNum).width() < 0.5) {
		$('#detailCommentsOn' + detailNum).css('right', '');
		$('#detailCommentsOn' + detailNum).css({'left' : target.position().left});
		$('#detailCommentsOn' + detailNum + '-1').html(iconHtml);
		$('#detailCommentsOn' + detailNum + '-3').html(replyHtml);
	} else {
		$('#detailCommentsOn' + detailNum).css('left', '');
		$('#detailCommentsOn' + detailNum).css({'right' : $('#detailComments' + detailNum).width() - target.position().left - 15});
		$('#detailCommentsOn' + detailNum + '-1').html(replyHtml);
		$('#detailCommentsOn' + detailNum + '-3').html(iconHtml);
	}
}

function commentsMouseout(detailNum) {
	setIsCommentsOn(false);
	$('.cwi-commnets-on').removeClass('cwi-commnets-on');
	$('#detailCommentsOn' + detailNum).attr('title', '');
	$('#detailCommentsOn' + detailNum + '-1').html('');
	$('#detailCommentsOn' + detailNum + '-2').html('');
	$('#detailCommentsOn' + detailNum + '-3').html('');
}

function getIsCommentsOn() {
	return isCommentsOn;
}

function setIsCommentsOn(bool) {
	isCommentsOn = bool;
}

function resizeComment() {
	for (var i = 0; i <= maxDetailNum; i++) {
		showDetailComments(i)
	}
}