<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

</head>
<body>
	<form action="/loginPro" method="post">
		<table>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="취소"> <input
					type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
</body>
