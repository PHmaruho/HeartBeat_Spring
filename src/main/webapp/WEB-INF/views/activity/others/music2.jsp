<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<style type="text/css">
.cwi-detail-player-main {
	background-color: silver;
	width: 80%;
	height: 400px;
	margin: auto;
	position: relative;
}

.cwi-detail-player-img img {
	width: 360px;
	height: 360px;
	float: right;
	position: absolute;
	right: 20px;
	bottom: 20px;
}

.cwi-detail-player-wave-wrapper {
	width: 60%;
	position: absolute;
	left: 20px;
	bottom: 20px;
}

.cwi-detail-player-comments {
	/* position: absolute; */
	width: 15px;
	height: 15px;
	z-index: 998;
}

.cwi-commnets-on {
	z-index: 999;
}
</style>
</head>
<body>
	<div class="cwi-detail-player-main">
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
		<div class="cwi-detail-player-img">
			<img src="${pageContext.request.contextPath }/resources/img/album/${music.MUSIC_SQ }.png">
		</div>
		<span class="cwi-player-button">
			<button onclick="playFromDetail(0)">play1</button>
			<button onclick="pauseFromDetail(0)">pause</button>
			<button onclick="getDetailComments(0)">getDetailComments()</button>
		</span>
		<span id="detailProgress0"></span>
		<span id="detailDuration0"></span>
		<div class="cwi-detail-player-wave-wrapper">
			<div id="detailWaveForm0" class="cwi-player-wave"></div>
			<div id="detailComments0" style="height: 24px;"></div>
			<span id="detailCommentsOn0">
				<span id="detailCommentsIcon0">a</span>
				<span id="detailCommentsNick0">b</span>
				<span id="detailCommentsReply0">c</span>
			</span>
		</div>
	</div>
	
	<input type="hidden" id="detailMusicSq0" value="${music.MUSIC_SQ }">
	<input type="hidden" id="maxDetailNum" value="0">
<script src="${pageContext.request.contextPath }/resources/js/musicControlDetail.js?v=<%=System.currentTimeMillis() %>"></script>
</body>


