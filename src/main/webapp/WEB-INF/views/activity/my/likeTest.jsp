<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/Jan.js"></script>

<style type="text/css">
.box {
	margin-left: 7%;
	margin-right: 7%;
}
.box {
	margin-left: 7%;
	margin-right: 7%;
}

.banner {
	padding-left: 15%;
}
.bannerimg {
	width: 1000px;
	height : 698px;
}

.contents {
 	margin-bottom : 25%;
 	
}

.glul-img {
	width : 30px;
	height : 30px;
}
.a {
	position: absolute;
	width: 100%;
	height: 100%;
	border-style: none;
}

.glul {
	list-style: none;
	padding: 0;
	border-style: none;
	width: 100%;
	height: 200px;
	
}
.glul li {
	width: 13%;
	height: 100%;
	margin-left: 5%;
	margin-bottom : 8%;
	display: inline-block;
	text-align : center;
/* 	border-style: solid;
	border-width: 1px; */
}

.subTitle:hover {
	color : red;
	text-decoration: underline;
}

.albumImg {
	width: 70%;
	margin-left: 10%;
	border-style: solid;
	border-width : 1px;
	border-color : silver;
}

.albumImg:hover {
	border-color : red;
	
}

</style>
</head>
<body>
<button onclick="goto('/home')">Home</button>	
<Br><Br>
<div class="box">
<div class="contents">
	<h2 style="text-align:center;" class="subTitle">Likes</h2><br>
		<h6 style="color:gray;">Hear the tracks you’ve liked:</h6>
		<br><br><Br>
	<ul class="glul">
			<c:if test="${list==null ||list.size()==0}">
				리스트가 없습니다.
			</c:if>
			
			<c:if test="${list!=null }">
				<c:forEach var="like" items="${list}" varStatus="i">
					<li>
					<c:if test="${like.code_meaning == '앨범' }">
						<div class="likeAlbum">
							<a href="/heartbeat/others/album/${like.album_sq}">
								<%-- <input type="hidden" id="music_sq${i.index }" value="${like.album_sq}"> --%>
								<img src="${pageContext.request.contextPath }/resources/img/album/${like.img_path }.jpg" class="albumImg"><br>
							</a>
							<a href="#">
								<img src="${pageContext.request.contextPath }/resources/img/profile/like.png" class="glul-img" onclick="like_func(${like.music_like_sq},'${like.code_meaning }')">
							</a>
							${like.like_Count }<br>
						</div>
					</c:if>
					
					<c:if test="${like.code_meaning == '곡' }">
						<div class="likeMusic">
							<a href="/heartbeat/others/music/${like.music_sq}">
								<%-- <input type="hidden" id="music_sq${i.index }" value="${like.music_sq}"> --%>				
								<img src="${pageContext.request.contextPath }/resources/img/album/${like.img_path }.jpg" class="albumImg" style="border-radius: 50%;"><br>
							</a>
							<a href="#">
								<img src="${pageContext.request.contextPath }/resources/img/profile/like.png" class="glul-img" onclick="like_func(${like.music_like_sq},'${like.code_meaning }')">
							</a>
							${like.like_Count }<br>
						</div>
					</c:if>
					
						${like.album_nm }<br>
						<a href="/heartbeat/others/artist/${like.member_sq}">
							${like.nick }<br>
						</a>
						<c:if test="${like.cntFollow== 0}">
							<input type="button" value="+follow" onclick="following(${like.member_sq},${loginSession })" id="follow" >
						</c:if>
						<c:if test="${like.cntFollow>0 }">	
							<input type="button" value="-unfollow" onclick="unfollow(${like.member_sq},${loginSession })"id="unfollow" >
						</c:if>
					</li>
			</c:forEach>
		</c:if>
	</ul>
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
				<c:if test="${unlike.code_meaning == '언라이크앨범' }">
					<div class="likeAlbum">
						<a href="/heartbeat/others/album/${unlike.album_sq}">
							<%-- <input type="hidden" id="music_sq${i.index }" value="${like.album_sq}"> --%>
							<img src="${pageContext.request.contextPath }/resources/img/album/${unlike.img_path }.jpg" class="albumImg"><br>
						</a>
						<a href="#">
							<img src="${pageContext.request.contextPath }/resources/img/profile/dislike.png" class="glul-img" onclick="unLikeCancel(${unlike.music_like_sq},'${unlike.code_meaning }')">
						</a>
						${unlike.like_Count }<br>
					</div>
				</c:if>
				<c:if test="${unlike.code_meaning == '언라이크곡' }">
					<div class="likeMusic">
						<a href="/heartbeat/others/music/${unlike.music_sq}">
							<%-- <input type="hidden" id="music_sq${i.index }" value="${like.music_sq}"> --%>				
							<img src="${pageContext.request.contextPath }/resources/img/album/${unlike.img_path }.jpg" class="albumImg" style="border-radius: 50%;"><br>
						</a>
						<a href="#">
							<img src="${pageContext.request.contextPath }/resources/img/profile/dislike.png" class="glul-img" onclick="unLikeCancel(${unlike.music_like_sq},'${unlike.code_meaning }')">
						</a>
						${unlike.like_Count }<br>
					</div>
				</c:if>
					
					${unlike.album_nm }<br>
					
					<a href="/heartbeat/others/artist/${unlike.member_sq}">
						${unlike.nick }<br>
					</a>
					<c:if test="${unlike.cntFollow== 0}">
						<input type="button" value="+follow" onclick="following(${unlike.member_sq},${loginSession })" id="follow" >
					</c:if>
					<c:if test="${unlike.cntFollow>0 }">	
						<input type="button" value="-unfollow" onclick="unfollow(${unlike.member_sq},${loginSession })"id="unfollow" >
					</c:if>
				</li>
			</c:forEach>
		</c:if>
	</ul>
</div>
</div>

</body>
