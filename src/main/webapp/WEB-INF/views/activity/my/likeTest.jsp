<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
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
<Br><Br>
<div class="box">
<div class="contents">
	<h2 style="text-align:center;" class="subTitle">Likes</h2>
		<br><br><Br><Br>
	<ul class="glul">
		<c:forEach var="like" items="${list}" varStatus="i">
			<li>
			<a href="goto('/others/music/${like.music_sq}')">
				<input type="hidden" id="music_sq${i.index }" value="${like.music_sq}">
			<img src="${pageContext.request.contextPath }/resources/img/album/${like.img_path }.jpg" class="albumImg" ></a>
				<br>
				<br>
				${like.album_nm }<br>
				${like.nick }<br>
				<img src="${pageContext.request.contextPath }/resources/img/profile/like.png" class="glul-img">
					 ${like.albumLikeCount }<br>
				</li>
					<%-- <tr>
						<input type="button" value="공유" onclick="mainListShare(${i.index})"></td>
					</tr> --%>
		</c:forEach>
	</ul>
</div>


</div>

</div>
</body>
