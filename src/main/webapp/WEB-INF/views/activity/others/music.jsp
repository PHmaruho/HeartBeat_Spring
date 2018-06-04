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
	
<script type="text/javascript">
	var detailPlayer;
	var detailMusic;
	initDetail();
	
	function initDetail() {
		detailMusic = $('#music_sq').val();
		
		var ctx = document.createElement('canvas').getContext('2d');
		var linGrad = ctx.createLinearGradient(0, 64, 0, 200);
		linGrad.addColorStop(0.5, 'rgba(116, 116, 116, 1.000)');
		linGrad.addColorStop(0.5, 'rgba(183, 183, 183, 1.000)');
		
		detailPlayer = WaveSurfer.create({
		container : '#detailWaveform',
		waveColor : linGrad,
		//progressColor : 'purple',
		barWidth : 3,
		barHeight : 3,
		height : 200,
		reflection : true
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
			progressSync(detailMusic);
		}
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
</script>
</body>

