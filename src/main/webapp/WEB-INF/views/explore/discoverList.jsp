<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<head>
<style type="text/css">
	/* img{width:150px;} */
	.part{
		display:inline-block;
		margin-bottom: 20px;
		margin-left: auto;
		margin-right: auto;
	}
	
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/main.js"></script>
</head>
<body>
	<h2>검색결과</h2>
	<p>
			결과: Artist [ 
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
		<c:forEach var="list" items="${discoverList}" varStatus="i">
			<div class="searchResult">
				<div class="part">
					<a onclick="goto('/others/music/${list.music_sq}')">
					<img src="${pageContext.request.contextPath }/resources/img/album/${ list.img_path }.jpg" style="width:100px;"></a><br>
						<%-- img_path: ${ list.img_path }<Br> --%>
						 앨범명: ${list.album_nm }<br>
					<!-- music_sq:  ${list.music_sq}<br>-->
				</div>	
				<div class="part">
					닉네임:${list.nick } 

					<br>
					곡명: ${list.music_nm }<br>
					<!-- equalizer??  <br> -->
					발매일: 
						<fmt:formatDate value="${list.release_dt }" pattern="yyyy.MM.dd"/>
					<br>								<!-- musicShare로 바꾸기!!!!! -->
					<%-- <input type="button" value="공유" onclick="musicShare(${list.music_sq})">  
					<button onclick="goto('/others/song/${list.music_sq }')">댓글</button> --%>		
					<img src="${pageContext.request.contextPath }/resources/img/profile/like.png" style="width:20px;">${list.music_like }
				</div>
			</div>
			<p>
		</c:forEach>
	</c:if>
</body>
</html>