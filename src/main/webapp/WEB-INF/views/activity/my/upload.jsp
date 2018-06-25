<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<link href="${pageContext.request.contextPath }/resources/css/ph/upload.css?test=1" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<div class="btn-group">
			<input type="button" value="업로드" onclick="location.href='/upload'" class="btn">
			<input type="button" value="업로드리스트" onclick="#" class="btn">
			<input type="button" value="수정/삭제" onclick="#" class="btn">
		</div>
		
		<br />
	
		<div class="row ph-height-70" style="border:1px solid;">
			<div class="w-50 ph-height-100" style="border:1px solid;">
				<a href="upload/album">
					앨범 등록하기
				</a>
			</div>
			<div class="w-50 ph-height-100" style="border:1px solid;">
				<a href="upload/music">
					단일곡 등록하기
				</a>
			</div>
		</div>
	</div>
</body>
