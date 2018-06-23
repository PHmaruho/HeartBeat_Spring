<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/Jan.js"></script>

</head>
<body>
<button onclick="goto('/home')">Home</button>	
<Br><Br>
<div class="box">
<div class="contents">
	<h2 style="text-align:center;" class="subTitle">Likes</h2><br>
		<h6 style="color:gray;">Hear the tracks you’ve liked:</h6>
		<br><br><Br>
	<ul class="glul lists" id="yzlist">
			<c:if test="${list==null ||list.size()==0}">
				리스트가 없습니다.
			</c:if>
			
			<c:if test="${list!=null }">
				<c:forEach var="like" items="${list}" varStatus="i">
					<li>
					<div id="likeList${i.index }">
					<c:if test="${like.code_meaning == '앨범' }">
						<div class="likeAlbum">
							<a href="/heartbeat/others/album/${like.album_sq}">
								<%-- <input type="hidden" id="music_sq${i.index }" value="${like.album_sq}"> --%>
								<img src="${pageContext.request.contextPath }/resources/img/album/${like.img_path }.png" class="albumImg">
							</a><br><br>
							<a href="#">
								<img src="${pageContext.request.contextPath }/resources/img/profile/like.png" class="glul-img" onclick="like_func(${like.music_like_sq},'${like.code_meaning }','likeList${i.index }')">
							</a>
							${like.like_Count }<br>
						</div>
					</c:if>
					
					<c:if test="${like.code_meaning == '곡' }">
						<div class="likeMusic">
							<a href="/heartbeat/others/music/${like.music_sq}">
								<%-- <input type="hidden" id="music_sq${i.index }" value="${like.music_sq}"> --%>				
								<img src="${pageContext.request.contextPath }/resources/img/album/${like.img_path }.png" class="albumImg" style="border-radius: 50%;">
							</a><br><br>
							<a href="#">
								<img src="${pageContext.request.contextPath }/resources/img/profile/like.png" class="glul-img" onclick="like_func(${like.music_like_sq},'${like.code_meaning }','likeList${i.index }')">
							</a>
							${like.like_Count }<br>
						</div>
					</c:if>
					
						${like.album_nm }<br>
						<a href="/heartbeat/others/artist/${like.member_sq}">
							${like.nick }<br>
						</a>
						<c:if test="${like.cntFollow== 0}">
							<input type="button" value="+follow" onclick="following(${like.member_sq},${loginSession },'likeList${i.index }')" id="follow" >
						</c:if>
						<c:if test="${like.cntFollow>0 }">	
							<input type="button" value="-unfollow" onclick="unfollow(${like.member_sq},${loginSession },'likeList${i.index }')"id="unfollow" >
						</c:if>
						</div>
					</li>
					</c:forEach>
				</c:if>
	</ul>
	<div id="js-btn-wrap" class="btn-wrap yzpaing" style="text-align:center;" > <a href="javascript:;" class="button">더보기</a> </div>
	<div class="pagination" >
	
			<c:if test="${startPage > blockSize }">
				<a class="a" href='${pageContext.request.contextPath }/my/like?pageNum=${startPage-blockSize}'>« Prev</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a class="a active" href='${pageContext.request.contextPath }/my/like?pageNum=${i}'> ${i}</a>
			</c:forEach>
			<c:if test="${endPage < pageCnt }">
				<a class="a" href='${pageContext.request.contextPath }/my/like?pageNum=${startPage+blockSize}'>Next »</a>
			</c:if>
 		</div>
	</div>
<div class="contents">
	<h2 style="text-align:center;" class="subTitle">unLikes</h2><br>
		<br><br><Br>
	<ul class="glul">
		<c:if test="${unList==null ||unList.size()==0}">
			리스트가 없습니다.
		</c:if>
			<c:if test="${unList!=null }">
			<c:forEach var="unlike" items="${unList}" varStatus="i">
				<li>
				<div id="unlikeList${i.index }">
				<c:if test="${unlike.code_meaning == '언라이크앨범' }">
					<div class="likeAlbum">
						<a href="/heartbeat/others/album/${unlike.album_sq}">
							<%-- <input type="hidden" id="music_sq${i.index }" value="${like.album_sq}"> --%>
							<img src="${pageContext.request.contextPath }/resources/img/album/${unlike.img_path }.png" class="albumImg"><br>
						</a>
						<a href="#">
							<img src="${pageContext.request.contextPath }/resources/img/profile/dislike.png" class="glul-img" onclick="unLikeCancel(${unlike.music_like_sq},'${unlike.code_meaning }','unlikeList${i.index }')">
						</a>
						${unlike.like_Count }<br>
					</div>
				</c:if>
				<c:if test="${unlike.code_meaning == '언라이크곡' }">
					<div class="likeMusic">
						<a href="/heartbeat/others/music/${unlike.music_sq}">
							<%-- <input type="hidden" id="music_sq${i.index }" value="${like.music_sq}"> --%>				
							<img src="${pageContext.request.contextPath }/resources/img/album/${unlike.img_path }.png" class="albumImg" style="border-radius: 50%;"><br>
						</a>
						<a href="#">
							<img src="${pageContext.request.contextPath }/resources/img/profile/dislike.png" class="glul-img" onclick="unLikeCancel(${unlike.music_like_sq},'${unlike.code_meaning }','unlikeList${i.index }')">
						</a>
						${unlike.like_Count }<br>
					</div>
				</c:if>
					
					${unlike.album_nm }<br>
					
					<a href="/heartbeat/others/artist/${unlike.member_sq}">
						${unlike.nick }<br>
					</a>
					<c:if test="${unlike.cntFollow== 0}">
						<input type="button" value="+follow" onclick="following(${unlike.member_sq},${loginSession },'unlikeList${i.index }')" id="follow" >
					</c:if>
					<c:if test="${unlike.cntFollow>0 }">	
						<input type="button" value="-unfollow" onclick="unfollow(${unlike.member_sq},${loginSession },'unlikeList${i.index }')"id="unfollow" >
					</c:if>
					</div>
				</li>
			</c:forEach>
		</c:if>
	</ul>
	
<div class="pagination" >
			<c:if test="${startPage > blockSize }">
				<a class="a" href='${pageContext.request.contextPath }/my/like?pageNum=${startPage-blockSize}'>« Prev</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a class="a active" href='${pageContext.request.contextPath }/my/like?pageNum=${i}'> ${i}</a>
			</c:forEach>
			<c:if test="${endPage < pageCnt }">
				<a class="a" href='${pageContext.request.contextPath }/my/like?pageNum=${startPage+blockSize}'>Next »</a>
			</c:if>
 		</div>
	</div>
</div>
</div>

</body>
