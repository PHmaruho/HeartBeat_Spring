<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>disCoverList</title>
<style type="text/css">
	img{width:150px;}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/main.js"></script>
<script type="text/javascript">
	function discoverMusicShare(v){
		alert(v);
	}
</script>
</head>
<body>
	<h2>discover List</h2>
	<p>
			Result With Artist [ 
				<c:forEach var="art" items="${ artist}">
					/${art }
				</c:forEach>
				] Title [
				<c:forEach var="tit" items="${title }">
					/${tit }
				</c:forEach>
				] Tag [
				<c:forEach var="tag" items="${tag }">
					/${tag}
				</c:forEach>
				]
		<p>
	
	<c:if test="${discoverList==null || discoverList.size()==0}">
		검색 결과가 없습니다.
	</c:if>
	
	<c:if test="${ discoverList!=null }">
		<table border="1">
		<c:forEach var="list" items="${discoverList}" varStatus="i">
			<tr>
				<td colspan="8">
					<a href="/heartbeat/others/music/${list.music_sq}">
					<img src="${pageContext.request.contextPath }/resources/img/album/${ list.img_path }.jpg"></a><br>
						<%-- img_path: ${ list.img_path }<Br> --%>
						 앨범명: ${list.album_nm }<br>
				</td>
	
				<td>
					<!-- music_sq:  ${list.music_sq}<br>-->
					닉네임: ${list.nick }<br>
					곡명: ${list.music_nm }<br>
					<!-- equalizer??  <br> -->
					발매일: 
						<fmt:formatDate value="${list.release_dt }" pattern="yyyy.MM.dd"/>
					<br>								<!-- musicShare로 바꾸기!!!!! -->
					<%-- <input type="button" value="공유" onclick="musicShare(${list.music_sq})">  
					<button onclick="goto('/others/song/${list.music_sq }')">댓글</button> --%>		
					<img src="${pageContext.request.contextPath }/resources/img/profile/like.png" style="width:20px;">${list.music_like }
				</td>
			</tr>
			<p>
		</c:forEach>
		</table>
	</c:if>
</body>
</html>