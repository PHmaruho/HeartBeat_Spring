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
	<img src="${pageContext.request.contextPath }/resources/img/album/${music.MUSIC_SQ }.png">
	<div id="detailWaveform"></div>
	<span id="detailProgress"></span>
	<span id="detailDuration"></span>
	
	asda1
	<p align="center">
		<button onclick="wavesurferDetail.playPause()">Play</button>
	</p>
	<input id="detailVoulume" type="range" min="0.0" max="1.0" step="0.01" value="0.5"
		oninput="wavesurferDetail.setVolume(this.value)" onchange="wavesurferDetail.setVolume(this.value)">
	
	
	
	
<script type="text/javascript">
	var wavesurferDetail
	
	function initDetail() {
		wavesurferDetail = WaveSurfer.create({
		container : '#detailWaveform',
		waveColor : 'darkorange',
		progressColor : 'purple',
		barWidth : 3,
		barHeight : 3,
		height : 200,
		});
		
		wavesurferDetail.load( "${pageContext.request.contextPath }" + "/resources/music/" + $('#music_sq').val() + ".mp3");
	}
	
	initDetail();
	
	
	var formatTime = function (time) {
	    return [
	        Math.floor((time % 3600) / 60), // minutes
	        ('00' + Math.floor(time % 60)).slice(-2) // seconds
	    ].join(':');
	};

	wavesurferDetail.on('audioprocess', function () {
	    $('#detailProgress').text( formatTime(wavesurferDetail.getCurrentTime()) );
	});

	wavesurferDetail.on('ready', function () {
	    $('#detailDuration').text( formatTime(wavesurferDetail.getDuration()) );
	});
</script>
</body>

