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
		<button onclick="detailPlayer.playPause()">Play</button>
	</p>
	<input id="detailVoulume" type="range" min="0.0" max="1.0" step="0.01" value="0.5"
		oninput="detailPlayer.setVolume(this.value)" onchange="detailPlayer.setVolume(this.value)">
		
	<input type="button" value="1" class="asdfasdf">
	<input type="button" value="2" class="asdfasdf">
	<input type="button" value="overload0" onclick="ovtest()">
	<input type="button" value="overload1" onclick="ovtest(1)">
	<input type="button" value="overload2" onclick="ovtest(1,2)">
	<input type="button" value="nestedFunc" onclick="nestedFunc('ho')">
	<input type="button" value="gotoFoot" onclick="goto('/foot', 0)">
	
<script type="text/javascript">
	var detailPlayer;
	
	function initDetail() {
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
		
		detailPlayer.load( "${pageContext.request.contextPath }" + "/resources/music/" + $('#music_sq').val() + ".mp3");
	}
	
	initDetail();
	
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
	});
	
	$('input.asdfasdf').on('click', function(e) {
		alert(this.value);
	})
	
	
	function ovtest(a, b) {
		if (arguments.length == 1) {
			console.log(a);
		} else if (arguments.length == 2) {
			console.log(a + ", " + b);
		} else {
			console.log("no param");
		}
	}
	
	function nestedFunc(b) {
		var a = "success";
		
		
		nestedFunc2();
		function nestedFunc2() {
			alert(a);
			alert(b);
		}
	}
</script>
</body>

