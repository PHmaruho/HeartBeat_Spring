<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
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
	margin-top: 3%;
	padding: 0;
	border-style: none;
	width: 100%;
	height: 200px;
}
.glul li {
	width: 13%;
	height: 100%;
	margin-left: 5%;
	margin-bottom : 5%;
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
	<button onclick="goto('/test2')">to test2</button>
	<button onclick="goto('/test3')">to test3</button>
	
	<button onclick="goto('/arrive')" >최신음악</button>
	<a href="goto('/trend')">인기음악</a>
	
<%-- 	${kkk}<p>
	<img src="${pageContext.request.contextPath }/resources/img/album/${kkk}"> --%>
<div class="a">
	<ul class="glul">
		<c:forEach var="home" items="${list }"  varStatus="i">
			<li>
				<%-- <a href="${pageContext.request.contextPath }/resources/img/album/${home.album_sq}"> --%>
				<img src="${pageContext.request.contextPath }/resources/img/album/${home.img_path}.jpg"  id="mainList">
				<p align="center">
				<%-- <a href="${pageContext.request.contextPath }/resources/img/album/${home.album_sq}"> --%>
				${home.album_nm }
			<br>
				<%-- <a href="${pageContext.request.contextPath }/resources/img/album/${home.album_sq}"> --%>
				${home.member_sq }<br><br><br>
			</p></li>
		</c:forEach>
	</ul>
		<form name="like" method="post" action="${pageContext.request.contextPath }/my/likeTest">
			<input type="hidden" name="music_like_sq" value="${home.album_sq }" id="album_sq${i.index }">
				<img src="${pageContext.request.contextPath }/resources/img/profile/like.png" width="20px" height="20px" id="like_img">
			<input type="button" value="like" onclick="like_func('music_like_sq${i.index}');" class="btn">
		
		</form>
	</div>
	
</body>
