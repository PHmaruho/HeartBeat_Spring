<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
</head>
<body>
<div class="foot">
arrive.jsp! 
신곡 맵핑해서 뿌려주긩
<button onclick="goto('/Popular')">인기음악</button>
<button onclick="goto('/home')">to home</button>
<title>MainList</title>
<style>
	img{
		width:150px;
	}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jsy.js"></script>
</head>
<body>

	<h2> Main List Testing</h2>
	<img src="resources/img/album/mj.jpg"><br>
	|| Image root checking 용<Br>
	
		<form id="mainListShare">
			<h2>NewList</h2>
						<c:forEach var="album" items="${newList}" varStatus="i">
				<table border="1">
						<tr>
							<td colspan="2"><a href="goto('/others/music/${album.music_sq}')">
								<input type="hidden" id="music_sq${i.index }" value="${album.music_sq}">
								<img src="resources/img/album/${album.img_path }.jpg"></a></td>
						</tr>
						
						<tr>
							<td>album.music_nm: ${album.music_nm }</td>
						</tr>
						
						<tr>
							<td>album.music_sq: ${album.music_sq }</td>
						</tr>
						
						<tr>
							<td colspan="2">music_like: ${album.music_like }
							<%-- <input type="button" value="공유" onclick="mainListShare(${i.index})"></td> --%>
						</tr>
						
				</table>
				
			</c:forEach>
			
			
		</form>
</body>
</html>
</div>
</body>
