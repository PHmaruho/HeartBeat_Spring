<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Heart Beat</title>
<link href="/resources/css/bootstrap.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.headDiv {
		height: 80px;
		width:100%;
		/* background-color: yellow; */
		position: fixed;
		top: 0px;
		z-index: 999;
	}
	
	.contentWrap {
		width: 100%;
		position: relative;
		/* background-color: green; */
	}
	
	.emptyDiv {
		height: 80px;
		position: relative;
	}
	
	.footDiv {
		height: 80px;
		width: 100%;
		position: fixed;
		bottom: 0px;
	}
</style>
</head>
<body>
	<div class="headDiv">
		<c:import url="common/head.jsp"></c:import>
	</div>
	
	<div class="contentWrap">
		<div class="emptyDiv"></div>
		
		<div class="contentDiv" id="contentDiv">
			<c:import url="${url }?c=${c }"></c:import>
		</div>
		
		<div class="emptyDiv"></div>
	</div>
	
	<div class="footDiv">
		<c:import url="common/foot.jsp"></c:import>
	</div>
<script src="/resources/js/jquery.3.3.1.js"></script>
<script src="/resources/js/main.js"></script>
</body>
</html>