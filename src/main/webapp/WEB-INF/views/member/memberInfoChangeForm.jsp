<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<script type="text/javascript">
function kkhPwCheck(){
	if(${member.pw} == $('#pw').val()){
		$('#goto').trigger('click');
	}else{
		document.getElementById("msg").innerHTML="비밀번호가 틀렸습니다.";
		document.getElementById("pw").focus();
	}
}
</script>
</head>
<body>
	<div class="cwi-discover-main">
		<div class="jumbotron cwi-discover-jumbo">
			<h1 class="display-4">정보수정</h1>
			<p class="lead">본인확인을 위해 비밀번호를 입력해주세요.</p>
			<hr class="my-4">
		</div>
		
		<div class="form-group cwi-change-under">
			<input type="password" class="cwi-change-input" placeholder="비밀번호" id="pw" name="pw" required="required">
			<input type="button" value="확인" onclick="kkhPwCheck()" class="cwi-change-button">
		</div>
		<input type="hidden" onclick="goto('/memberInfoChangePro?email=${member.email}&nick=${member.nick }&r=1')" id="goto">
		<span id="msg"></span>
	</div>

</body>
