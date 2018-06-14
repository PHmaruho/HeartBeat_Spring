<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jsy.js"></script>
<!-- <link rel="stylesheet" href="resources/js/bootstrap.min.css"> -->
</head>
<body>
		<c:if test="${list==null|| list.size()==0 }">
			새로운 알람이 없습니다.
		</c:if>
		
		<c:if test="${list!=null }">
			<c:forEach var="alarm" items="${ list}" varStatus="i">
				<input type="hidden" id="alarm_sq${i.index }" value="${alarm.alarm_sq }"/>
				
				
						<p>
						<a href="javascript:void(0);" onclick="updateAlarmStatus(${i.index});" style="text-decoration:none;">
							<c:if test="${alarm.alarm_type=='팔로우' }">
								${alarm.nick } 님이 나를 팔로우 하셨습니다.<br>
							</c:if>
							<c:if test="${alarm.alarm_type=='댓글' }">
								<c:if test="${alarm.reply_level==0 }">
									${alarm.nick } 님이 음악 ${alarm.music_nm }에<br>
									댓글을 달았습니다.<br>
								</c:if>
								<c:if test="${alarm.reply_level==1 }">
									${alarm.nick } 님이 음악 ${alarm.music_nm }에<br>
									 답글을 달았습니다.<br>							</c:if> 
							</c:if>
							<c:if test="${alarm.alarm_type=='음악' }">
								${alarm.nick } 님이 음악 ${alarm.music_nm }을<br>
								'좋아요' 했습니다.<br>
							</c:if>
							<c:if test="${alarm.alarm_type=='앨범' }">
								${alarm.nick } 님이 앨범 ${alarm.album_nm }을<br>
								'좋아요' 했습니다.<br>
							</c:if>
						</a>
						<p>
			</c:forEach>
		</c:if>
		
		
</body>
</html>