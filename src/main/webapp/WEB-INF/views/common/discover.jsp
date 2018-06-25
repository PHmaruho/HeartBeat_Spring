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
	<div class="cwi-discover-main">
		<div class="jumbotron cwi-discover-jumbo">
			<h1 class="display-4">탐색</h1>
			<p class="lead">회원/노래/태그 중 하나를 선택 후 검색어를 입력해주세요.</p>
			<hr class="my-4">
		</div>
		<div id="detailSearchCategory">
			<div class="cwi-discover-radios cwi-discover-input">
				<input type="radio" value="artist" onclick="searchDetailShowKeyword(this)"
					name="detailSearchCategoryRadio" id="radioArtist" checked="checked">
				<label for="radioArtist">회원</label>
				
				<input type="radio" value="title" onclick="searchDetailShowKeyword(this)"
					name="detailSearchCategoryRadio" id="radioTitle">
				<label for="radioTitle">노래</label>
				
				<input type="radio" value="tag" onclick="searchDetailShowKeyword(this)"
					name="detailSearchCategoryRadio" id="radioTag">
				<label for="radioTag">태그</label>
			</div>
	
			<div id="detailTextSpace" style="display: inline;">
				<div class="cwi-discover-input">
					<input type="text" id="detailText" onkeypress="if(event.keyCode==13){searchKeywordUsers();}" class="form-control">
					<input type="hidden" id="cat" readonly value="artist">
				</div>
			</div>
			
			<button type="button" class="btn btn-secondary cwi-discover-input" onclick="searchList()">검색</button>
		</div>
	
		
		<table class="table table-bordered">
			<tr>
				<td class="cwi-discover-td">
					회원
					<button type="button" class="close" aria-label="Close" onclick="deleteArtistAll()">
						<span aria-hidden="true">&times;</span>
					</button>
				</td>
				<td>
					노래
					<button type="button" class="close" aria-label="Close" onclick="deleteTitleAll()">
						<span aria-hidden="true">&times;</span>
					</button>
				</td>
				<td>
					태그
					<button type="button" class="close" aria-label="Close" onclick="deleteTagAll()">
						<span aria-hidden="true">&times;</span>
					</button>
				</td>
			</tr>
			<tr>
				<td>
					<div id="artistDiv" class="cwi-discover-table-div">
						<input type="hidden" id="artist" value="" >
						<ul class="keyword-artist"></ul>
					</div>
				</td>
				<td>
					<div id="titleDiv" class="cwi-discover-table-div">
						<input type="hidden" id="title" value="" >
						<ul class="keyword-title"></ul>
						<br>
					</div>
				</td>
				<td>
					<div id="tagDiv" class="cwi-discover-table-div">
						<input type="hidden" id ="tag" value="" >
						<ul class="keyword-tag"></ul>
						<br>
					</div>
				</td>
			</tr>
		</table>
		<div id="keywordList"></div>
	</div>
</body>

</html>