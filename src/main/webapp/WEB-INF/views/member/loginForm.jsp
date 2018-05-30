<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<script type="text/javascript" src="js/jquery.3.3.1.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
function check1() {
		alert("aa");
		/*  var email = document.getElementsByName("email");
		var pw = document.getElementsByName("pw"); 
		document.getElementById("msg").innerHTML="이메일 써라";
		 var str = "aaa";
		if(!email){
			document.getElementById("msg").innerHTML="이메일 써라";
				
		}else if(!pw){
			document.getElementById("msg").innerHTML="비밀번호 써라";
			
		} 
		 toform('/loginPro', 'form');  */
	}
</script>
</head>
<body>
	<form id="form" method="post">
		<table>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" required="required"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" required="required"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" value="취소"> 
				<input type="button" value="로그인" onclick="check1()">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<span id="msg">234</span>
				</td>
			</tr>
		</table>
	</form>
</body>
