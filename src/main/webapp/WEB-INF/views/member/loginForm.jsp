<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>

</head>
<body>
	<form action="/loginPro" method="post" onsubmit="return check()">
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
				<td colspan="2"><input type="button" value="취소"> <input
					type="submit" value="로그인"></td>
			</tr>
			<tr>
				<td colspan="2">
					<span id="msg"></span>
				</td>
			</tr>
		</table>
	</form>
</body>
