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
		if (typeof alramInterval == 'undefined') {
			alramInterval = setInterval(function() {
				console.log('alramInterval');
				getMemberAlarmList2();
				getAlarmCount();
				}, 10 * 1000);	//  10초마다 알림 갱신
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
				<a class="cwi-neon-logo-a" href="#" onclick="goto('/home')">HEARTBEAT</a>
			</p>
		</div>
		<div class="cwi-head-buttons">
			<nav class="nav">
				<c:if test="${!empty loginSession }">
					<a class="nav-link cwi-head-white-font cwi-head-white-font" onclick="goto('/upload')">업로드</a>
					<a class="nav-link cwi-head-white-font cwi-head-white-font" onclick="goto('/my/like')">좋아요</a>
					<a class="nav-link cwi-head-white-font cwi-head-white-font" onclick="goto('/my/follow')">팔로우</a>
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
										<table class="cwi-login-table">
											<tr>
												<td><input type="text" id="log_email" name="email" required="required" class="form-control" placeholder="이메일"></td>
												<td rowspan="2" style="width: 102px"><input type="button" value="로그인" onclick="kkhcheck()" class="btn btn-primary cwi-login-button"></td>
											</tr>
											<tr>
												<td><input type="password" id="log_pw" name="pw" required="required" class="form-control" placeholder="비밀번호"></td>
											</tr>
											<tr>
												<td colspan="2"> <span id="log_msg"></span></td>
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
										<input type="text" name="email" id="email" required="required" class="form-control" placeholder="이메일">
										<input type="password" name="pw" id="pw" required="required" class="form-control" placeholder="비밀번호">
										<input type="password" id="re_pw" required="required" class="form-control" placeholder="비밀번호 확인">
										<input type="text" name="nick" id="nick" required="required" class="form-control" placeholder="별명">
									</form>
									<div id="join_msg"></div>
									<button id="join_btn" onclick="kkhjoin()" class="btn btn-primary">회원가입</button>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</nav>
		</div>
	</div>
</body>
