<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

#joinBtn{
	display:none;
}

#modalBtnLogin{
	display:none;
}
</style>
</head>
<body>
	<c:if test="${empty loginSession }">
	<button data-toggle="modal" data-target="#myModal" id="modalBtnLogin">로그인</button>
	<div id="myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	    <!-- Modal content-->
	    <div class="modal-content">
	      <!-- <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Modal Header</h4>
	      </div> -->
	      <div class="modal-body">
	        <form action="/heartbeat/loginPro" method="post" id="log_kkhform">
				<table>
					<tr>
						<td>이메일</td>
						<td><input type="text" id="log_email" name="email"
							required="required"></td>
							<td>
								<span id="log_email_msg"></span>
							</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" id="log_pw" name="pw"
							required="required"></td>
							<td>
								<span id="log_pw_msg"></span>
							</td>
					</tr>
					<tr>
						<td colspan="2"><span id="log_msg"></span></td>
					</tr>
					<tr>
						<td colspan="2"><input type="button" value="로그인" onclick="kkhcheck()">
						<input type="button" value="취소" onclick="location.href='/heartbeat'">
						</td>
					</tr>
				</table>
			</form>
	      </div>
	      <!-- <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div> -->
	    </div>
	  </div>
	</div>	
	
	<input type="button" value="회원가입" data-toggle="modal" data-target="#myModal2" id="joinBtn">
		<div id="myModal2" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		    <!-- Modal content-->
		    <div class="modal-content">      
		      <div class="modal-body">
		        <form action="/heartbeat/joinPro" method="post" id="kkhform">
					<table>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="email" id="email" required="required"></td>
							<td><span id="email_msg"></span></td>
						</tr>
						<tr>
							<td colspan="2">
								<span id="email_validate"></span>
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="pw" id="pw" required="required"></td>
							<td><span id="pw_msg"></span></td>
						</tr>
						<tr>
							<th>비밀번호확인</th>
							<td><input type="password" id="re_pw" required="required"></td>
							<td><span id="repw_msg"></span></td>
						</tr>
						<tr>
							<th>별명</th>
							<td><input type="text" name="nick" id="nick" required="required"></td>
							<td><span id="nick_msg"></span></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="button" id="join_btn" value="회원가입" onclick="kkhjoin()">
								<input type="button" value="취소" onclick="location.href='/heartbeat'"> 
							</td>
						</tr>
					</table>
				</form>
		      </div>	      
		    </div>	
		  </div>
		</div>
	</c:if>
	<button onclick="goto('/arrive')" >최신음악</button>
	<button onclick="goto('/my/likeTest')">like</button>
	
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

<h2> Main List Testing</h2>
	<img src="resources/img/profile/mainBanner.jpg" width="" height=""><br>
	|| Image root checking 용<Br>
	
	<form id="mainListShare">
	<h2>New Product List</h2>
			<c:forEach var="album" items="${newList}" varStatus="i">
				<table border="1">
						<tr>
							<td colspan="2"><a onclick="goto('/others/music/${album.music_sq}')">
								<input type="hidden" id="music_sq${i.index }" value="${album.music_sq}">
								<img src="resources/img/album/${album.img_path }.jpg"></a></td>
						</tr>
						
						<tr>
							<td>album.music_nm: ${album.music_nm }</td>
						</tr>
						
						<tr>
							<td>album.music_sq: ${album.music_sq }</td>
						</tr>
						
						<tr>
							<td colspan="2">music_like: ${album.music_like }
							<%-- <input type="button" value="공유" onclick="mainListShare(${i.index})"></td> --%>
						</tr>
						
				</table>
				<br>
			===========================================================<br>
			</c:forEach>
			<p>
			<h2>Popular List</h2>
			<c:forEach var="album" items="${likeList }" varStatus="i">
				<table border="1">
						<tr>
							<td colspan="2"><a onclick="/others/music/${album.music_sq}">
								<input type="hidden" id="music_sq${i.index }" name="music_sq${i.index }" value="${album.music_sq}">
								<img src="resources/${album.img_path }.jpg"></a></td>
						</tr>
						
						<tr>
							<td>album.music_nm: ${album.music_nm }</td>
						</tr>
						
						<tr>
							<td>album.music_sq: ${album.music_sq }</td>
						</tr>
						
						<tr>
							<td colspan="2">music_like: ${album.music_like }
							<input type="button" value="공유" onclick="mainListShare(${i.index})"></td>
						</tr>
						
				</table>
				<br>
			===========================================================<br>
			</c:forEach>
		</form>

	<button onclick="goto('/others/music/302')">음악상세</button>
	<form id="form">
		<input type="text" name="txt">
		<input type="password" name="pw">
		<input type="button" value="/test3" onclick="toform('/test3', 'form')">
	</form>
	
</body>
