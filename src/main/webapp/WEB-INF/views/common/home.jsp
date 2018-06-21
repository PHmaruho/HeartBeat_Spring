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
			<button onclick="goto('/my/followList')">FollowList</button>
			<button onclick="goto('/my/likeTest')">내가좋아하는게뭐게</button>
			<!-- <button onclick="goto('/arrive')" >최신음악</button> -->
			<button onclick="getMemberAlarmList();" class="alarm">알람</button>
			<div id="alarmContent" class="alarmContent"></div>
		</c:if>
	</div>
	<br>
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
						<input type="button" value="취소" data-dismiss='modal'>
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
								<input type="button" value="취소" data-dismiss='modal'>
							</td>
						</tr>
					</table>
				</form>
		      </div>	      
		    </div>	
		  </div>
		</div>
	</c:if>
<%-- 	${kkk}<p>
	<img src="${pageContext.request.contextPath }/resources/img/album/${kkk}"> --%>
<%-- <form name="like" method="post" action="${pageContext.request.contextPath }/my/likeTest">
<div class="a">
	<ul class="glul">
		<c:forEach var="album" items="${list }"  varStatus="i">
			<li>
				<img src="${pageContext.request.contextPath }/resources/img/album/${home.img_path}.png"  id="mainList">
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
		<img src="${pageContext.request.contextPath }/resources/img/banner/mainBanner4.png" class="bannerimg" id="slide">
		<%-- <img src="${pageContext.request.contextPath }/resources/img/banner/mainBanner1.png" class="bannerimg" >
		<img src="${pageContext.request.contextPath }/resources/img/banner/mainBanner2.png" class="bannerimg" >
		<img src="${pageContext.request.contextPath }/resources/img/banner/mainBanner3.png" class="bannerimg" > --%>
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
			<a onclick="goto('/others/music/${album.music_sq}')">
				<input type="hidden" id="music_sq${i.index }" value="${album.music_sq}">
			<img src="${pageContext.request.contextPath }/resources/img/album/${album.img_path }.png" class="albumImg" ></a>
				<br>
				<br>
				<c:if test="${album.music_like_type == null }">
				<a>
					<img src="${pageContext.request.contextPath }/resources/img/profile/dislike.png" class="glul-img" onclick="likeAlbum(${album.album_sq},${loginSession },'popAlbum${i.index }')">
				</a>
				</c:if>
				<c:if test="${album.code_meaning == '앨범' }">
					<a>
						<img src="${pageContext.request.contextPath }/resources/img/profile/like.png" class="glul-img" onclick="like_func(${like.music_like_sq},'${like.code_meaning }','likeList${i.index }')">
					</a>
				</c:if>
							
					<br>
					${album.album_nm }<br>
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
