<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<div class="headDiv">
		<c:import url="head.jsp"></c:import>
	</div>
	
	<div class="contentDiv">
		<c:import url="${url }.jsp"></c:import>
	</div>
	
	<div class="footDiv">
		<c:import url="foot.jsp"></c:import>
	</div>
</body>
</html>
