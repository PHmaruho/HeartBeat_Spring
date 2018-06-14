<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
</head>
<body>

haha
<br>
<h2>내가 팔로잉 ~</h2>
<c:forEach var="following" items="${following}" >
	<img src="resources/img/album/${following.member_sq }.jpg" class="albumImg" >
	<br>
	${following.member_sq }
	<br>
	${following.nick }
	<br>
	===================================
	<br>
</c:forEach>

<br><br>
<h2>follower 나를 팔로우 하는 사람들</h2>

<c:forEach var="follower" items="${follower}" >
	<img src="resources/img/album/${follower.member_sq }.jpg" class="albumImg" >
	<br>
	${follower.member_sq }
	<br>
	${follower.nick }
	<br>
	===================================
	<br>
</c:forEach>



</body>
