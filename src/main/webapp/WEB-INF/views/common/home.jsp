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
	margin: 0;
	padding: 0;
	border-style: none;
	width: 100%;
	height: 300px;
}

</style>
</head>
<body>
	<c:if test="${!empty loginSession }">
		<button onclick="goto('/logout')">logout</button>
		<button onclick="goto('/memberInfoChangeForm')">개인정보수정</button>
	</c:if>
	<button onclick="goto('/test2')">to test2</button>
	<button onclick="goto('/test3')">to test3</button>
	<c:if test="${empty loginSession }">
	<button onclick="goto('/loginForm')">to login</button>	
	</c:if>
	<button onclick="goto('/arrive')" >최신음악</button>
	<a href="goto('/trend')">인기음악</a>
	
<%-- 	${kkk}<p>
	<img src="${pageContext.request.contextPath }/resources/img/album/${kkk}"> --%>
<div class="a">
	<ul class="glul">
		<c:forEach var="home" items="${list }"  varStatus="i">
			<li>
				<%-- <a href="${pageContext.request.contextPath }/resources/img/album/${home.album_sq}"> --%>
				<img src="${pageContext.request.contextPath }/resources/img/album/${home.img_path}.jpg" width="120px" height="110px" id="mainList">
				<p align="center">
				<%-- <a href="${pageContext.request.contextPath }/resources/img/album/${home.album_sq}"> --%>
			${home.album_nm }
			<br>
				<%-- <a href="${pageContext.request.contextPath }/resources/img/album/${home.album_sq}"> --%>
				${home.member_sq }<br>
			</p></li>
		</c:forEach>
	</ul>
		<form name="like" method="post" action="${pageContext.request.contextPath }/my/likeTest">
			<input type="hidden" name="music_like_sq" value="${home.album_sq }" id="album_sq${i.index }">
				<img src="${pageContext.request.contextPath }/resources/img/profile/like.png" width="30px" height="30" id="like_img">
			<input type="button" value="like" onclick="like_func('music_like_sq${i.index}');" class="btn">
		
		</form>
	</div>
	<button onclick="goto('/others/music/302')">음악상세</button>
	<form id="form">
		<input type="text" name="txt">
		<input type="password" name="pw">
		<input type="button" value="/test3" onclick="toform('/test3', 'form')">
	</form>
<<<<<<< HEAD
=======
	
>>>>>>> develop
</body>
