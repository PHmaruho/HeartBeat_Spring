<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<c:forEach var="like" items="${list}" varStatus="i">
			<li>
			<c:if test="${like.code_meaning == '앨범' }">
				<div class="likeAlbum">
				<a href="goto('/others/album/${like.album_sq}')">
				<input type="hidden" id="music_sq${i.index }" value="${like.album_sq}">
				<img src="${pageContext.request.contextPath }/resources/img/album/${like.img_path }.jpg" class="albumImg">
				</a></div>
			</c:if>
			<c:if test="${like.code_meaning == '곡' }">
				<div class="likeMusic">
				<a href="goto('/others/music/${like.music_sq}')">
				<input type="hidden" id="music_sq${i.index }" value="${like.music_sq}">				
				<img src="${pageContext.request.contextPath }/resources/img/album/mj.jpg" class="albumImg" style="border-radius: 50%;">
				</a></div>
			</c:if>
			follow_sq: ${like.follow_sq }
				<br>
				
				<a href="#">
					<img src="${pageContext.request.contextPath }/resources/img/profile/like.png" class="glul-img" onclick="like_func(${like.music_like_sq},'${like.code_meaning }')">
				</a>
				${like.albumLikeCount }<br>
				${like.album_sq}<br>
				${like.album_nm }<br>
				${like.nick }<br>
				${like.other_sq}
				<a href="goto('/others/artist/${like.other_sq}')"></a><br>
					<c:set var="followsq" value="${like.follow_sq }"/> 
				<c:if test="${like.follow_sq == 0}">
				<input type="button" value="+follow" onclick="following(${like.other_sq},${loginSession })" id="follow" >
				
				</c:if>
				<c:if test="${like.follow_sq  >0 }">	
				<input type="button" value="-unfollow" onclick="unfollow(${like.other_sq},${loginSession })"id="unfollow" >
				</c:if>
				loginSession!!! ${loginSession }
				
				</li>
					<%-- <tr>
						<input type="button" value="공유" onclick="mainListShare(${i.index})"></td>
					</tr> --%>
		</c:forEach>
	</ul>
</div>
<div class="contents">
	<h2 style="text-align:center;" class="subTitle">UnLikes</h2>
		<br><br><Br>
	<ul class="glul">
		<c:forEach var="unlike" items="${unlist}" varStatus="i">
			<li>
			<c:if test="${unlike.code_meaning == '언라이크앨범' }">
				<div class="likeAlbum">
				<a href="goto('/others/album/${unlike.album_sq}')">
				<input type="hidden" id="music_sq${i.index }" value="${unlike.album_sq}">
				<img src="${pageContext.request.contextPath }/resources/img/album/mj.jpg" class="albumImg">
				</a></div>
			</c:if>
			<c:if test="${unlike.code_meaning == '언라이크곡' }">
				<div class="likeMusic">
				<a href="goto('/others/music/${unlike.music_sq}')">
				<input type="hidden" id="music_sq${i.index }" value="${unlike.music_sq}">				
				<img src="${pageContext.request.contextPath }/resources/img/album/mj.jpg" class="albumImg" style="border-radius: 50%;">
				</a></div>
			</c:if>
				<br>
				
				${unlike.album_nm }<br>
				${unlike.nick }<br>
				<a href="#">
					<img src="${pageContext.request.contextPath }/resources/img/profile/dislike.png" class="glul-img"  onclick="unLikeCancel(${unlike.music_like_sq},'${unlike.code_meaning }')" >
				</a>
				<br>
				${unlike.other_sq}
				</li>
					<%-- <tr>
						<input type="button" value="공유" onclick="mainListShare(${i.index})"></td>
					</tr> --%>
		</c:forEach>
	</ul>
</div>
</div>

</body>
