<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<style type="text/css">
</style>
<script type="text/javascript">
var para = document.location.href.split("?");
alert(para[1]);
</script>
</head>
<body>
	<div class="container">
		<div class="btn-group">
			<input type="button" value="업로드" onclick="#" class="btn">
			<input type="button" value="업로드리스트" onclick="#" class="btn">
			<input type="button" value="수정/삭제" onclick="#" class="btn">
		</div>
		
		<br />
	
		<div class="row" style="border:1px solid;">
			<div class="w-50 h-75 center-block" style="border:1px solid;">
				<a href="#">
					앨범 등록하기
				</a>
			</div>
			<div class="w-50 h-75 center-block" style="border:1px solid;">
				<a href="#">
					단일곡 등록하기
				</a>
			</div>
		</div>
	</div>
</body>
