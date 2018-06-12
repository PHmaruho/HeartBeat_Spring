<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
			<input type="text" id="cat" readonly> 
			상세검색: <input type="text" id="detailText" onkeypress="if(event.keyCode==13){searchKeywordUsers();}"> 
			<div class="keword-selected"></div>
		</div>
	</div>
		 	
	<div id="artistDiv">
		가수: 
			<input type="hidden" id="artist" value="" >
			<input type="button" onclick="deleteArtistAll()" value="리셋">
			<ul class="keyword-artist">
			</ul>
			<br>
	</div>
	<div id="titleDiv">
		곡명: 
		<input type="hidden" id="title" value="" >
			<input type="button" onclick="deleteTitleAll()" value="리셋">
			<ul class="keyword-title">
			</ul>
		<br>
	</div>
	<div id="tagDiv">
		태그: 
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