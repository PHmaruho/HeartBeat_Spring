<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jsy.js"></script>
</head>
<body>

	<h2>Member Alarm test</h2>
	<p>
	<input type="button" value="알람" onclick="alarmContentShow()">
	<br>
	<div id="alarmContent" style="height:150px;weight:200px;display:show;">
		div id="alarmContent"<p>
		==================================<br>
		<c:if test="${list==null|| list.size()==0 }">
			새로운 알람이 없습니다.
		</c:if>
		
		<c:if test="${list!=null }">
			<c:forEach var="alarm" items="${ list}">
			
				<table border="1">
					<tr>
						<td>alarm_sq: ${alarm.alarm_sq }<td>
						<td>alarm_type: ${alarm.alarm_type }<td>
						<td>status: ${alarm.status }<td>
						<td>nick: ${alarm.nick }<td>
						<td>reply_level: ${alarm.reply_level }<td>
						<td>album_nm: ${alarm.album_nm }<td>
						<td>music_nm: ${alarm.music_nm }<td>
						
					</tr>
				</table>
			<%-- 
			<input type="hidden" name="alarm_sq" value="${alarm.alarm_sq }">
			<input type="hidden" name="member_sq" value="${alarm.member_sq }">
				
			<c:if test="${alarm.alarm_type.contains('music') }">
				
			</c:if>
				target_sq: ${alarm.target_sq }<br>
				alarm_type: ${alarm.alarm_type }<br>
				alarm_status: ${alarm.status }<br>
				===========================<br>	 --%>
			
			</c:forEach>
		</c:if>
	</div>
</body>
</html>