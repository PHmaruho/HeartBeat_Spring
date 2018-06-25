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
	비밀번호확인

	<input type="password" id="pw" name="pw" required="required">
	<input type="button" value="확인" onclick="kkhPwCheck()">
	<input type="button" value="취소" onclick="goto('/')">
	<br>
	<input type="hidden" onclick="goto('/memberInfoChangePro?email=${member.email}&nick=${member.nick }&r=1')" id="goto">
	<span id="msg"></span>

</body>
