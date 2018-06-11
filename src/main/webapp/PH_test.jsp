<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery.3.3.1.js"></script>
<style type="text/css">
div {
	border: 1px solid;
	position: relative;
	padding: auto auto auto auto;
}
.parent1{
	width: 500px;
}
.parent2{
	width: 300px;
}
.result{
	width: 500px;
}
</style>

<script type="text/javascript">
	function action(){
		let text = $('.parent2').eq(0).html().indexOf("ell").parent();
		alert(text);
	}
</script>
</head>
<body>
<div class="parent1">
	<div class="parent2">
		<span class="span1">
			hello
		</span>
	</div>
</div>

<br>

<input type="button" onclick="action()">
<br>
<div class="result">

</div>
</body>
</html>