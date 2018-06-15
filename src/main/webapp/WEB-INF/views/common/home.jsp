<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/Jan.js"></script>

<script type="text/javascript">

/* window.onfocus=function(){
	}
	window.onload=function(){
	 window.focus(); // 현재 window 즉 익스플러러를 윈도우 최상단에 위치
	window.moveTo(0,0); // 웹 페이지의 창 위치를 0,0 (왼쪽 최상단) 으로 고정
	window.resizeTo(1280,800); // 웹페이지의 크기를 가로 1280 , 세로 800 으로 고정(확장 및 축소)
	window.scrollTo(0,250); // 페이지 상단 광고를 바로 볼 수 있게 스크롤 위치를 조정
	} */

</script>
<style type="text/css">
.box {
	margin-left: 7%;
	margin-right: 7%;
	overflow: hidden;
}

.banner {
	padding-left: 20%;
	
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
 	<c:if test="${!empty loginSession }">
		<button onclick="goto('/logout')">logout</button>
		<button onclick="goto('/memberInfoChangeForm')">개인정보수정</button>
		<button onclick="goto('/my/followList')">FollowList</button>
		<button onclick="goto('/my/likeTest')">내가좋아하는게뭐게</button>
		
		
	</c:if>
<br>
	<c:if test="${empty loginSession }">
	<button onclick="goto('/loginForm')">to login</button>	
	</c:if>
	<button onclick="goto('/arrive')" >최신음악</button>
	
<%-- 	${kkk}<p>
	<img src="${pageContext.request.contextPath }/resources/img/album/${kkk}"> --%>
<%-- <form name="like" method="post" action="${pageContext.request.contextPath }/my/likeTest">
<div class="a">
	<ul class="glul">
		<c:forEach var="album" items="${list }"  varStatus="i">
			<li>
				<img src="${pageContext.request.contextPath }/resources/img/album/${home.img_path}.jpg"  id="mainList">
				<p align="center">
				${home.album_nm }
			<br>
				${home.nick }<br>
				<input type="hidden" name="music_like_sq" value="${home.album_sq }" id="album_sq${i.index }">
				<input type="button" value="like" onclick="like_func('album_sq${i.index}');" class="btn">
				<br><br>
			</p></li>
			===========================================================<br>
		</c:forEach>
	</ul>
	</div>
</form> --%>
<br><br>
<div class="box">
	<div class="banner" id="sliderFrame">
	<div id="slider">
	<!-- <h2> Main List Testing</h2> -->
		<img src="${pageContext.request.contextPath }/resources/img/banner/mainBanner4.jpg" class="bannerimg" id="slide">
		<img src="${pageContext.request.contextPath }/resources/img/banner/mainBanner1.jpg" class="bannerimg" >
		<img src="${pageContext.request.contextPath }/resources/img/banner/mainBanner2.jpg" class="bannerimg" >
		<img src="${pageContext.request.contextPath }/resources/img/banner/mainBanner3.jpg" class="bannerimg" >
	</div>
	</div> 

<br><br><br><br>
<div class="contents">
	<h2 style="text-align:center;" class="subTitle">New Product List</h2>
		<br><br>
	<ul class="glul">
		<c:forEach var="album" items="${newList}" varStatus="i">
			<li>
			<a href="goto('/others/music/${album.music_sq}')">
				<input type="hidden" id="music_sq${i.index }" value="${album.music_sq}">
			<img src="resources/img/album/${album.img_path }.jpg" class="albumImg" ></a>
				<br>
				<br>
				${album.music_sq}<br>
				${album.album_sq}
				<br>
				<a href="#">
					<img src="${pageContext.request.contextPath }/resources/img/profile/dislike.png" class="glul-img" onclick="likeAlbum(${album.album_sq}, 704)">
				</a>
				${album.album_nm }<br>
				${album.nick }<br>
			</li>
					<%-- <tr>
						<input type="button" value="공유" onclick="mainListShare(${i.index})"></td>
					</tr> --%>
		</c:forEach>
	</ul>
</div>
		<Br><Br>
<div class="contents">
	<h2 style="text-align:center;" class="subTitle">Popular List</h2>
	<br><br>
		<ul class="glul">
			<c:forEach var="album" items="${likeList }" varStatus="i">
				<li>
					<a href="/others/music/${album.music_sq}">
					<input type="hidden" id="music_sq${i.index }" name="music_sq${i.index }" value="${album.music_sq}">
					<img src="resources/${album.img_path }.jpg" class="albumImg"></a><br>
					<br>
					${album.album_nm }<br>
					${album.nick }<br>
					<img src="resources/img/profile/like.png" class="glul-img">
					${album.album_like }<br>
<%-- 							<input type="button" value="공유" onclick="mainListShare(${i.index})"></td>
 --%>					
				</li>
			</c:forEach>
		</ul>
	</div>
</div>
<br><br><br>

</body>
