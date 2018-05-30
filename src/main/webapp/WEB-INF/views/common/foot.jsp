<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<style type="text/css">
	.foot {
		background-color: yellow;
		height: 80px;
	}
</style>
<script src="//cdnjs.cloudflare.com/ajax/libs/wavesurfer.js/2.0.5/wavesurfer.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var wavesurfer = WaveSurfer.create({
		    container: '#waveform',
		    waveColor: 'violet',
		    progressColor: 'purple'
		});
		
		wavesurfer.load('resources/music/Kalimba.mp3');
	}
</script>

</head>
<body>
	<div class="foot">
		foot
		<audio id="audio" controls="controls"  src="resources/music/Kalimba.mp3" >
		</audio>
	</div>
	
	<div id="waveform"></div>
</body>
