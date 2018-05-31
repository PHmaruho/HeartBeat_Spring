<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MainList</title>
<style>
	img{
		width:33%;
	}
</style>
</head>
<body>

	<h2> Main List Testing</h2>
	<img src="resources/img/album/mj.jpg"><br>
	|| Image root checking 용<Br>
	
		<c:forEach var="album" items="${list }">
			<table border="1">
					<tr>
						<td><a href="'/detail?music_sq=${album.album_sq}'">
							<input type="hidden" id= "music_sq" value="${album.album_sq}">
							${album.img_path }: 
							<img src="resources/${album.img_path }.jpg"></a></td>
					</tr>
					
					<tr>
						<td>album.music_nm: ${album.music_nm }</td>
					</tr>
					
					<tr>
						<td>music_like: ${album.music_like }</td>
					</tr>
			</table><br>
			===========================================================<br>
		</c:forEach>
</body>
</html>