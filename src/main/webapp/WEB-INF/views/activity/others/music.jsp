<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
</head>
<body onresize="resizeComment()">
	${music.likeCnt }
	<div class="cwi-detail-player-main">
		<table class="cwi-detail-player-info">
			<tr>
				<td rowspan="2" style="width: 140px; height: 140px;">
					<span id="detailRotateBtn0">
						<a id="detailPlayBtn0" onclick="playFromDetail(0)">
							<img src="${pageContext.request.contextPath }/resources/img/icon/play-button-128.png">
						</a>
						<a id="detailPauseBtn0" class="cwi-foot-display-none" onclick="pauseFromDetail(0)">
							<img src="${pageContext.request.contextPath }/resources/img/icon/pause-button-128.png">
						</a>
					</span>
				</td>
				<td>
					<span class="badge badge-dark cwi-detail-player-artist cwi-vertical-bottom">
						<c:forEach var="artist" items="${music.artistList }" varStatus="status">
							<a onclick="goto('/others/artist/${artist.member_sq}')" class="cwi-cursor-pointer">${artist.nick}</a>
							<c:if test="${!status.last }">
								, 
							</c:if>
						</c:forEach>
					</span>
				</td>
			</tr>
			<tr>
				<td><span class="badge badge-dark cwi-detail-player-title cwi-vertical-top">${music.music_nm }</span></td>
			</tr>
		</table>
		
		<div class="cwi-detail-player-tags">
			<c:forEach var="tag" items="${music.tagList }" varStatus="status">
				<h5 class="cwi-detail-h-inline"><span class="badge badge-pill badge-secondary">#${tag.tag_meaning}</span></h5>
			</c:forEach>
		</div>
		
		<span class="cwi-detail-player-img">
			<img src="${pageContext.request.contextPath }/resources/img/album/${music.album_sq }.png">
		</span>
		
		<div class="cwi-detail-player-wave-wrapper">
			<div id="detailWaveForm0" class="cwi-detail-player-wave"></div>
			<div class="cwi-detail-progress">
				<span id="detailProgress0" class="progress-left badge badge-pill badge-dark"></span>
				<span id="detailDuration0" class="progress-right badge badge-pill badge-dark"></span>
			</div>
			
			<div id="detailComments0" style="height: 24px;">
				<div id="detailCommentIconsLine0" class="cwi-datail-comments-line"></div>
				<span id="detailCommentsOn0" style="position: absolute;">
					<span id="detailCommentsOn0-1" class="badge cwi-comments-color"></span>
					<span id="detailCommentsOn0-2" class="badge cwi-comments-color"></span>
					<span id="detailCommentsOn0-3" class="badge cwi-comments-color"></span>
				</span>
			</div>
			
		</div>
		
		<input type="hidden" id="detailMusicSq0" value="${music.music_sq }">
		<input type="hidden" id="maxDetailNum" value="0">
	</div>
	<div class="cwi-detail-player-etc">
		<div>
			<span class="badge badge-pill badge-light"><img>좋아요</span>
			<span class="badge badge-pill badge-light"><img>공유</span>
			<span class="badge badge-pill badge-light"><img>추가</span>
			
			<span class="badge badge-pill badge-light"><img>좋아요 수</span>
			<span class="badge badge-pill badge-light"><img>공유 수</span>
		</div>
	</div>
	
	<div class="cwi-detail-under-main">
		<div class="cwi-comment-wrapper">
			<div class="cwi-comment-img-wrapper">
				<c:if test="${empty loginSession }">
					<img src="${pageContext.request.contextPath }/resources/img/profile/default-32.png" class="cwi-comment-img">
				</c:if>
				<c:if test="${!empty loginSession }">
					<img src="${pageContext.request.contextPath }/resources/img/profile/${loginSession }.png"class="cwi-comment-img">
				</c:if>
			</div>
			<div class="cwi-comment-input-wrapper">
				<a id="detailCommentTarget0" class="cwi-comment-target"></a>
				<input type="text" id="detailCommentText0" class="cwi-comment-input"
					onkeydown="commentKeyPress(0, 0)" placeholder="답글을 달아주세요">
				<input type="hidden" id="detailCommentHidden0" value="">
			</div>
		</div>
	</div>
	
<script src="${pageContext.request.contextPath }/resources/js/musicControlDetail.js?v=<%=System.currentTimeMillis() %>"></script>
</body>


