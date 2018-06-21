<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Heart Beat</title>
<link href="${pageContext.request.contextPath }/resources/css/csshake.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/kkh.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/jan.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/cwi.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/resources/js/jquery.3.3.1.js?v=<%=System.currentTimeMillis() %>"></script>
<script src="${pageContext.request.contextPath }/resources/js/wavesurfer.js?v=<%=System.currentTimeMillis() %>"></script>
<script src="${pageContext.request.contextPath }/resources/js/musicControlMain.js?v=<%=System.currentTimeMillis() %>"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
	.headDiv {
		height: 80px;
		width:100%;
		background-color: yellow;
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
		height: 50px;
		width: 100%;
		position: fixed;
		bottom: 0px;
		z-index: 999;
	}
</style>
<script type="text/javascript">
$(document).ready(function(){
	var i=0;
	if(i==0){
		goto("/head");
		i++;
	}
});
</script>
</head>
<body>
	<div class="headDiv" id="headDiv">
		<c:import url="/head"></c:import>
	</div>
	
	<div class="contentWrap">
		<div class="emptyDiv"></div>
		 
		<div class="contentDiv" id="contentDiv">
			<c:import url="${url }?c=${c }"></c:import>
		</div>
		
		<div class="emptyDiv"></div>
	</div>
	
	<div class="footDiv" id="footDiv">
		<c:import url="/foot"></c:import>
	</div>

	
	<input type="hidden" value="${packageName }" id="packageName">
	<script src="${pageContext.request.contextPath }/resources/js/main.js?v=<%=System.currentTimeMillis() %>"></script>
</body>
</html>