<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>disCoverList</title>
<style type="text/css">
	img{width:150px;}
</style>

<script type="text/javascript">
	function discoverMusicShare(v){
		alert(v);
	}
</script>
</head>
<body>
	<h2>discover List</h2>
	<p>
	
	Result With  
		<c:if test="${!fn.contains(word_art,'all') }">
			/ @ artist [ ${word_art } ] 
		</c:if>
		<c:if test="${!fn.contains(word_title,'all') }">
			/ * title [ ${word_title } ] 
		</c:if>
		
		<c:if test="${!fn.contains(word_tag,'all') }">
			/ # tag [ ${word_tag } ]
		</c:if>
	<p>
		
	<table border="1">
	<c:forEach var="list" items="${discoverList}" varStatus="i">
	
		<c:if test="${discoverList==null }">
			
		</c:if>
		<tr>
			<td colspan="8">
				<a href="/others/music/${list.url}">
				<img src="resources/${ list.img_path }.jpg"></a><br>
					img_path: ${ list.img_path }<Br>
					album_nm[앨범명]: ${list.album_nm }<br>
			</td>

			<td>
				music_sq[음악PK]: ${list.music_sq}<br>
				nick[가수]: ${list.nick }<br>
				노래제목: ${list.music_nm }<br>
				equalizer??  <br>
				발매일: 
					<fmt:formatDate value="${list.release_dt }" pattern="yyyy.MM.dd"/>
				<br>
				<input type="button" value="공유" onClick="discoverMusicShare(${list.music_sq})">  
				<button onclick="goto('others/song/${list.music_sq }')">댓글</button>		
				좋아요: ${list.music_like }
			</td>
		</tr>
		<p>
	</c:forEach>
	</table>
	<%-- <c:forEach var="list" items="${discoverList}">
		<table>
			<tr>
				<td>${list.img_path }</td>
				<td>${list.artist_sq}</td>
			</tr>
	
			<tr>
				<td>
					앨범이름: ${list.album_nm }  
					좋아요: <input type="button" id="good_${music_sq }" onclick="testLike(this)" value="좋아요"> ${list.music_like } 
					공유: <input type="button" id="share_${music_sq }" onclick="testShare(this)" value="공유">  
					게시일: ${list.release_dt }
				</td>
			</tr>
		</table>
	</c:forEach> --%>
	
</body>
</html>