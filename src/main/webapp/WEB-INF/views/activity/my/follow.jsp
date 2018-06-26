<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/Jan.js"></script>
</head>
<body>
<br>
<br>
<br>
<div class="box">
<div class="contents">
<h6 style="color:gray;">Hear what the people you follow have posted:</h6>
<br><br>
	<ul class="glul">
	<c:if test="${following.size()==0 }">
		팔로우 한 멤버가 없습니다. <br><br><br><br><br><br><br>
	</c:if>
	
	<c:if test="${following.size()!=0 }">
		<c:forEach var="following" items="${following}">
		<li>
			<div id="following" class="following">
			 <a href="/heartbeat/others/artist/${following.member_sq }" class=" member_nick" >
			  	<img src="${pageContext.request.contextPath }/resources/img/profile/${following.member_sq }.png" class="falbumImg" >
 			<br>
			${following.nick }</a><br>
			 <c:if test="${following.cntFollow== 0}">
				<input type="button" value="following" onclick="following(${following.member_sq},${loginSession },'following${i.index }')" id="follow" class="jbtn jfollow" >
			</c:if>
			<c:if test="${following.cntFollow>0 }">	
				<input type="button" value="unfollow" onclick="unfollow(${following.member_sq},${loginSession },'following${i.index }')"id="unfollow" class="jbtn jfollow" >
			</c:if>
			</div>
		</li>
		</c:forEach>
		</c:if>
	</ul>
</div>
<br>
<div class="contents">
<h6 style="color:gray;">People who follow you :</h6><br><br>
	<ul class="glul">
	<c:if test="${follower.size()==0 }">
		나를 팔로우 한 사람이 없습니다. <br><br><br><br>
	</c:if>

	<c:if test="${follower.size()!=0 }">
		<c:forEach var="follower" items="${follower}" >
		<li>
		<div id="follower" class="following">
			 <a href="/heartbeat/others/artist/${follower.member_sq }" class=" member_nick" >
			<img src="${pageContext.request.contextPath }/resources/img/profile/${follower.member_sq }.png"class="falbumImg" >
			<br>
			${follower.nick }</a><br>
			<c:if test="${follower.cntFollow== 0}">
				<input type="button" value="following" onclick="following(${follower.member_sq},${loginSession },'follower${i.index }')" id="follow" class="jbtn jfollow">
			</c:if>
			<c:if test="${follower.cntFollow>0 }">	
				<input type="button" value="unfollow" onclick="unfollow(${follower.member_sq},${loginSession },'follower${i.index }')"id="unfollow" class="jbtn jfollow">
			</c:if>
			<br>
		</div>
		</li>
		</c:forEach>
	</c:if>
</ul>
</div>
</div>
</body>
