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
<script type="text/javascript">
	function mainListShare(str){
		var mainList_id='music_sq'+str;
		var mainList_value=document.getElementById(mainList_id).value.trim();
		
		$.ajax({
			url:'/heartbeat/do/mainListShare',
			data:{
				music_sq:mainList_value
				},
			success:function(){
				alert('공유되었습니다.');
			}
		});
	}
</script>
</head>
<body>

	<h2> Main List Testing</h2>
	<img src="resources/img/album/mj.jpg"><br>
	|| Image root checking 용<Br>
	
		<form id="mainListShare">
			<c:forEach var="album" items="${list }" varStatus="i">
				<table border="1">
						<tr>
							<td colspan="2"><a href="/others/music/${album.music_sq}">
								<input type="hidden" id="music_sq${i.index }" name="music_sq${i.index }" value="${album.music_sq}">
								<img src="resources/${album.img_path }.jpg"></a></td>
						</tr>
						
						<tr>
							<td>album.music_nm: ${album.music_nm }</td>
						</tr>
						
						<tr>
							<td>album.music_sq: ${album.music_sq }</td>
						</tr>
						
						<tr>
							<td colspan="2">music_like: ${album.music_like }
							<input type="button" value="공유" onclick="mainListShare(${i.index})"></td>
						</tr>
						
				</table>
				<br>
			===========================================================<br>
			</c:forEach>
		</form>
</body>
</html>