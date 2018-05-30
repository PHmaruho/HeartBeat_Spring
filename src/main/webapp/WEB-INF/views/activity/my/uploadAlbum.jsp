<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
</head>
<body>
	<div class="container">
		<div class="btn-group">
			<input type="button" value="업로드" onclick="#" class="btn">
			<input type="button" value="업로드리스트" onclick="#" class="btn">
			<input type="button" value="수정/삭제" onclick="#" class="btn">
		</div>
		
		<br />
		
		<div class="row h-50" style="border:1px solid;">
			<div class="w-25" style="border:1px solid;">
					<table border="1">
						<tr>
							<td colspan="2">
								<img alt="Album_Image" src="#" id="album_img" name="img_path" class="img-thumbnail">
							</td>
							<td colspan="2">
								<input type="file" class="btn" onclick="#" id="uploadAlbumImg">
								<input type="button" class="btn" value="삭제" onclick="#" id="deleteAlbumImg">
							</td>
						</tr>
						<tr>
							<td>앨범명</td>
							<td>
								<input type="text" name="album_nm">
							</td>
						</tr>
						<tr>
							<td>설명</td>
							<td>
								<textarea rows="10" cols="2" name="album_comment"></textarea>
							</td>
						</tr>
						
					</table>
			</div>
			<div class="w-75" style="border:1px solid;">
				<a href="/upload/music">
					단일곡 등록하기
				</a>
			</div>
		</div>
	</div>
</body>
