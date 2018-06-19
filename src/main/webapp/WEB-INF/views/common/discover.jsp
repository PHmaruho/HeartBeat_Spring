<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.3.3.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/js/jquery-ui.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jsy.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/jsy/search.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
$(document).ready(function(){
	autoSearch();
})

</script>
</head>
<body>
	<!-- <div id="placeHolder">
		가수는 @, 곡명은 *를, 태그는 #을 붙이고 단어마다 스페이스바를 해주세요! ex)@가수 *곡명 #태그
	</div>
	 	검색: <input type="text" id="searchBox"> -->
	<div id="detailSearchCategory">
		<input type="button" value="artist" onclick="searchDetailShowKeyword(this)">
		<input type="button" value="title" onclick="searchDetailShowKeyword(this)">
		<input type="button" value="tag" onclick="searchDetailShowKeyword(this)">

		<div id="detailTextSpace">
			카테고리: <input type="text" id="cat" readonly> 
			상세검색: <input type="text" id="detailText" onkeypress="if(event.keyCode==13){searchKeywordUsers();}">
					<input type="button" value="검색" onclick="searchKeywordUsers()" >
	</div>
	</div> 	
	<div id="artistDiv">
		Artist: 
			<input type="hidden" id="artist" value="" >
			<input type="button" onclick="deleteArtistAll()" value="리셋">
			<ul class="keyword-artist">
			</ul>
			<br>
	</div>
	<div id="titleDiv">
		Title: 
		<input type="hidden" id="title" value="" >
			<input type="button" onclick="deleteTitleAll()" value="리셋">
			<ul class="keyword-title">
			</ul>
		<br>
	</div>
	<div id="tagDiv">
		Tag: 
		<input type="hidden" id ="tag" value="" >
			<input type="button" onclick="deleteTagAll()" value="리셋">
			<ul class="keyword-tag">
			</ul>
		<br>
	</div>
	<input type="button" id="searchAll" value="통합검색" onclick="searchList()">
	<!-- <input type="button" id="detailSearch" onclick="showDetailSearch()" value="상세검색"> -->
	
	
	<div id="keywordList">
	</div>
</body>

</html>