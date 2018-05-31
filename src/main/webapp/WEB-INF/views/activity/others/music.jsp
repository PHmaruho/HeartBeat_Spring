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
	<div id="waveform"></div>
	<div id="progress"></div>
	
	asd
	<p align="center">
		<button onclick="asdf()">Play</button>
	</p>
	
	
	
	
<script type="text/javascript">
	var wavesurferDetail = WaveSurfer.create({
		container : '#waveform',
		waveColor : 'darkorange',
		progressColor : 'purple',
		barWidth : 3,
		barHeight : 3,
		height : 200,
		responsive : true
	});
	
	wavesurferDetail.load( "${pageContext.request.contextPath }" + "/resources/music/" + $('#music_sq').val() + ".mp3");
	
	function asdf() {
		wavesurferDetail.playPause();
		progress();
	}
	
	function progress() {
		$('#progress').html(wavesurferDetail.getCurrentTime());
		
		function frame() {
			if (width >= 100) {
				clearInterval(id);
			} else {
				width++;
				elem.style.width = width + '%';
			}
		}
	}
</script>
</body>

