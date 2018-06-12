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
		<input type="button" value="알람" onclick="getMemberAlarmList()">
		<div id="alarmContent" style="height:150px;weight:200px;display:show;">
		</div>
	<br>
</body>
</html>