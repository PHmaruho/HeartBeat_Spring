<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<style type="text/css">
	.foot {
		background-color: yellow;
		height: 80px;
	}
</style>


</head>

<body>
<!-- 	<div class="foot">
		<audio id="audio" controls="controls"  src="/resources/music/Kalimba.mp3" >
		</audio>
	</div> -->
<div id="waveform"></div>

<p align="center">
  <button class="btn btn-primary" onclick="wavesurfer.playPause()">
    Play
  </button>
</p>
<script src="https://cdnjs.cloudflare.com/ajax/libs/wavesurfer.js/1.2.3/wavesurfer.min.js"></script>
<script type="text/javascript">
var wavesurfer = WaveSurfer.create({
	  container: '#waveform',
	  waveColor: 'darkorange',
	  progressColor: 'purple',
	  height: 64
	});

	wavesurfer.load('https://wavesurfer-js.org/example/split-channels/stereo.mp3');
</script>
</body>
