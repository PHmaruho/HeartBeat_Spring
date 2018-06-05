<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%String context = request.getContextPath();
System.out.println("context-->"+context);
%> --%>
<%
	String context = application.getRealPath("/");
	System.out.println("login context-->" + context);
%>
<head>
</head>
<body>
	<form action="/heartbeat/loginPro" method="post" id="kkhform">
		<table>
			<tr>
				<td>이메일</td>
				<td><input type="text" id="email" name="email"
					required="required"></td>
					<td>
						<span id="email_msg"></span>
					</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="pw" name="pw"
					required="required"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="취소"> <input
					type="button" value="로그인" onclick="kkhcheck()">
					<input type="button" value="회원가입" onclick="location.href='/heartbeat/joinForm'">
					</td>
			</tr>
			<tr>
				<td colspan="2"><span id="msg"></span></td>
			</tr>
		</table>
	</form>
</body>
