<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<link href="${pageContext.request.contextPath }/resources/css/cwi-logo.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/kihan.js?v=<%=System.currentTimeMillis() %>"></script>
<style>
.modal-backdrop {
	z-index: 990;
}

/* .modal-content{
		z-index:1010;
	} */
</style>
<script type="text/javascript">
(function() {
	if ($('#needLogin').val() == 1) {
		loginButtonClick();
	}
	
	if ($('#loginSession').val() != '') {
		getAlarmCount();
		if (alramInterval == false) {
			alramInterval = setInterval(function() {
				getAlarmCount();
				}, 1000);
		}
	} else {
		clearInterval(alramInterval);
	}
})();

function loginButtonClick() {
	$('#modalBtnLogin').click();
}

function getAlarmCount() {
	$.ajax({
		type:"POST",
		url: "/heartbeat/do/alarmCount",
		success: function(data){
			if (data > 0) {
				$('#headAlramCount').addClass('badge-danger');
				$('#headAlramCount').removeClass('badge-dark');
			} else {
				$('#headAlramCount').addClass('badge-dark');
				$('#headAlramCount').removeClass('badge-danger');
				
			}
		 	$('#headAlramCount').html(data);
		}
	});
}
</script>

</head>
<body>
	<div class="cwi-head-main">
		<div id="alarmContent" class="alarmContent"></div>
		<div class="cwi-head-logo-position">
			<p class="cwi-neon-logo-p">
				<a class="cwi-neon-logo-a" href="" onclick="goto('/home')">HEARTBEAT</a>
			</p>
		</div>
		<div class="cwi-head-buttons">
			<nav class="nav">
				<c:if test="${!empty loginSession }">
					<a class="nav-link cwi-head-white-font cwi-head-white-font" onclick="goto('/upload')">업로드</a>
					<a class="nav-link cwi-head-white-font" onclick="goto('/my/music')">내 페이지</a>
					<a class="nav-link cwi-head-white-font" onclick="goto('/discover')">탐색</a>
					<a class="nav-link cwi-head-white-font" onclick="logoutFunc()">로그아웃</a>
					<a class="nav-link cwi-head-white-font" onclick="goto('/memberInfoChangeForm')">정보수정</a>
					<a class="nav-link cwi-head-white-font" onclick="getMemberAlarmList()">알람</a>
					<span id="headAlramCount" class="badge badge-pill badge-danger"></span>
				</c:if>
				<c:if test="${empty loginSession }">
					<a class="nav-link cwi-head-white-font" onclick="goto('/discover')">탐색</a>
					<a data-toggle="modal" data-target="#myModal" id="modalBtnLogin" class="nav-link cwi-head-white-font">로그인</a>
					<div id="myModal" class="modal fade" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">로그인</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="modal-body">
									<form action="/heartbeat/loginPro" method="post" id="log_kkhform">
										<table>
											<tr>
												<td>이메일</td>
												<td><input type="text" id="log_email" name="email" required="required"></td>
												<td><span id="log_email_msg"></span></td>
											</tr>
											<tr>
												<td>비밀번호</td>
												<td><input type="password" id="log_pw" name="pw" required="required"></td>
												<td><span id="log_pw_msg"></span></td>
											</tr>
											<tr>
												<td colspan="2"><span id="log_msg"></span></td>
											</tr>
											<tr>
												<td colspan="2">
													<input type="button" value="로그인" onclick="kkhcheck()">
													<input type="button" value="취소" data-dismiss='modal'>
												</td>
											</tr>
										</table>
										<input type="hidden" name="loginUrl" id="loginUrl">	<!-- cwi 로그인완료시 원래 위치로 -->
									</form>
								</div>
							</div>
						</div>
					</div>
			
					<a data-toggle="modal" data-target="#myModal2" id="joinBtn" class="nav-link cwi-head-white-font">회원가입</a>
					<div id="myModal2" class="modal fade" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">회원가입</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="modal-body">
									<form action="/heartbeat/joinPro" method="post" id="kkhform">
										<table>
											<tr>
												<th>이메일</th>
												<td><input type="text" name="email" id="email" required="required"></td>
												<td><span id="email_msg"></span></td>
											</tr>
											<tr>
												<td colspan="2"><span id="email_validate"></span></td>
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
												<td colspan="2"><input type="button" id="join_btn" value="회원가입" onclick="kkhjoin()">
												<input type="button" value="취소" data-dismiss='modal'></td>
											</tr>
										</table>
									</form>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</nav>
		</div>
	</div>
</body>
