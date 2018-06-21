<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<style type="text/css">
.head {
	weight : 100%;
	height : 60px;
}

.contents {
	position : relative;
}
.logoImg {
	weight : 100px;
	height : 60px;
	margin-left : 10%;
	background-color: white;
}

.cbtn {
	height : 60px;
	background-color: 282828;
	border : 0;
	outline : 0;
}
.glyphicon {
	height : 60px;
	wieght : 60px;
	border : 0;
	outline : 0;
}

</style>
<script type="text/javascript">

</script>   

</head>
<body>
<div class="head">
	<div class="contents">
		<img src="${pageContext.request.contextPath }/resources/img/banner/logo.gif" class="logoImg" >
		<button onclick="goto('/home')" class="cbtn">HOME</button>
		<button onclick="goto('/discover')" i class="glyphicon glyphicon-search"></button>
		
	</div>
	
	
		
		
		
	<div class="menuButton">
	<c:if test="${empty loginSession }">
	<button data-toggle="modal" data-target="#myModal" id="modalBtnLogin">로그인</button>
	<div id="myModal" class="modal fade" role="dialog">
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
	      </div>
	      </c:if>
	      <div class="menuButton">
		<c:if test="${!empty loginSession }">
			<button onclick="goto('/logout')">logout</button>
			<button onclick="goto('/memberInfoChangeForm')">개인정보수정</button>
			<button onclick="goto('/my/followList')">FollowList</button>
			<button onclick="goto('/my/likeTest')">내가좋아하는게뭐게</button>
			<!-- <button onclick="goto('/arrive')" >최신음악</button> -->
			<button onclick="getMemberAlarmList(${loginSession })" class="alarm">알람</button>
			<div id="alarmContent" class="alarmContent"></div>
		</c:if>
	</div>
	</div>
	</div>
</div>
</body>
