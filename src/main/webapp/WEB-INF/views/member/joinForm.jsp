<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
</head>
<body>
	<form action="/heartbeat/joinPro" method="post" id="kkhform">
		<table>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" id="email" required="required"></td>
				<td><span id="email_msg"></span></td>
			</tr>
			<tr>
				<td colspan="2">
					<span id="email_validate"></span>
				</td>
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
				<td colspan="2">
					<input type="button" id="join_btn" value="회원가입" onclick="kkhjoin()">
					<input type="button" value="취소"> 
				</td>
			</tr>
		</table>
	</form>
</body>