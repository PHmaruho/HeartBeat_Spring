<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<style type="text/css">
	.foot {
		background-color: yellow;
		height: 80px;
	}
	
	#footProgressBar {
	width: 50%
	}
</style>
</head>

<body>
	<div class="foot">
		<button onclick="footPlayer.playPause()">play</button>
		<input type="range" id="footProgressBar" value="0" min="0.0" max="1.0" step="0.0001"
			onmousedown="switchFootProgress()" onmouseup="switchFootProgress()" oninput="changeFootProgress()">
		<span id="footProgress"></span>
		<span id="footDuration"></span>
		<input id="footVoulume" type="range" min="0.0" max="1.0" step="0.01" value="0.5"
			oninput="footPlayer.setVolume(this.value)" onchange="footPlayer.setVolume(this.value)">	
		<div hidden="true" id="footWaveform"></div>		
		<button onclick="footPlayer.seekTo(0.9)">test</button>
		asd12
		
		<input type="button" value="asdf" onclick="qw()">
	</div>
	
	
<script type="text/javascript">
	var footPlayer;
	var footDuration;
	var footProgressFlag = 0;
	initFoot();
	
	function initFoot() {
		footPlayer = WaveSurfer.create({
		container : '#footWaveform',
		barWidth : 3,
		barHeight : 3,
		height : 200,
		});
		
		//footPlayer.load( "${pageContext.request.contextPath }" + "/resources/music/" + $('#music_sq').val() + ".mp3");
		footPlayer.load( "${pageContext.request.contextPath }" + "/resources/music/" + "302" + ".mp3");
		//footPlayer.load('https://www.youtube.com/watch?v=EP625xQIGzs');
	}
	
	function switchFootProgress() {
		if (footProgressFlag == 0) {
			footProgressFlag = 1;
		} else {
			footProgressFlag = 0;
			footPlayer.seekTo(Number($('#footProgressBar').val()));
		}
	}
	
	function footProgress()  {
		if (footProgressFlag == 0) {
			$('#footProgress').text( formatTime(footPlayer.getCurrentTime()) );
		    $('#footProgressBar').val(footPlayer.getCurrentTime()/footDuration);
		}
	}
	
	function changeFootProgress() {
		$('#footProgress').text( formatTime($('#footProgressBar').val() * footDuration) );
	}
	
	var formatTime = function (time) {
	    return [
	        Math.floor((time % 3600) / 60), // minutes
	        ('00' + Math.floor(time % 60)).slice(-2) // seconds
	    ].join(':');
	};
	

	footPlayer.on('ready', function () {
		footDuration = footPlayer.getDuration();
	    $('#footDuration').text(formatTime(footDuration));
	    footPlayer.on('audioprocess', footProgress);
	});
</script>
</body>
