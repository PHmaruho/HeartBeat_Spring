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
		<input type="button" value="play" onclick="playFromFoot()">
		<input type="button" value="pause" onclick="pauseFromFoot()">
		
		<span id="footProgress"></span>
		<input type="range" id="footProgressBar" value="0" min="0.0" max="1.0" step="0.0001"
			onmousedown="switchFootProgress()" onmouseup="switchFootProgress()" oninput="changeFootProgress()">
		<span id="footDuration"></span>
		<input id="footVoulume" type="range" min="0.0" max="1.0" step="0.01" value="0.5"
			oninput="footPlayer.setVolume(this.value)" onchange="footPlayer.setVolume(this.value)">	
		<div hidden="true" id="footWaveform"></div>	
	</div>
	<script src="${pageContext.request.contextPath }/resources/js/musicControlFoot.js?v=<%=System.currentTimeMillis() %>"></script>
</body>
