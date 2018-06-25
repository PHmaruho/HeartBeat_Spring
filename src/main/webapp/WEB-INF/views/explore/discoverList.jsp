<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<head>
<style type="text/css">
.part{
	display:inline-block;
	margin-bottom: 20px;
	margin-left: auto;
	margin-right: auto;
}
	
</style>
<link href="${pageContext.request.contextPath }/resources/css/jsy/search.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div>
		<c:if test="${discoverList==null || discoverList.size()==0}">
			검색 결과가 없습니다.
		</c:if>
		
		<c:if test="${ discoverList!=null }">
			<c:forEach var="list" items="${discoverList}" varStatus="i">
				<table class="searchResult">
					<tr>
						<td class="part">
							<a onclick="goto('/others/music/${list.music_sq}')">
		 					<img src="${pageContext.request.contextPath }/resources/img/album/${ list.img_path }.png" style="width:100px; height: 100px;"></a><br>
						</td>	
						<td class="part">
							${list.nick } 
		
							<br>
							${list.music_nm }<br>
							<!-- equalizer??  <br> -->
							 
								<fmt:formatDate value="${list.release_dt }" pattern="yyyy.MM.dd"/>
							<br>								<!-- musicShare로 바꾸기!!!!! -->
							<%-- <input type="button" value="공유" onclick="musicShare(${list.music_sq})">  
							<button onclick="goto('/others/song/${list.music_sq }')">댓글</button> --%>		
							<img src="${pageContext.request.contextPath }/resources/img/profile/like.png" style="width:20px;">${list.music_like }
						</td>
					</tr>
				</table>
			</c:forEach>
		</c:if>
	</div>
</body>
</html>