<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<script type="text/javascript">
function kkhEmailCheck() {
	var inputCheck = $("#inputCheck").val();
	var num = $("#numCheck").val();
	
	if(inputCheck == ${joinCode}){
		document.getElementById("form").submit();  
	}else{
		$("#numCheck").val(Number(num)+1);
		document.getElementById("msg").innerHTML="인증실패(3회 틀릴 시 다시 로그인해서 인증해주세요."+num+"번 시도)";
		if(num == 3){
			location.href = "/heartbeat/loginForm";
		}
	}			
}	
</script>
</head>
<body>
	<div class="cwi-discover-main">
		<div class="jumbotron cwi-discover-jumbo">
			<h1 class="display-4">인증번호 입력</h1>
			<p class="lead">입력하신 메일 주소로</p>
			<hr class="my-4">
		</div>
	</div>
	<form action="/heartbeat/emailServiceSuccess" id="form">
	<h2>인증번호 입력</h2>
		<table>
			<tr>
				<td>
					<input type="text" name="" id="inputCheck" required="required">
				</td>
				<td>
					<input type="button" value="인증" onclick="kkhEmailCheck()">
				</td>
			</tr>
			<tr>
				<td>
					<input type="hidden" value="0" id="numCheck">
					<input type="hidden" value="${member.email }" name="email">
				</td>
			</tr>
		</table>
	</form>
	<span id="msg"></span>
</body>
