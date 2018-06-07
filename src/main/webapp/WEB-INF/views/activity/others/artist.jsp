<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
</head>
<body>
	
	<c:forEach var="music" items="${list }" varStatus="status">
		sq : ${music }
		<input type="hidden" id="detailMusicSq${status.index }" value="${music }">
		<button onclick="detailPlayer[${status.index }].playPause()">play/pause</button>
		<span id="detailProgress${status.index }"></span>
		<span id="detailDuration${status.index }"></span>
		<div id="detailWaveForm${status.index }"></div>
		<c:set var="maxNum" value="${status.index }"></c:set><br>
	</c:forEach>
	<input type="hidden" id="maxDetailNum" value="${maxNum }">
<script src="${pageContext.request.contextPath }/resources/js/musicControlDetail.js?v=<%=System.currentTimeMillis() %>"></script>
</body>
