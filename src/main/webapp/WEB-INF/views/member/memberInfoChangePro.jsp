<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<script type="text/javascript">
function infoChange() {
	var pw = $('#pw').val();
	var re_pw = $('#re_pw').val();
	document.getElementById("pw_msg").innerHTML="";
	document.getElementById("re_pw_msg").innerHTML="";
	if(pw == null || pw == ""){
		document.getElementById("pw_msg").innerHTML="비밀번호를 입력해주세요.";
	}else{
		if(re_pw == null || re_pw == ""){
			document.getElementById("re_pw_msg").innerHTML="비밀번호를 입력해주세요.";
		}else if(pw != re_pw){
			document.getElementById("re_pw_msg").innerHTML="비밀번호가 다릅니다.";
		}else{
			document.getElementById("form").submit();
		}
	}
}
</script>
</head>
<body>
	<form action="/heartbeat/memberInfoChangePro2" id="form" enctype="multipart/form-data" method="post">
		<table>
			<tr>
				<td>
					아이디
				</td>
				<td>
					<input type="text" placeholder="${member.email }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>
					닉네임
				</td>
				<td>
					<input type="text" placeholder="${member.nick }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>
					비밀번호
				</td>
				<td>
					<input type="password" required="required" id="pw" name="pw">
				</td>
				<td>
					<span id="pw_msg"></span>
				</td>
			</tr>
			<tr>
				<td>
					비밀번호확인
				</td>
				<td>
					<input type="password" required="required" id="re_pw" name="re_pw">
				</td>
				<td>
					<span id="re_pw_msg"></span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick="infoChange()">
				</td>
				<td>
					<input type="file" value="업로드" name="file">
				</td>
			</tr>
		</table>
	</form>
</body>
