<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jsy.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/jsy/search.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:if test="${list==null|| list.size()==0 }">
		새로운 알람이 없습니다.
	</c:if>
	
	<c:if test="${list!=null }">
		<c:forEach var="alarm" items="${ list}" varStatus="i">
			<input type="hidden" id="alarm_sq${i.index }" value="${alarm.alarm_sq }"/>
				<c:if test="${alarm.alarm_type=='팔로우' }">
					<a href="/heartbeat/others/artist/${alarm.member_sq}" class="alarmUrl">
					${alarm.nick } </a>
					님이 나를 팔로우 하셨습니다.
				</c:if>
				<c:if test="${alarm.alarm_type=='댓글' }">
					<c:if test="${alarm.reply_level==0 }">
						<a href="/heartbeat/others/artist/${alarm.member_sq}" class="alarmUrl">
						${alarm.nick }</a> 
						님이 음악 
						<a href="/heartbeat/others/music/${alarm.music_sq}" class="alarmUrl">
						${alarm.music_nm }</a> 에 댓글을 달았습니다.
					</c:if>
					<c:if test="${alarm.reply_level==1 }">
						<a href="/heartbeat/others/artist/${alarm.member_sq}" class="alarmUrl">
						${alarm.nick }</a>
						님이 음악 
						<a href="/heartbeat/others/music/${alarm.music_sq}" class="alarmUrl">
						${alarm.music_nm }</a> 에  답글을 달았습니다.							
					</c:if> 
				</c:if>
				<c:if test="${alarm.alarm_type=='음악' }">
					<a href="/heartbeat/others/artist/${alarm.member_sq}" class="alarmUrl">
					${alarm.nick }</a> 
					님이 음악  
					<a href="/heartbeat/others/music/${alarm.music_sq}" class="alarmUrl">
					${alarm.music_nm }</a> 을'좋아요' 했습니다.
				</c:if>
				<c:if test="${alarm.alarm_type=='앨범' }">
					<a href="/heartbeat/others/artist/${alarm.member_sq}" class="alarmUrl">
					${alarm.nick } </a> 님이 앨범 ' ${alarm.album_nm }' 을(를) '좋아요' 했습니다.
				</c:if>
				<input type="button" onclick="updateAlarmStatus(${alarm.alarm_sq});" value="확인" class="btn btn-secondary cwi-discover-input alarm-button"><br>
		</c:forEach>
	</c:if>
</body>
</html>