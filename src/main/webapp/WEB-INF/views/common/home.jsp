<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/Jan.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jsy.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/jsy/search.css" rel="stylesheet" type="text/css">
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
</head>
<body>
	<div class="menuButton">
		<button onclick="goto('/discover')">검색</button>	
		<c:if test="${!empty loginSession }">
<!-- 			<button onclick="goto('/logout')">logout</button>
			<button onclick="goto('/memberInfoChangeForm')">개인정보수정</button> -->
			<button onclick="goto('/my/follow')">FollowList</button>
			<button onclick="goto('/my/like')">내가좋아하는게뭐게</button>
			<!-- <button onclick="goto('/arrive')" >최신음악</button> -->
			<button onclick="getMemberAlarmList();" class="alarm">알람</button>
			<div id="alarmContent" class="alarmContent"></div>
		</c:if>
	</div>
	<br>

<br><br>
<div class="box">
	<div class="banner" id="sliderFrame">
	<div id="slider">
	<!-- <h2> Main List Testing</h2> -->
		<img src="${pageContext.request.contextPath }/resources/img/banner/mainBanner4.png" class="bannerimg" id="slide">
		<%-- <img src="${pageContext.request.contextPath }/resources/img/banner/mainBanner1.png" class="bannerimg" >
		<img src="${pageContext.request.contextPath }/resources/img/banner/mainBanner2.png" class="bannerimg" >
		<img src="${pageContext.request.contextPath }/resources/img/banner/mainBanner3.png" class="bannerimg" > --%>
	</div>
	</div> 
<div class="contents">
	<h2 style="text-align:center;" class="subTitle">New Product List</h2>
		<br><br>
	<ul class="glul">
		<c:forEach var="album" items="${newList}" varStatus="i">
			<li>
			<div id="popAlbum${i.index }">
			<div class="likeAlbum">
			<a onclick="goto('/others/music/${album.music_sq}')">
				<input type="hidden" id="music_sq${i.index }" value="${album.music_sq}">
			<img src="${pageContext.request.contextPath }/resources/img/album/${album.img_path }.png" class="albumImg" ></a>
				<br>
				<br>
					<br>
					<a onclick="goto('/heartbeat/others/artist/${album.album_sq}')">
					${album.album_nm }</a><br>
					<a onclick="goto('/heartbeat/others/artist/${album.member_sq}')">
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
		<Br><Br>
<div class="contents">
	<h2 style="text-align:center;" class="subTitle">Popular List</h2>
	<br><br>
		<ul class="glul">
			<c:forEach var="album" items="${likeList }" varStatus="i">
				<li>
					<a onclick="goto('/others/music/${album.music_sq}')">
					<input type="hidden" id="music_sq${i.index }" name="music_sq${i.index }" value="${album.music_sq}">
					<img src="resources/${album.img_path }.png" class="albumImg"></a><br>
					<br>
					<a onclick="goto('/heartbeat/others/artist/${album.album_sq}')">
					${album.album_nm }</a><br>
					<a onclick="goto('/heartbeat/others/artist/${album.member_sq}')">
					${album.nick }</a><br>
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
