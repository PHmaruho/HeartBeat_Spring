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
	asd1
		<input type="button" value="play" onclick="fromFoot()">
		<input type="button" value="pause" onclick="pauseAll()">
		
		<span id="footProgress"></span>
		<input type="range" id="footProgressBar" value="0" min="0.0" max="1.0" step="0.0001"
			onmousedown="switchFootProgress()" onmouseup="switchFootProgress()" oninput="changeFootProgress()">
		<span id="footDuration"></span>
		<input id="footVoulume" type="range" min="0.0" max="1.0" step="0.01" value="0.5"
			oninput="footPlayer.setVolume(this.value)" onchange="footPlayer.setVolume(this.value)">	
		<div hidden="true" id="footWaveform"></div>	
			
		<input type="button" value="exTest()" onclick="exTest()">
	</div>
	
<script type="text/javascript">
	var footPlayer;
	var footDuration;
	var footMusic;
	var footProgressFlag = 0;
	var footReady = false;
	
	var formatTime = function (time) {
	    return [
	        Math.floor((time % 3600) / 60), // minutes
	        ('00' + Math.floor(time % 60)).slice(-2) // seconds
	    ].join(':');
	};
	
	initFoot(302);
	
	function initFoot(sq) {
		footMusic = sq;
		footPlayer = WaveSurfer.create({
		container : '#footWaveform',
		});
		
		footPlayer.load( "${pageContext.request.contextPath }" + "/resources/music/" + footMusic + ".mp3");
	}
	
	footPlayer.on('ready', function () {
		footDuration = footPlayer.getDuration();
	    $('#footDuration').text(formatTime(footDuration));
	    footPlayer.on('audioprocess', footProgress);
		$('#footProgress').text( formatTime(0));
		footReady = true;
	});
	
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
		seekFootToDetail(Number($('#footProgressBar').val()));
	}
	
	function playFoot(start) {
		if(arguments.length == 0) {
			footPlayer.play();
		} else if(arguments.length == 1) {
			footPlayer.play(start)
		} else {
			console.log('playFoot Error');
		}
	}
	
	function pauseFoot() {
		footPlayer.pause();
	}
	
	function getFootMusic() {
		return footMusic;
	}
	
	function getFootCurrent() {
		return footPlayer.getCurrentTime();
	}
	
	function getFootReady() {
		return footReady;
	}
	
	function seekFoot(number) {
		console.log(number);
		footPlayer.seekTo(number);
	}
	
	function footReload(sq) {
		footPlayer.stop();
		footReady = false
		footMusic = sq
		footPlayer.load( "${pageContext.request.contextPath }" + "/resources/music/" + footMusic + ".mp3");
		footDuration = footPlayer.getDuration();
	}
</script>
</body>
