<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<style type="text/css">
	.foot {
		background-color: yellow;
		height: 80px;
	}
</style>


</head>

<body>
	<div class="foot">
		<audio id="audio" controls="controls"  src="${pageContext.request.contextPath }/resources/music/Kalimba.mp3" >
		</audio>
	</div>
</body>
