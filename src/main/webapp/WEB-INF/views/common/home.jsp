<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<script type="text/javascript">

function like_func() {
	var frm_read = $(frm_read);
	var target_sq = $('#target_sq',frm_read).val();
	//var member_sq = $('#member_sq',frm_read).varl();
	console.log("target_sq, member_sq :"+target_sq+","+member_sq);
$.ajax({
	url:"/do/like",
	type: "GET",
	cache: false,
	dataType: "json",
	data: 'target_sq='+target_sq,
	success: function(data) {
		var msg ='';
		var like_img='';
		msg += data.msg;
		alert(msg);
		
		if(data.like_check == 0 ) {
			like_img="resources/img/profile/dislike.png";
		} else {
			like_img="resources/img/profile/like.png"
		}
		$('#like_img',frm_read).attr('src',like_img);
		$('#like_cnt').html(data.like_cnt);
		$('#like_check').html(data.like_check);
	},
	error : function(request,status,error) {
		alert("code:"+request.status+"|n"+"message:"+request.responseText+"|n"+"error:"+error);
	}
});
}

window.onfocus=function(){
	}
	window.onload=function(){
	 window.focus(); // 현재 window 즉 익스플러러를 윈도우 최상단에 위치
	window.moveTo(0,0); // 웹 페이지의 창 위치를 0,0 (왼쪽 최상단) 으로 고정
	window.resizeTo(1280,800); // 웹페이지의 크기를 가로 1280 , 세로 800 으로 고정(확장 및 축소)
	window.scrollTo(0,250); // 페이지 상단 광고를 바로 볼 수 있게 스크롤 위치를 조정
	}

</script>
<style type="text/css">
.a {
	position: absolute;
	width: 100%;
	height: 100%;
	border-style: none;
}

.glul {
	list-style: none;
	margin-top: 10%;
	padding: 0;
	border-style: none;
	width: 100%;
	height: 200px;
}
.glul li {
	width: 13%;
	height: 100%;
	margin-left: 5%;
	margin-bottom : 10%;
	display: inline-block;
	/* 	border-style: solid;
	border-width: 1px; */
}

.glul li img {
	width: 80%;
	height: 100%;
	margin-left: 10%;
}

</style>
</head>
<body>
	<c:if test="${!empty loginSession }">
		<button onclick="goto('/logout')">logout</button>
		<button onclick="goto('/memberInfoChangeForm')">개인정보수정</button>
	</c:if>
	<button onclick="goto('/others/artist/0')">아티스트</button>
<br>
	<button onclick="goto('/test2')">to test2</button>
	<button onclick="goto('/test3')">to test3</button>
	<c:if test="${empty loginSession }">
	<button onclick="goto('/loginForm')">to login</button>	
	</c:if>
	<button onclick="goto('/arrive')" >최신음악</button>
	<button onclick="goto('/my/likeTest')">like</button>
	
<%-- 	${kkk}<p>
	<img src="${pageContext.request.contextPath }/resources/img/album/${kkk}"> --%>
<form name="like" method="post" action="${pageContext.request.contextPath }/my/likeTest">
<div class="a">
	<ul class="glul">
		<c:forEach var="home" items="${list }"  varStatus="i">
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
		</c:forEach>
	</ul>
	</div>
</form>
	<button onclick="goto('/others/music/302')">음악상세</button>
	<form id="form">
		<input type="text" name="txt">
		<input type="password" name="pw">
		<input type="button" value="/test3" onclick="toform('/test3', 'form')">
	</form>
</body>
