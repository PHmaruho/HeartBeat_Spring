<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
</head>
<body>
	<form action="">
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
		</table>
	</form>
</body>
