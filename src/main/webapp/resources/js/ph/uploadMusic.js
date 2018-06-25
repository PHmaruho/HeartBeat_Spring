$('html').click(function(e){
		let autocomple = $('.ph-artist-ajax-ul');
		// 가수 검색 안보이게
		if(autocomple.text() != ''){
			var complete = $('.ph-artist-ajax-selected');
			complete.css("display", "none");
		}
		
		// 태그 검색 안보이게
		let autocomple2 = $('.ph-tag-ajax-selected');
		if(e.target.className != 'ph-search-tag-txt' &&
				e.target.className != 'ph-tag-ajax-li'){
			autocomple2.hide();
		}
	});

function searchArtist(e, searchArt){
	var text = $(searchArt);
	var text_list = $('.ph-search-artist-txt');
	var index_i = text_list.index(text);
	var complete = $('.ph-artist-ajax-selected');
	
	if(text.val() != "" || text.val().length != 0){
		$.ajax({
			url:"/heartbeat/do/searchArtist",
			data:{keyword:text.val()},
			success: function(data){
				if(data != '' || data != null){
					var tag = "<ul class='ph-artist-ajax-ul'>";
					complete.eq(index_i).html("");
					$.each(data, function(i, obj){
						tag += "<li class='ph-artist-ajax-li' onmouseover='selectedHoverArtist(this)' onclick='selectedArtist(this)'>"
							+ "<span class='span-1'>" + obj.nick + "</span>" + "<br />"
							+ "<span class='span-2'>" + obj.email + "</span>" 
							+ "<input type='hidden' value='" + obj.member_sq + "' class='span-3'>"
							+ "</li>";
					});
					tag += "</ul>";
					complete.eq(index_i).append(tag);
					complete.eq(index_i).show();
				} else {
					complete.eq(index_i).html("");
				}
			}
		});
	}
}

function searchArtist_key(e, keyboard){
	var direct = $(keyboard);
	var direct_list = $('.ph-search-artist-txt');
	var index_i = direct.index(direct);
	var complete = $('.ph-artist-ajax-selected');
	
	if(e.keyCode == 40 || e.keyCode == 38){
		if(complete.eq(index_i).html() != ''){
			var selected = $('.selected-artist');
			var list = $('.ph-artist-ajax-li');
			var index_j = list.index(selected);
			var text = $('.ph-search-artist-txt');
			
			if(e.keyCode == 40){
				if(index_j == list.length-1){
					list.eq(index_j).toggleClass("selected-artist");
					list.eq(0).toggleClass("selected-artist");
				} else if(index_j == -1){
					list.eq(0).toggleClass("selected-artist");
				} else {
					list.eq(index_j).toggleClass("selected-artist");
					list.eq(index_j+1).toggleClass("selected-artist");
				}
				if(index_j != -1){
					complete.eq(index_i).scrollTop(index_j*50);
				} else {
					complete.eq(index_i).scrollTop(0*100);
				}
			} else if(e.keyCode == 38){
				if(index_j == 0){
					list.eq(index_j).toggleClass("selected-artist");
					list.eq(list.length-1).toggleClass("selected-artist");
				} else if(index_j == -1){
					list.eq(list.length-1).toggleClass("selected-artist");
				} else {
					list.eq(index_j).toggleClass("selected-artist");
					list.eq(index_j-1).toggleClass("selected-artist");
				}
				if(index_j != -1){
					complete.eq(index_i).scrollTop(index_j*50);
				} else {
					complete.eq(index_i).scrollTop((list.length-1)*100);
				}
			}
			text.eq(index_i).text("");
			text.eq(index_i).text(list.eq(index_j));
		}
	} else if(e.keyCode == 13){
		alert("enter");
		if(index_j >= 0){
			selectedArtist(list.eq(index_j));
		}
	}
}

function selectedHoverArtist(li){
	let item = $(li);
	let list = $('.ph-artist-ajax-li');
	let index_j = list.index(item);
	
	list.each(function(i, obj){
		$(this).removeClass("selected-artist");
		if(i == index_j){
			item.toggleClass("selected-artist");
		}
	});
}

function selectedArtist(li){
	let item = $(li);
	let list = $('.ph-artist-ajax-li');
	let index_j = list.index(item);
	
	let parents = list.eq(index_j).parent('ul'); // 단일 .ph-artist-ajax-ul
	let parent_list = $('.ph-artist-ajax-ul');
	let index_i = parent_list.index(parents);
	
	let ul = $('.ph-search-artist-ul');
	
	//alert(ul.eq(index_i).find('li').find('.ph-search-artist-hidden').eq(0).val());
	
	let check = false;
	// each
	ul.eq(index_i).find('li').find('.ph-search-artist-hidden').each(function(i, obj){
		if($(this).val() == item.find('.span-3').val()){
			alert("같다구요!");
			check = true;
		}
	});
	
	if(check){
		return;
	} else {
		let str = "<li class='ph-search-artist-li'>"
			+ item.find('.span-1').text()
			+ "<input type='button' class='ph-search-artist-delete-btn' onclick='deleteArtist(this)'>"
			+ "<input type='hidden' value='" + item.find('.span-3').val() + "' class='ph-search-artist-hidden'>"
			+ "</li>";
	
		// ul html 출력
		ul.eq(index_i).append(str);
		
		// 저장
		let artist_list = $('.ph-artist-list').eq(index_i);
		let artist_str;
		if(artist_list.val() == ''){
			artist_str = item.find('.span-3').val();
		} else {
			artist_str = artist_list.val() + "," + item.find('.span-3').val();
		}
		artist_list.val(artist_str);
	}
}

function deleteArtist(btn_item){
	let btn = $(btn_item);
	let parent_li = btn.closest('li'); // ph-search-artist-li
	let parent_ul = parent_li.closest('ul'); // ph-search-artist-ul
	let index_i = $('.ph-search-artist-ul').index(parent_ul);
	
	let artist_list = $('.ph-artist-list').eq(index_i);
	let artist_split = artist_list.val().split(",");
	let artist_str = "";
	
	// 삭제 시, split 한 것에서 제거될 것에서 제외하고, 다시 넣는다.
	artist_list.val("");
	for(let i in artist_split){
		if(parent_li.find('.ph-search-artist-hidden').val() != artist_split[i]){
			if(artist_str.length == 0){
				artist_str += artist_split[i];
			} else {
				artist_str += "," + artist_split[i];
			}
		}
	}
	
	// hidden에 다시 넣어준다.
	artist_list.val(artist_str);
	// 해당 li를 지운다.
	parent_li.remove();
}

function searchTag(selectText){
	let text = $(selectText);
	let text_list = $('.ph-search-tag-txt');
	let index_i = text_list.index(text);
	let tag_show_list = $('.ph-tag-ajax-selected');
	let tag_list = $('.tag_list');
	
	tag_show_list.each(function(i, tag_obj){
		if(index_i == i){
			let li = tag_show_list.eq(i).find('ul').eq(i);
			let str = "";
			
			if(text.val().length == 0){
				tag_show_list.eq(i).show();
				
				tag_list.each(function(j, obj){
					let tag_cd = $(this).val().split(",")[0];
					let tag_category = $(this).val().split(",")[1];
					let tag_meaning = $(this).val().split(",")[2];
					
					str += "<li class='ph-tag-ajax-li' onclick='selectedTag(this)'>";
					
					// if
					if(tag_category.length != 0){
						str += "<span id='" + tag_meaning + "'>"
							 + " > " + tag_meaning
							 + "<input type='hidden' value='" + tag_cd + "' class='span-2'>"
							 + "</span>";
					} else {
						str += "<span id='" + tag_meaning + "'>"
							 + tag_meaning
							 + "<input type='hidden' value='" + tag_cd + "' class='span-2'>"
							 + "</span>";
					}
					
					str += "</li>";
					
				});
				
				tag_show_list.eq(i).find('ul').html("");
				tag_show_list.eq(i).find('ul').append(str);
				$(this).eq(i).show();
				
				return;
			}
			
			li.each(function(j, obj){
				if(li.eq(j).find('span').attr('id').indexOf(text.val()) != -1){
					li.eq(j).show();
				} else {
					li.eq(j).hide();
				}
			});
		}
	});
}

function selectedTag(li){
	let item = $(li);
	let list = $('.ph-tag-ajax-li');
	let index_j = list.index(item);
	
	let parents = list.eq(index_j).closest('ul'); // 단일 .ph-artist-ajax-ul
	let parents_list = $('.ph-tag-ajax-ul');
	let index_i = parents_list.index(parents);
	
	let ul = $('.ph-search-tag-ul');
	
	//alert(ul.eq(index_i).find('li').find('.ph-search-artist-hidden').eq(0).val());
	
	let check = false;
	// each
	ul.eq(index_i).find('li').find('.ph-search-tag-hidden').each(function(i, obj){
		if($(this).val() == item.find('.span-2').val()){
			alert("같다구요!");
			check = true;
		}
	});
	
	if(check){
		return;
	} else {
		let str = "<li class='ph-search-tag-li'>"
			+ item.find('span').attr('id')
			+ "<input type='button' class='ph-search-tag-delete-btn' onclick='deleteTag(this)'>"
			+ "<input type='hidden' value='" + item.find('.span-2').val() + "' class='ph-search-tag-hidden'>"
			+ "</li>";
	
		// ul html 출력
		ul.eq(index_i).append(str);
		
		// 저장
		let tag_list = $('.ph-tag-list').eq(index_i);
		let tag_str;
		if(tag_list.val() == ''){
			tag_str = item.find('.span-2').val();
		} else {
			tag_str = tag_list.val() + "," + item.find('.span-2').val();
		}
		tag_list.val(tag_str);
	}
}

function deleteTag(btn_item){
	let btn = $(btn_item);
	let parent_li = btn.closest('li'); // ph-search-artist-li
	let parent_ul = parent_li.closest('ul'); // ph-search-artist-ul
	let index_i = $('.ph-search-tag-ul').index(parent_ul);
	
	let tag_list = $('.ph-tag-list').eq(index_i);
	let tag_split = tag_list.val().split(",");
	let tag_str = "";
	
	// 삭제 시, split 한 것에서 제거될 것에서 제외하고, 다시 넣는다.
	for(let i in tag_split){
		if(parent_li.find('.ph-search-tag-hidden').val() != tag_split[i]){
			if(tag_str.length == 0){
				tag_str += tag_split[i];
			} else {
				tag_str += "," + tag_split[i];
			}
		}
	}
	
	// hidden에 다시 넣어준다.
	tag_list.val(tag_str);
	// 해당 li를 지운다.
	parent_li.remove();
}

function insertFile(upload_btn){
	var btn = $(upload_btn);
	var btn_list = $('.ph-btn-insert-file');
	var index_i = btn_list.index(btn);
	var file_list = $('.ph-file-form');

	file_list.each(function(i, obj){
		if(i == index_i){
			$(this).click();
		}
	});
}

function fileChange(e, file_upload){
	let file = $(file_upload);
	let file_list = $('.ph-file-form');
	let index_i = file_list.index(file);
	let text = $('.file_select_name');
	let player = $('.ph-file-player');
	
	text.each(function(i, obj){
		if(i == index_i){
			$(this).val(file.val());
		}
	});
	
	let audio = player.eq(index_i).find('#sound');
	let real_file = e.target.files;

	audio.find('#source').attr("src", URL.createObjectURL(files[0]));
}

// onsubmit
function before_upload(){
	let file_list = $('.ph-file-form');
	let artist_list = $('.ph-search-artist-ul');
	let val = true;
	
	file_list.each(function(){
		if($(this).val() == ''){
			alert("파일을 추가해 주세요.");
			val = false;
		}
	});
	if(val == false){
		return val;
	}
	
	artist_list.each(function(){
		if($(this).html().trim().length == 0){
			alert("아티스트를 추가해 주세요.")
			val = false;
		}
	})
	
	return val;
}