<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>

</head>
<body onresize="resizeComment()">
	<div class="cwi-artist-info">
		<img src="${pageContext.request.contextPath }/resources/img/profile/${member.member_sq }.png" class="cwi-artist-img">
		<h1 class="display-4 cwi-artist-nick">${member.nick }</h1>
		
		<div id="artistFollow" class="cwi-follow-wrapper">
			<c:if test="${member.cntFollow == 0}">
				<span id="artistFollowButton" class="badge badge-pill badge-light cwi-like"
					onclick="cwi_follow(${member.member_sq}, this)">
					<img src="${pageContext.request.contextPath }/resources/img/icon/follow-16.png"> 팔로우
				</span>
			</c:if>
			<c:if test="${member.cntFollow == 1}">
				<span id="artistFollowButton" class="badge badge-pill badge-light cwi-liked"
					onclick="cwi_unfollow(${member.member_sq}, this)">
					<img src="${pageContext.request.contextPath }/resources/img/icon/following-16.png"> 취소
				</span>
			</c:if>
		</div>
		<div class="cwi-artist-follow-stat">
			<h5 class="cwi-font-size-1">팔로워 / ${member.followerCnt }</h5>
			<h5 class="cwi-font-size-1">팔로잉 / ${member.followingCnt }</h5>
		</div>
	</div>

	<c:if test="${list == null || list.size() == 0}">
		<div class="cwi-discover-main">
			<div class="jumbotron cwi-discover-jumbo">
				<p class="lead">등록 된 노래가 없습니다.</p>
				<hr class="my-4">
			</div>
		</div>
		<input type="hidden" id="maxDetailNum" value="-1">
	</c:if>
	
	<c:if test="${list != null && list.size() != 0}">
		<c:forEach var="music" items="${list }" varStatus="status">
			<div id="detailPlayerHidden${status.index }" class="cwi-foot-display-none">
				<div class="cwi-artist-player-main">
					<div class="cwi-artist-flex">
						<div class="cwi-artist-player-img">
							<img src="${pageContext.request.contextPath }/resources/img/album/${music.album_sq }.png">
						</div>
						
						<div class="cwi-artist-second-main">
							<table class="cwi-artist-player-info">
								<tr>
									<td rowspan="2" style="width: 70px; height: 70px;">
										<span>
											<a id="detailPlayBtn${status.index }" onclick="playFromDetail(${status.index })">
												<img src="${pageContext.request.contextPath }/resources/img/icon/play-button-64.png">
											</a>
											<a id="detailPauseBtn${status.index }" class="cwi-foot-display-none" onclick="pauseFromDetail(${status.index })">
												<img src="${pageContext.request.contextPath }/resources/img/icon/pause-button-64.png">
											</a>
										</span>
									</td>
									<td>
										<span class="badge badge-dark cwi-detail-player-artist cwi-vertical-bottom">
											<c:forEach var="artist" items="${music.artistList }" varStatus="artistStatus">
												<a onclick="goto('/others/artist/${artist.member_sq}')" class="cwi-cursor-pointer">${artist.nick}</a>
												<c:if test="${!artistStatus.last }">
													, 
												</c:if>
											</c:forEach>
										</span>
									</td>
								</tr>
								<tr>
									<td><span class="badge badge-dark cwi-artist-player-title cwi-vertical-top">${music.music_nm }</span></td>
								</tr>
							</table>
							
							<div class="cwi-artist-player-tags">
								<c:forEach var="tag" items="${music.tagList }" varStatus="tagStatus">
									<h6 class="cwi-detail-h-inline"><span class="badge badge-pill badge-secondary">#${tag.tag_meaning}</span></h6>
								</c:forEach>
							</div>
							
							<div class="cwi-artist-player-wave-wrapper">
								<div id="detailWaveForm${status.index }" class="cwi-artist-player-wave"></div>
								<div class="cwi-detail-progress">
									<span id="detailProgress${status.index }" class="progress-left badge badge-pill badge-dark"></span>
									<span id="detailDuration${status.index }" class="progress-right badge badge-pill badge-dark"></span>
								</div>
								
								<div id="detailComments${status.index }" style="height: 24px;">
									<div id="detailCommentIconsLine${status.index }" class="cwi-datail-comments-line"></div>
									<span id="detailCommentsOn${status.index }" style="position: absolute;">
										<span id="detailCommentsOn${status.index }-1" class="badge cwi-comments-color"></span>
										<span id="detailCommentsOn${status.index }-2" class="badge cwi-comments-color"></span>
										<span id="detailCommentsOn${status.index }-3" class="badge cwi-comments-color"></span>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>	
				<div class="cwi-artist-third-main">
					<div id="detailLike${status.index }" class="cwi-like-wrapper">
						<c:if test="${music.isLiked == 0}">
							<span id="detailLikeButton${status.index }" class="badge badge-pill badge-light cwi-like"
								onclick="cwi_reLike(${music.music_sq}, this)">
								<img src="${pageContext.request.contextPath }/resources/img/icon/like-16.png"> ${music.likeCnt }
							</span>
						</c:if>
						<c:if test="${music.isLiked == 1}">
							<span id="detailLikeButton${status.index }" class="badge badge-pill badge-light cwi-liked"
								onclick="cwi_unLike(${music.music_sq}, this)">
								<img src="${pageContext.request.contextPath }/resources/img/icon/liked-16.png"> ${music.likeCnt }
							</span>
						</c:if>
						<span class="badge badge-pill badge-light cwi-like" style="height: 24px;"
							onclick="cookieFromAdd(${music.music_sq})">
							예약
						</span>
					</div>
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
							<a id="detailCommentTarget${status.index }" class="cwi-comment-target"></a>
							<input type="text" id="detailCommentText${status.index }" class="cwi-comment-input"
								onkeydown="commentKeyPress(${status.index }, 1)" placeholder="답글을 달아주세요">
							<input type="hidden" id="detailCommentHidden${status.index }" value="">
						</div>
					</div>	
				</div>
				<input type="hidden" id="detailMusicSq${status.index }" value="${music.music_sq }">
				<c:set var="maxNum" value="${status.index }"/>
			</div>
		</c:forEach>
		<input type="hidden" id="maxDetailNum" value="${maxNum }">
	</c:if>
	
<script src="${pageContext.request.contextPath }/resources/js/musicControlDetail.js?v=<%=System.currentTimeMillis() %>"></script>
</body>
