<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%String context = request.getContextPath();
System.out.println("context-->"+context);
%> --%>
<%
	String context = application.getRealPath("/");
    System.out.println("login context-->"+context);
%>
<head>
<script type="text/javascript">
function kkhcheck() {
	alert("실행");

	var context = $('#path').val();
	var Vemail = $('#email').val();
	var Vpw = $('#pw').val();
	alert("Vemail->"+Vemail);
	alert("Vpw->"+Vpw);
	
	$.ajax({
		url : "/do/login1",
		data : {email : Vemail,pw : Vpw},
		dataType : 'json',
		success : function(data) { // json으로 받았기
			// 때문에 .fisrtName으로 불러올 수 있음
			 console.log(data);
			if (data==null || data =="") {
				$('#msg').html("회원정보가 없습니다.");
				return false;
			} else {
				alert("실행됨");
				return true;
			}
		}
	})
}
</script>



</head>
<body>
  <!-- 	<form action="/heartbeat/loginPro" method="post" onsubmit="return kkhcheck()"> -->
 	<form action="/heartbeat/loginPro" method="post">
	context => <%=context%>
	<input type="hidden" id="path" value="<%=context%>">
		<table>
			<tr>
				<td>이메일</td>
				<td><input type="text" id="email" required="required"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="pw" required="required"></td>
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
