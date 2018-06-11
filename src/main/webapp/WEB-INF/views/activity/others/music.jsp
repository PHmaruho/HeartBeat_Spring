<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<style type="text/css">
.cwi-player-main {
	background-color: silver;
	width: 80%;
	height: 400px;
	margin: auto;
	position: relative;
}

.cwi-player-img img {
	width: 360px;
	height: 360px;
	float: right;
	position: absolute;
	right: 20px;
	bottom: 20px;
}

.cwi-player-wave {
	width: 60%;
	position: absolute;
	left: 20px;
	bottom: 20px;
	background-color: black;
}
</style>
</head>
<body>
	<div class="cwi-player-main">
		<span class="cwi-player-title">
			title : ${music.MUSIC_NM }
		</span>
		<span class="cwi-player-artist">
			artists : 
			<c:forEach var="artist" items="${artist }" varStatus="status">
				${artist.nick}
				<c:if test="${!status.last }">
					, 
				</c:if>
			</c:forEach>
		</span>
		<div class="cwi-player-img">
			<img src="${pageContext.request.contextPath }/resources/img/album/${music.MUSIC_SQ }.png">
		</div>
		<span class="cwi-player-button">
			<button onclick="playFromDetail(0)">play</button>
			<button onclick="pauseFromDetail(0)">pause</button>
		</span>
		<span id="detailProgress0"></span>
		<span id="detailDuration0"></span>
		<div id="detailWaveForm0" class="cwi-player-wave"></div>
	</div>
	
	<input type="hidden" id="detailMusicSq0" value="${music.MUSIC_SQ }">
	<input type="hidden" id="maxDetailNum" value="0">
<script src="${pageContext.request.contextPath }/resources/js/musicControlDetail.js?v=<%=System.currentTimeMillis() %>"></script>
</body>


