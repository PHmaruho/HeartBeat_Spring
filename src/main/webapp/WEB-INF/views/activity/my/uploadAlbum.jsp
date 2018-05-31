<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<style type="text/css">
.ph-album{
	position: relative;
	width: 60%;
	height: 70%;
	display: flex;
	margin-right: auto;
	margin-left: auto;
}
.ph-album-editor{
	position: relative;
	overflow: hidden;
	float: left;
	width: 35%;
	height: 100%;
}
.ph-album-music-editor{
	position: relative;
	overflow: hidden;
	float: left;
	width: 60%;
	height: 100%;
}
.ph-album-img-thumbnail{
	position: relative;
	display: flex;
	width: 200px;
	height: 200px;
	margin-left: auto;
	margin-right: auto;
}

.drag-area{
	display: inline-block;
    background: rgb(158, 211, 179);
    width: 60px;
    height: 20px;
    vertical-align: top;
    float: right;
    cursor: move;
}
</style>
<script src="/resources/js/drag-arrange.js"></script>
<script type="text/javascript">
	function getAlbumPreview(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
		            var element = window.document.getElementById("album_img");
		            element.setAttribute("src", e.target.result);
	        	}
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	// drag-event
	function dragEvent(item){
		$('li').arrangeable({dragSelector: '.drag-area'});
	}
</script>
</head>
<body>
	<div class="container">
		<div class="btn-group">
			<input type="button" value="업로드" onclick="" class="btn">
			<input type="button" value="업로드리스트" onclick="" class="btn">
			<input type="button" value="수정/삭제" onclick="" class="btn">
		</div>
	</div>
		<br />
	<div class="ph-album" style="border:1px solid;">
		<div class="ph-album-editor" style="border:1px solid;">
				<table border="1">
					<tr>
						<td colspan="2">
							<img alt="Album_Image" src="" id="album_img" name="img_path" class="ph-album-img-thumbnail">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="file" class="btn" id="uploadAlbumImg" onchange="getAlbumPreview(this)">
							<input type="button" class="btn" value="삭제" onclick="" id="deleteAlbumImg">
						</td>
					</tr>
					<tr>
						<td>앨범명</td>
						<td>
							<input type="text" name="album_nm">
						</td>
					</tr>
					<tr>
						<td>설명</td>
						<td>
							<textarea rows="2" cols="18" name="album_comment"></textarea>
						</td>
					</tr>
					<tr>
						<td>타이틀</td>
						<td>
							<input type="button" value="선택">
						</td>
					</tr>
					<tr>
						<td>종류</td>
						<td>
							<select name="album_type">
								<c:forEach var="type" items="${album_type }">
									<option value="${type.code_cd }">${type.code_meaning }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>공개여부</td>
						<td>
							<select name="open_yn">
								<option value="Y">Y</option>
								<option value="N">N</option>
							</select>
						</td>
					</tr>
				</table>
		</div>
		<div class="ph-album-music-editor" style="border:1px solid;">
			<ul>
				<li id="drag-able"><span class="title">list 1</span><span class="drag-area" onclick="dragEvent(this)"></span></li>
				<li id="drag-able"><span class="title">list 2</span><span class="drag-area" onclick="dragEvent(this)"></span></li>
				<li id="drag-able"><span class="title">list 3</span><span class="drag-area" onclick="dragEvent(this)"></span></li>
				<li id="drag-able"><span class="title">list 4</span><span class="drag-area" onclick="dragEvent(this)"></span></li>
			</ul>
			
			<br />
			
			<input type="button" value="추가하기" onclick="">
		</div>
	</div>
	<script type="text/javascript">
	
	</script>
</body>
