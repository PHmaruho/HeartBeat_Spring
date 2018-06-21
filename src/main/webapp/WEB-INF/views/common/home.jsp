<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/Jan.js"></script>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jsy.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/jsy/search.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Gloria+Hallelujah|Slabo+27px" rel="stylesheet">
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
 	margin-bottom : 3%;
 	
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
	height: auto;
	
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
	height : 150px;
	margin-left: 10%;
	border-style: solid;
	border-width : 1px;
	border-color : silver;
}

.albumImg:hover {
	border-color : red;
	
}


#joinBtn{
	display:none;
}

#modalBtnLogin{
	display:none;
}

</style>
</head>
<body>
	<div class="menuButton">
		<button onclick="goto('/discover')">검색</button>	
		<c:if test="${!empty loginSession }">
<!-- 			<button onclick="goto('/logout')">logout</button>
			<button onclick="goto('/memberInfoChangeForm')">개인정보수정</button> -->
			<button onclick="goto('/my/followList')">FollowList</button>
			<button onclick="goto('/my/likeTest')">내가좋아하는게뭐게</button>
			<!-- <button onclick="goto('/arrive')" >최신음악</button> -->
			<button onclick="getMemberAlarmList();" class="alarm">알람</button>
			<div id="alarmContent" class="alarmContent"></div>
		</c:if>
	</div>
	<br>
	
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
		<%-- <img src="${pageContext.request.contextPath }/resources/img/banner/mainBanner1.jpg" class="bannerimg" >
		<img src="${pageContext.request.contextPath }/resources/img/banner/mainBanner2.jpg" class="bannerimg" >
		<img src="${pageContext.request.contextPath }/resources/img/banner/mainBanner3.jpg" class="bannerimg" > --%>
	</div>
	</div> 

<br><br><br><br>
<div class="contents">
	<h2 style="text-align:center;" class="subTitle">New Product List</h2>
		<br><br>
	<ul class="glul">
		<c:forEach var="album" items="${newList}" varStatus="i">
			<li>
			<div id="popAlbum${i.index }">
			<div class="likeAlbum">
			<a href="goto('/others/music/${album.music_sq}')">
				<input type="hidden" id="music_sq${i.index }" value="${album.music_sq}">
			<img src="${pageContext.request.contextPath }/resources/img/album/${album.img_path }.jpg" class="albumImg" ></a>
				<br>
				<br>
				<c:if test="${album.music_like_type == null }">
				<a href="#">
					<img src="${pageContext.request.contextPath }/resources/img/profile/dislike.png" class="glul-img" onclick="likeAlbum(${album.album_sq},${loginSession },'popAlbum${i.index }')">
				</a>
				</c:if>
				<c:if test="${album.code_meaning == '앨범' }">
					<a href="#">
						<img src="${pageContext.request.contextPath }/resources/img/profile/like.png" class="glul-img" onclick="like_func(${like.music_like_sq},'${like.code_meaning }','likeList${i.index }')">
					</a>
				</c:if>
							
					<br>
					${album.album_nm }<br>
					<a href="/heartbeat/others/artist/${album.member_sq}">
					${album.nick }
					</a><br>
				</div>
				</div>
			</li>
					<%-- <tr>
						<input type="button" value="공유" onclick="mainListShare(${i.index})"></td>
					</tr> --%>
		</c:forEach>
	</ul>
</div>

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
