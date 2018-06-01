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

#itemList {
	width: 100%;
	list-style-type: none;
}

#itemList{
	border: 1px solid;
	float: left;
}
</style>
<style type="text/css">
.ph-music-order{
	width: 20px;
}
.ph-search-artist-ul, .ph-search-type-ul{
	list-style-type: none;
}
.ph-search-artist-li, .ph-search-type-li{
	float: left;
}

.file_selected{
	display: block;
}
.url_selected{
	display: none;
}
</style>

<link href="${pageContext.request.contextPath }/resources/css/jquery-ui.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/resources/js/drag-arrange.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-ui.js"></script>
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
	$( function() {
	    $("#itemList").sortable({
	    	update: function(event, ui){
	    		var list = $('.ph-music-no');
	    		var list2 = $('.ph-music-order');
	    		var i = 0;
	    		list.each(function(i, obj){
	    			$(this).val(i+1);
	    			list2.eq(i).html("");
	    			list2.eq(i).html((i++)+1);
	    		});
	    	},
	    	handle: ".ph-music-move"
	    });
	    $("#itemList").disableSelection();
	});
	
	function addList(){
		var allItems = 0;
		var musicItem = $('.musicItem');
		var item = $("#itemList");

		musicItem.each(function(){
			allItems = allItems + 1;
		});
		
		if(allItems >= 10){
			alert("10곡 이상은 추가할 수가 없습니다.");
			return false;
		}
		
		var str = "<li class='ui-state-default musicItem'>"
			+"<table class='ph-music-list-table'>"
			+"<tr><td rowspan='6' class='ph-music-order'>"
			+ (allItems + 1)
			+"</td><td colspan='2'>곡제목: "
			+"<input type='text' name='music_nm' class='ph-music-nm' required='required'>"
			+"</td></tr>"
			+"<tr><td>가수: "
			+"<input type='text' class='ph-search-artist-txt' size='10'>"
			+"<input type='button' class='ph-search-artist-btn' value='검색' onclick=''>"
			+"</td><td>"
			+"<ul class='ph-search-artist-ul'></ul></td></tr>"
			+"<tr><td>장르: "
			+"<input type='text' class='ph-music-type-txt' size='10'>"
			+"<input type='button' class='' value='검색' onclick=''>"
			+"</td><td>"
			+"<ul class='ph-search-type-ul'></ul></td></tr>"
			+"<tr><td>파일 or URL: "
			+"<select name='url_select_list' onchange='urlSelect(this)' class='ph-select-upload-type'>"
			+"<option value='file_select'>파일</option><option value='url_select'>URL</option>"
			+"</select></td>"
			+"<td><div class='file_selected'>"
			+"<input type='text' name='file_select_name' id='file_select_name'>"
			+"<input type='file' class='ph-file-form' style='display: none;'>"
			+"<input type='button' value='첨부' class='ph-btn-insert-file' onclick='insertFile(this)'></div>"
			+"<div class='url_selected'>"
			+"<input type='text' name='url_select_name' id='url_select_name'></div>"
			+"<div class=''><!-- 미리듣기 플레이어! --></div></td></tr>"
			+"<tr><td colspan='2'>코멘트: "
			+"<input type='text' name='music_comment' class='ph-music-comment'>"
			+"</td></tr>"
			+"<tr><td colspan='2'>공개여부: "
			+"<select name='music_open_yn'><option value='Y'>Y</option><option value='N'>N</option></select>"
			+"<input type='hidden' name='music_no' value='"
			+ (allItems + 1)
			+"' class='ph-music-no'>"
			+"<input type='hidden' name='artist' value='' class='ph-artist-list'>"
			+"<input type='hidden' name='music_tag' value='' class='ph-music-tag-list'>"
			+"<input type='hidden' name='play_time' value='0' id='play_time' class='play_time'>"
			+"</td></tr></table></li>";
		item.append(str);
	}
	
	function musicFix(musicItem){
		var item = $(musicItem);
		var item_list = $('.ph-music-extend');
		var toggle_list = $('.ph-music-toggle-check');
		var index_i = item_list.index(item);
		
		item_list.each(function(i, obj){
			if(i == index_i){
				if(toggle_list.eq(i).val() == 1){
					toggleFn(i, 1, 1, "none");
					toggle_list.eq(i).val("0");
				} else if(toggle_list.eq(i).val() == 0){
					toggleFn(i, 6, 2, "block");
					toggle_list.eq(i).val("1");
				} else {
					toggleFn(i, 1, 1, "none");
					toggle_list.eq(i).val("0");
				}
			}
		});
	}
	
	function removeMusic(delete_btn){
		var item = $(delete_btn);
		var musicItem = $('.musicItem');
		var delete_btn_list = $('.ph-music-delete');
		var index_i = delete_btn_list.index(item);
		
		delete_btn_list.each(function(i, obj){
			if(i == index_i){
				musicItem.eq(i).remove();
			}
			
			// 시간되면 모듈화 진행
    		var list = $('.ph-music-no');
    		var list2 = $('.ph-music-order');
    		var i = 0;
    		list.each(function(i, obj){
    			$(this).val(i+1);
    			list2.eq(i).html("");
    			list2.eq(i).html((i++)+1);
    		});
		});
	}
	
	function urlSelect(selected_type){
		var typed = $(selected_type);
		var list = $('.ph-select-upload-type');
		var file_list = $('.file_selected');
		var url_list = $('.url_selected');
		var index_i = list.index(typed);
		
		if(typed.val() == "file_select"){
			file_list.each(function(i, obj){
				if(i == index_i){
					$(this).show();
					url_list.eq(i).hide();
				}
			});
		} else {
			url_list.each(function(i, obj){
				if(i == index_i){
					$(this).show();
					file_list.eq(i).hide();
				}
			});
		}
	}
	
	function searchArtist(e, searchTXT){
		var text = $(searchTXT);
		if(text.val() != "" || text.val().length != 0){
			alert(text.val());			
		}
	}
	
	// modules
	function toggleFn(i, row1, row2, toggle){
		var first_td1_list = $('.ph-music-order');
		var first_td2_list = $('.ph-music-button');
		var tr_2 = $('.ph-tr-2');
		var tr_3 = $('.ph-tr-3');
		var tr_4 = $('.ph-tr-4');
		var tr_5 = $('.ph-tr-5');
		var tr_6 = $('.ph-tr-6');

		first_td1_list.eq(i).attr("rowspan", row1);
		first_td2_list.eq(i).attr("rowspan", row2);
		
		tr_2.eq(i).css("display", toggle);
		tr_3.eq(i).css("display", toggle);
		tr_4.eq(i).css("display", toggle);
		tr_5.eq(i).css("display", toggle);
		tr_6.eq(i).css("display", toggle);
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
		<div class="ph-album-edit" style="border:1px solid;">
				<table border="1">
					<tr>
						<td colspan="2">
							<img alt="Album_Image" src="" id="album_img" name="img_path" class="ph-album-img-thumbnail">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="file" name="img_path" class="ph-album-img-up-btn" id="uploadAlbumImg" onchange="getAlbumPreview(this)">
							<input type="button" class="ph-album-img-del-btn" value="삭제" onclick="" id="deleteAlbumImg">
						</td>
					</tr>
					<tr>
						<td>앨범명</td>
						<td>
							<input type="text" name="album_nm" class="ph-album-nm">
						</td>
					</tr>
					<tr>
						<td>설명</td>
						<td>
							<textarea rows="2" cols="18" name="album_comment" class=""></textarea>
						</td>
					</tr>
					<tr>
						<td>타이틀</td>
						<td>
							<label></label>
							<input type="hidden" value="" name="title_music_sq">
							<input type="button" value="선택" class="ph-select-title-btn">
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
							<select name="album_open_yn">
								<option value="Y">Y</option>
								<option value="N">N</option>
							</select>
						</td>
					</tr>
				</table>
		</div>
		<div class="ph-album-music-editor" style="border:1px solid;">
			<ul id="itemList">
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
								
								<input type="hidden" name="music_no" value="1" class="ph-music-no">
								<input type="hidden" name="artist" value="아무개" class="ph-artist-list">
								<input type="hidden" name="music_type" value="EDM,신나는" class="ph-music-tag-list">
								<input type="hidden" name="play_time" value="0" id="play_time" class="play_time">
								
								<!-- hidden -->
								<input type="hidden" value="1" class="ph-music-toggle-check">
							</td>
						</tr>
						<tr class="ph-tr-2">
							<td>
								가수:
									<input type="text" class="ph-search-artist-txt" size="10" placeholder="Nick or Email" oninput="searchArtist(event, this)">
									<div class="ph-artist-ajax">
									
									</div>
									<input type="button" class="ph-search-artist-btn" value="검색" onclick="">
							</td>
							<td>
									<ul class="ph-search-artist-ul">
										<li class="ph-search-artist-li">
											아무개
										</li>
									</ul>
							</td>
						</tr>
						<tr class="ph-tr-3">
							<td>
								장르:
									<input type="text" class="ph-music-type-txt" size="10">
									<input type="button" class="" value="검색" onclick="">
							</td>
							<td>
									<ul class="ph-search-type-ul">
										<li class="ph-search-type-li">
											EDM
										</li>
										<li class="ph-search-type-li">
											신나는
										</li>
									</ul>
									
							</td>
						</tr>
						<tr class="ph-tr-4">
							<td>
								 파일 or URL:
								 	<select name="url_select_list" onchange="urlSelect(this)" class="ph-select-upload-type">
								 		<option value="file_select">파일</option>
								 		<option value="url_select">URL</option>
								 	</select>
							</td>
							<td>
								<div class="file_selected">
								 	<input type="text" name="file_select_name" id="file_select_name">
								 	<input type="file" class="ph-file-form" style="display: none;">
									<input type="button" value="첨부" class="ph-btn-insert-file" onclick="insertFile(this)">
							 	</div>
							 	<div class="url_selected">
							 		<input type="text" name="url_select_name" id="url_select_name">
							 	</div>
							 	<div class="">
							 		<!-- 미리듣기 플레이어! -->
							 		
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
		</div>
	</div>
	<script type="text/javascript">
	
	</script>
</body>
