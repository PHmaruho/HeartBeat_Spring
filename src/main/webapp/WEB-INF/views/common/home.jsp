<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/Jan.js"></script>
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
<div class="box">
	<div class="product_con">
<!-- 	<ul class="product_list">
 -->	<!-- <h2> Main List Testing</h2> -->
		<img src="${pageContext.request.contextPath }/resources/img/banner/mainBanner4.png" class="bannerimg">
		<%-- <li class="hli"><img src="${pageContext.request.contextPath }/resources/img/banner/mainBanner1.png" class="bannerimg" ></li>
		<li class="hli"><img src="${pageContext.request.contextPath }/resources/img/banner/mainBanner2.png" class="bannerimg" ></li>
		<li class="hli"><img src="${pageContext.request.contextPath }/resources/img/banner/mainBanner3.png" class="bannerimg" ></li> --%>
	<!-- </ul> -->
	</div>
	<br><br><br>
	
<div class="contents">
	<h6 style="color:gray;" >Up-and-coming tracks on SoundCloud :</h6>
		<br><br>
	<ul class="glul">
		<c:forEach var="album" items="${newList}" varStatus="i">
			<li>
			<div id="popAlbum${i.index }">
			<div class="likeAlbum">
			<a onclick="goto('/others/music/${album.music_sq}')">
				<input type="hidden" id="music_sq${i.index }" value="${album.music_sq}">
			<img src="${pageContext.request.contextPath }/resources/img/album/${album.img_path }.png" class="albumImg" ></a>
				<%-- <a>
					<img src="${pageContext.request.contextPath }/resources/img/profile/dislike.png" class="glul-img" onclick="likeAlbum(${album.album_sq},${loginSession },'popAlbum${i.index }')">
				</a> --%>
					<br>
					<a href="/heartbeat/others/music/${album.music_sq}" class="music_nm">${album.album_nm }</a>
					<br>
					<a href="/heartbeat/others/artist/${album.member_sq}" class="member_nick">
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
<%-- <div class="contents">
	<h2 style="text-align:center;" class="subTitle">Popular List</h2>
	<br><br>
		<ul class="glul">
			<c:forEach var="album" items="${likeList }" varStatus="i">
				<li>
					<a onclick="goto('/others/music/${album.music_sq}')">
					<input type="hidden" id="music_sq${i.index }" name="music_sq${i.index }" value="${album.music_sq}">
					<img src="resources/${album.img_path }.png" class="albumImg"></a><br>
					<br>
					<a href="/heartbeat/others/music/${album.music_sq}" class="music_nm">${album.album_nm }</a>
					<br>
					${album.nick }<br>
					<img src="resources/img/profile/like.png" class="glul-img">
					${album.album_like }<br>
							<input type="button" value="공유" onclick="mainListShare(${i.index})"></td>
					
				</li>
			</c:forEach>
		</ul>
	</div> --%>
	<div class="janjan">
<!-- 	<ul class="product_list">
 -->	<!-- <h2> Main List Testing</h2> -->
 		<p>Never stop listening<br>
		SoundCloud is available on Web, iOS, Android,<br>
		Sonos, Chromecast, and Xbox One.</p>   
		<img src="${pageContext.request.contextPath }/resources/img/banner/mainBanner2.png" class="janImg" >
		<%-- <li class="hli"><img src="${pageContext.request.contextPath }/resources/img/banner/mainBanner1.png" class="bannerimg" ></li>
		<li class="hli"></li>
		<li class="hli"><img src="${pageContext.request.contextPath }/resources/img/banner/mainBanner3.png" class="bannerimg" ></li> --%>
	<!-- </ul> -->
	</div>
	<br><br>
</div>
</body>
