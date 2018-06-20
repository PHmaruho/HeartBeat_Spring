<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
</head>
<body>

haha
<br>
<h2>내가 팔로잉 ~</h2>
	<c:if test="${following.size()==0 }">
		팔로우 한 멤버가 없습니다.
	</c:if>
	<c:if test="${following.size()!=0 }">
		<c:forEach var="following" items="${following}" >
 			<img src="${pageContext.request.contextPath }/resources/img/album/${following.member_sq }.jpg" class="albumImg" ><br>
			${following.nick }<br>
			<br>
		</c:forEach>
	</c:if>

<br><br>
<h2>follower 나를 팔로우 하는 사람들</h2>
	<c:if test="${follower.size()==0 }">
		나를 팔로우 한 사람이 없습니다.
	</c:if>

	<c:if test="${follower.size()!=0 }">
		<c:forEach var="follower" items="${follower}" >
			<img src="${pageContext.request.contextPath }/resources/img/album/${follower.member_sq }.jpg" class="albumImg" ><br>
			${follower.nick }<br>
			<br>
		</c:forEach>
	</c:if>


</body>
