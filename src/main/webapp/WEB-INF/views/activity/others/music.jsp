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
	<div id="waveform"></div>

	<p align="center">
		<button onclick="wavesurferDetail.playPause()">Play</button>
	</p>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/wavesurfer.js/1.2.3/wavesurfer.min.js"></script>
	<script type="text/javascript">
		var wavesurferDetail = WaveSurfer.create({
			container : '#waveform',
			waveColor : 'darkorange',
			progressColor : 'purple',
			height : 64
		});
	
		wavesurferDetail.load("/resources/music/" + $('#music_sq').val() + ".mp3");
		
	</script>
</body>

