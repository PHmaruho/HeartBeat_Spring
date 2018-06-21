<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<link href="${pageContext.request.contextPath }/resources/css/jquery-ui.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/resources/js/drag-arrange.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-ui.js"></script>
<!-- custom -->
<link href="${pageContext.request.contextPath }/resources/css/ph/uploadMusic.css?test=3" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/resources/js/ph/uploadMusic.js?test=3"></script>

</head>
<body>
	<div class="container">
		<div class="btn-group">
			<input type="button" value="업로드" onclick="" class="btn">
			<input type="button" value="업로드리스트" onclick="" class="btn">
			<input type="button" value="수정/삭제" onclick="" class="btn">
			<input type="hidden" value="${pageContext.request.contextPath }">
		</div>
	</div>
		<br />
	<div class="ph-album" style="border:1px solid;">
	<form action="album/pro" name="album_upload" method="post" enctype="multipart/form-data" onsubmit="return before_upload();">
		<div class="ph-album-music-editor" style="border:1px solid;">
			<ul id="itemList_music">
				<li class="ui-state-default musicItem">
					<table class="ph-music-list-table">
						<tr class="ph-tr-1">
							<td rowspan="6" class="ph-music-order">
								1
							</td>
							<td colspan="2">
								곡제목:
									<input type="text" name="music_nm" class="ph-music-nm" required="required">
							</td>
							<td rowspan="6" class="ph-music-button">
								<input type="button" value="삭제" class="ph-music-delete" onclick="removeMusic(this)">
								<span class="ph-music-move">이동</span>
								<input type="button" value="축소" class="ph-music-extend" onclick="musicFix(this)">

								<input type="hidden" name="music_no" value="1" class="ph-music-no" id="music_no">
								<input type="hidden" name="artist" value="" class="ph-artist-list">
								<input type="hidden" name="music_tag" value="" class="ph-tag-list">
								<input type="hidden" name="play_time" value="0" id="play_time" class="play_time">

								<!-- hidden -->
								<input type="hidden" value="1" class="ph-music-toggle-check">
							</td>
						</tr>
						<tr class="ph-tr-2">
							<td class="ph-td-1">
								가수:
									<input type="text" class="ph-search-artist-txt" size="10" placeholder="Nick or Email" onclick="searchArtist(event, this)" oninput="searchArtist(event, this)" onkeydown="searchArtist_key(event, this)">
									<div class="ph-artist-ajax-selected"></div>
							</td>
							<td class="ph-td-2">
									<ul class="ph-search-artist-ul">
									</ul>
							</td>
						</tr>
						<tr class="ph-tr-3">
							<td class="ph-td">
								장르:
								<input type="text" class="ph-search-tag-txt" size="10" placeholder="장르" onclick="searchTag(this)" oninput="searchTag(this)">
								<div class="ph-tag-ajax-selected">
									<ul class="ph-tag-ajax-ul">
										
									</ul>
								</div>
							</td>
							<td class="ph-td">
								<ul class="ph-search-tag-ul">
								</ul>
							</td>
						</tr>
						<tr class="ph-tr-4">
							<td>
								파일:
							 	<input type="button" value="첨부" class="ph-btn-insert-file" onclick="insertFile(this)">
							</td>
							<td>
								<div class="file_selected">
								 	<input type="text" name="file_select_name" id="file_select_name" size="10" class="file_select_name" disabled="disabled" required="required">
								 	<input type="file" name="file" class="ph-file-form" style="display: none;" accept=".mp3" onchange="fileChange(event, this)">
							 	</div>
							 	<div class="ph-file-player">
							 		<!-- 미리듣기 플레이어! -->
							 		<div>
							 		
							 		</div>
							 		<audio id="sound" src="" controls>
							 			<source src="" id="source" />
							 		</audio>
							 	</div>
							</td>
						</tr>
						<tr class="ph-tr-5">
							<td colspan="2">
								코멘트:
								<input type="text" name="music_comment" class="ph-music-comment">
							</td>
						</tr>
						<tr class="ph-tr-6">
							<td colspan="2">
								공개여부:
								<select name="music_open_yn">
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</td>
						</tr>
					</table>
				</li>
			</ul>
			<br />
			<input type="button" value="추가하기" onclick="addList()">
			<input type="submit" value="업로드">
		</div>
	</form>
		<div style="display: none;">
			<c:forEach var="tag" items="${music_tag }">
				<input type="hidden" value="${tag.tag_cd},${tag.tag_category},${tag.tag_meaning}" class="tag_list">
			</c:forEach>
		</div>
	</div>
</body>
