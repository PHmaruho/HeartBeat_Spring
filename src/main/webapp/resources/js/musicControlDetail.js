var detailPlayer = [];
var maxDetailNum = $('#maxDetailNum').val();
var isCommentsOn = false;
var spanFlag = false;
var hasMoreDetail;
var detailLoopCount;
var contentsPerScroll = 5;

(function() {
	hasMoreDetail = true;
	detailLoopCount = 0;
	musicMain.setMusicPage(true);
	initLoop(detailLoopCount);
})();

$(window).scroll(function() {
	if ($(window).scrollTop() == $(document).height() - $(window).height() && hasMoreDetail) {
		initLoop(detailLoopCount);
		console.log(1);
	}
});

function initLoop(dlc) {
	var startNum = contentsPerScroll * dlc;
	var endNum;
	var minus = maxDetailNum - startNum;
	
	if (minus < 0) {
		hasMoreDetail = false;
		return false;
	} else if (minus < 5 && minus >= 0) {
		hasMoreDetail = false;
		endNum = startNum + minus;
	} else {
		endNum = startNum + contentsPerScroll - 1;
	}
	
	for (var i = startNum; i <= endNum; i++) {
		initDetail(i, $('#detailMusicSq' + i).val());
	}
	
	detailLoopCount = detailLoopCount + 1;
}

function initDetail(detailNum, sq) {
	$('#detailPlayerHidden' + detailNum).removeClass('cwi-foot-display-none');
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
	    
	    if (maxDetailNum >= 0) {
	    	checkFootReady(checkSameDetailNum, detailNum)
	    }
	    
		if (detailPlayer[detailNum].sq == footPlayer.sq) {
			musicMain.setDetailNum(detailNum);
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
		var footProgressBar = $('#footProgressBar');
		footProgressBar.val(e);
		$('#footProgress').text( formatTime(footPlayer.duration * e) );
		footPlayer.seekTo(e);
		
	    var val = (footProgressBar.val() - footProgressBar.attr('min')) / (footProgressBar.attr('max') - footProgressBar.attr('min'));
	    
	    footProgressBar.css('background-image',
	                '-webkit-gradient(linear, left top, right top, '
	                + 'color-stop(' + val + ', #FF0000), '
	                + 'color-stop(' + val + ', #C5C5C5)'
	                + ')'
	                );
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
	
	$('#detailCommentIconsLine' + detailNum).on('click', function(e) {
		var target = $(e.target);
		
		if (target.is('img')) {
			commentClicked(detailNum, target.attr('alt'))
		}
	});
	
	$('#detailCommentsOn' + detailNum).on('click', function() {
		commentClicked(detailNum, $('#detailCommentsOn' + detailNum).attr('title'))
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

function commentClicked(detailNum, timeStamp) {
	var comments = detailPlayer[detailNum].comments[timeStamp];
	
	$('#detailCommentTarget' + detailNum).html(' ' + comments.nick);
	$('#detailCommentHidden' + detailNum).val(timeStamp);
}

function commentKeyPress(detailNum, type) {
	if (event.keyCode == 13) {
		if (type == 0) {	// music
			doSomething(detailNum);
		} else {	// artist
			doSomething2(detailNum);
		}
	} else if ($('#detailCommentText' + detailNum).val() == '' && event.keyCode == 8) {
		$('#detailCommentTarget' + detailNum).html('');
		$('#detailCommentHidden' + detailNum).val('');
	}
}

// music에서 작동될 펑션, $('#detailCommentHidden' + detailNum).val()의 값이 비어있다면 일반 댓글 입력이므로 getCurrentTime()으로 time_stamp 가져갈것
// $('#detailCommentHidden' + detailNum).val()에 값이 있다면 해당 값을 time_stamp로 이용
// detailPlayer[detailNum].comments[timeStamp] 를 이용하면 reply_sq 등 필요한 정보 이용 가능
function doSomething(detailNum) {
	console.log('detailNum : ' + detailNum);
	console.log('target : ' + $('#detailCommentTarget' + detailNum).text());
	console.log('text : ' + $('#detailCommentText' + detailNum).val());
	console.log('hidden : ' + $('#detailCommentHidden' + detailNum).val());
	console.log('music_sq :' + detailPlayer[detailNum].sq);
	let hidden_time = $('#detailCommentHidden' + detailNum).val() == null ? "" : $('#detailCommentHidden' + detailNum).val();
	let reply_comment = $('#detailCommentText' + detailNum).val();
	
	let time_stamp;
	let reply_sq;
	if(hidden_time.length == 0){ // 일반 댓글
		reply_sq = "";
		time_stamp = Math.floor(detailPlayer[detailNum].getCurrentTime());
	} else { // 특정 인물 댓글
		reply_sq = detailPlayer[detailNum].comments[$('#detailCommentHidden' + detailNum).val()].reply_sq;
		time_stamp = hidden_time;
	}
	
	let music_sq = detailPlayer[detailNum].sq;
	
	$.ajax({
		type:"POST",
		url: "/heartbeat/do/reply/music",
		data:{reply_type:'music',
			  reply_sq:reply_sq,
			  music_sq:music_sq,
			  time_stamp:time_stamp,
			  reply_comment:reply_comment},
		success: function(data2){
			if(data2.result == "Y"){
				getDetailComments(detailNum);
			}
		}
	});
}

// artist 펑션
function doSomething2(detailNum) {
	console.log('detailNum : ' + detailNum);
	console.log('target : ' + $('#detailCommentTarget' + detailNum).text());
	console.log('text : ' + $('#detailCommentText' + detailNum).val());
	console.log('hidden : ' + $('#detailCommentHidden' + detailNum).val());
}

// PHmaruho
// Paging List
function replyListPaging(page, detailNum){
	let music_sq = detailPlayer[detailNum].sq;
	$.ajax({
		type:"POST",
		url: "/heartbeat/do/reply/list",
		data:{music_sq:music_sq,
			  page:page},
		success: function(data){
			 
		}
	});
}