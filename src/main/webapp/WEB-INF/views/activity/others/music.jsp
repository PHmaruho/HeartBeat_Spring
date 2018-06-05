<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
</head>
<body>
	sq : ${music.music_sq }
	<br> nm : ${music.music_nm }
	<br> nm : ${music.MUSIC_NM }
	<br> title : ${music.album_music_sq }
	<br> title : ${music.ALBUM_MUSIC_SQ }
	<br>
	<input type="hidden" value="${music.MUSIC_SQ }" id="music_sq">
	
	<!-- 	<div class="foot">
		<audio id="audio" controls="controls"  src="/resources/music/Kalimba.mp3" >
		</audio>
	</div> -->
	<%-- <img src="${pageContext.request.contextPath }/resources/img/album/${music.MUSIC_SQ }.png"> --%>
	<div id="detailWaveform"></div>
	<span id="detailProgress"></span>
	<span id="detailDuration"></span>
	
	asda123
	<input type="button" value="play" onclick="toFoot(${music.MUSIC_SQ })">
	<input type="button" value="pause" onclick="pauseAll()">
	
	<button onclick="goto('/others/music/302')">302</button>
	<button onclick="goto('/others/music/303')">303</button>
	<button onclick="seekTest()">seekTest()</button>
	<button onclick="test(302)">test(302)</button>
	<button onclick="test(303)">test(303)</button>
	
<script type="text/javascript">
	var detailPlayer;
	var detailMusic;
	initDetail();
	
	function initDetail() {
		detailMusic = $('#music_sq').val();
		
		detailPlayer = WaveSurfer.create({
		container : '#detailWaveform',
	    waveColor: '#D2EDD4',
	    progressColor: '#46B54D',
		barWidth : 5,
		barHeight : 1,
		height : 100,
		barRadius : 6,
		responsive : 10
		});
		
		detailPlayer.load( "${pageContext.request.contextPath }" + "/resources/music/" + detailMusic + ".mp3");
		detailPlayer.setMute(true);
	}
	
	
	var formatTime = function (time) {
	    return [
	        Math.floor((time % 3600) / 60), // minutes
	        ('00' + Math.floor(time % 60)).slice(-2) // seconds
	    ].join(':');
	};

	detailPlayer.on('audioprocess', function () {
	    $('#detailProgress').text( formatTime(detailPlayer.getCurrentTime()) );
	});

	detailPlayer.on('ready', function () {
	    $('#detailDuration').text( formatTime(detailPlayer.getDuration()) );
	    
		if(footPlayer.isPlaying()) {
			progressSync();
		}
	});
	
	detailPlayer.on('seek', function (e) {
	    seekDetailToFoot(e);
	});

	function playDetail(start) {
		if(arguments.length == 0) {
			detailPlayer.play();
		} else if(arguments.length == 1) {
			detailPlayer.play(start)
		} else {
			console.log('playDetail Error');
		}
	}
	
	function pauseDetail() {
		detailPlayer.pause();
	}
	
	function getDetailMusic() {
		return detailMusic;
	}
	
	function getDetailCurrent() {
		return detailPlayer.getCurrentTime();
	}
	
	function seekDetail(number) {
		detailPlayer.seekTo(number);
	}
	
	function getDetailDuration() {
		return detailPlayer.getDuration();
	}
	
	function test(sq) {
		detailPlayer.load( "${pageContext.request.contextPath }" + "/resources/music/" + sq + ".mp3")
	}
</script>
</body>

