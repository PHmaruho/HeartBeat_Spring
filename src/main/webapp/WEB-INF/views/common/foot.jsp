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
	<button onclick="wavesurferFoot.playPause()"></button>
<script type="text/javascript">
	var wavesurferFoot
	
	function initDetail() {
		wavesurferFoot = WaveSurfer.create({
		container : '#detailWaveform',
		waveColor : 'darkorange',
		progressColor : 'purple',
		barWidth : 3,
		barHeight : 3,
		height : 200,
		});
		
		wavesurferFoot.load( "${pageContext.request.contextPath }" + "/resources/music/" + $('#music_sq').val() + ".mp3");
	}
	
	initDetail();
	
	
	var formatTime = function (time) {
	    return [
	        Math.floor((time % 3600) / 60), // minutes
	        ('00' + Math.floor(time % 60)).slice(-2) // seconds
	    ].join(':');
	};

	wavesurferFoot.on('audioprocess', function () {
	    $('#detailProgress').text( formatTime(wavesurferFoot.getCurrentTime()) );
	});

	wavesurferFoot.on('ready', function () {
	    $('#detailDuration').text( formatTime(wavesurferFoot.getDuration()) );
	});
</script>
</body>
