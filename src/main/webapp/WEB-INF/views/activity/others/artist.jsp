<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>

</head>
<body>
	<div class="cwi-artist-info">
		<img width="200" height="200" src="${pageContext.request.contextPath }/resources/img/profile/${member.member_sq }.png">
		nick : ${member.nick }
	</div>

	<c:forEach var="music" items="${list }" varStatus="status">
		<div class="cwi-detail-player-main">
			<div class="">
				<a><img></a>
				<table class="cwi-detail-player-info">
				<tr>
					<td><button onclick="playFromDetail(${status.index })">play</button></td>
					<td><span class="cwi-detail-player-title">title : ${music.music_nm }</span></td>
				</tr>
				<tr>
					<td><button onclick="pauseFromDetail(${status.index })">pause</button></td>
					<td>
						<span class="cwi-detail-player-artist">
							artists : 
							<c:forEach var="artist" items="${music.artistList }" varStatus="artistStatus">
								<a onclick="goto('/others/artist/${artist.member_sq}')">${artist.nick}</a>
								<c:if test="${!artistStatus.last }">
									, 
								</c:if>
							</c:forEach>
						</span>
					</td>
				</tr>
			</table>
			
			
		<span class="cwi-player-button"> <!-- 임시 -->
			
			
			</span>
			</div>
			
			<span class=""></span>
			
			<div class="cwi-detail-player-tags">
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
		<%-- <div>
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
		</div> --%>
		<input type="hidden" id="detailMusicSq${status.index }" value="${music.music_sq }">
		<c:set var="maxNum" value="${status.index }"/>
	</c:forEach>
	<input type="hidden" id="maxDetailNum" value="${maxNum }">
<script src="${pageContext.request.contextPath }/resources/js/musicControlDetail.js?v=<%=System.currentTimeMillis() %>"></script>
</body>
