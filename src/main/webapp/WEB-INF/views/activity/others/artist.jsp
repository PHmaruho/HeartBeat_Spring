<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>

</head>
<body onresize="resizeComment()">
	<div class="cwi-artist-info">
		<img width="200" height="200" src="${pageContext.request.contextPath }/resources/img/profile/${member.member_sq }.png">
		nick : ${member.nick }
	</div>

	<c:forEach var="music" items="${list }" varStatus="status">
		<div class="cwi-artist-player-main">
			<span class="cwi-artist-player-img">
				<img src="${pageContext.request.contextPath }/resources/img/album/${music.album_sq }.png">
			</span>
			
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
			
			<input type="hidden" id="detailMusicSq${status.index }" value="${music.music_sq }">
			<c:set var="maxNum" value="${status.index }"/>
		</div>	
	</c:forEach>
	<input type="hidden" id="maxDetailNum" value="${maxNum }">
	
<script src="${pageContext.request.contextPath }/resources/js/musicControlDetail.js?v=<%=System.currentTimeMillis() %>"></script>
</body>
