<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>disCoverList</title>

<script type="text/javascript">
	function testLike(v){
		alert(v);
	}
</script>
</head>
<body>
	<h2>discover List</h2>
	music_sq, album_sq, img_path, album_nm, release_dt, 
	music_nm, music_no, music_like, music_share,artist_sq, nick
	<c:forEach var="list" items="${discoverList}">
		<table>
			<tr>
				<td>${list.img_path }</td>
				<td>${list.artist_sq}</td>
			</tr>
	
			<tr>
				<td>
					앨범이름: ${list.album_nm }  
					좋아요: <input type="button" id="${music_sq }" onclick="testLike(this)" value="좋아요"> ${list.music_like } 
					공유: <input type="button" id="${music_sq }" onclick="testShare(this)" value="공유">  
					게시일: ${list.release_dt }
				</td>
				<td>${list. }
			</tr>
		</table>
	</c:forEach>
	
</body>
</html>