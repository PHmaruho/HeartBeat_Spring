<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<style type="text/css">
</style>
</head>
<body>
	<div class="container">
		<div class="btn-group">
			<input type="button" value="업로드" onclick="location.href='/upload'" class="btn">
			<input type="button" value="업로드리스트" onclick="#" class="btn">
			<input type="button" value="수정/삭제" onclick="#" class="btn">
		</div>
		
		<br />
	
		<div class="row" style="border:1px solid;">
			<div class="w-50" style="border:1px solid;">
				<a href="upload/album">
					앨범 등록하기
				</a>
			</div>
			<div class="w-50" style="border:1px solid;">
				<a href="upload/music">
					단일곡 등록하기
				</a>
			</div>
		</div>
	</div>
</body>
