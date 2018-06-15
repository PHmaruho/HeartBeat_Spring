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
	<c:forEach var="music" items="${list }" varStatus="status">
		<div class="cwi-detail-player-main">
			<div class="">
				<a><img></a>
				<span class="cwi-detail-player-title">title : ${music.music_nm }</span>
				<span class="cwi-detail-player-artist">
					artists : 
					<c:forEach var="artist" items="${music.artistList }" varStatus="artistStatus">
						${artist.nick}
						<c:if test="${!artistStatus.last }">
							, 
						</c:if>
					</c:forEach>
				</span>
				
			<span class="cwi-player-button"> <!-- 임시 -->
				<button onclick="playFromDetail(${status.index })">play1</button>
				<button onclick="pauseFromDetail(${status.index })">pause</button>
			</span>
			</div>
			
			<span class=""></span>
			
			<div class="">
				<c:forEach var="tag" items="${music.tagList }">
					<span>${tag.tag_meaning}</span>
				</c:forEach>
			</div>
			
			<span class="cwi-detail-player-img">
				<img src="${pageContext.request.contextPath }/resources/img/album/${music.album_sq }.png">
			</span>
			
			<div class="cwi-detail-player-wave-wrapper">
				<div id="detailWaveForm${status.index }" class="cwi-detail-player-wave"></div>
				<span id="detailProgress${status.index }"></span>
				<span id="detailDuration${status.index }"></span>
				
				<div id="detailComments${status.index }" style="height: 48px;">
					<div id="detailCommentIconsLine${status.index }" style="height: 24px;"></div>
					<span id="detailCommentsOn${status.index }" style="position: absolute;">
						<span id="detailCommentsOn${status.index }-1"><img></span>
						<span id="detailCommentsOn${status.index }-2"><a></a></span>
						<span id="detailCommentsOn${status.index }-3">...</span>
					</span>
				</div>
				
			</div>
			
		</div>
		<div>
			<div>
				<span><img>좋아요</span>
				<span><img>공유</span>
				<span><img>추가</span>
				<span><img><a onclick="addCookie(${music.music_sq})">예약</a></span>
				
				<span><img>좋아요 수</span>
				<span><img>공유 수</span>
			</div>
			
			<div>
				<span><img></span>
				<input type="text">
				<input type="button">
			</div>
		</div>
		<input type="hidden" id="detailMusicSq${status.index }" value="${music.music_sq }">
		<c:set var="maxNum" value="${status.index }"/>
	</c:forEach>
	<input type="hidden" id="maxDetailNum" value="${maxNum }">
<script src="${pageContext.request.contextPath }/resources/js/musicControlDetail.js?v=<%=System.currentTimeMillis() %>"></script>
</body>
