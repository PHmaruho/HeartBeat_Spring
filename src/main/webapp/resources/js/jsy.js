/**
 * JSY's Javascript File
	주석은 해당 jsp 페이지!
 */

// Common- mainList
function musicShare(v){
	var member_id='<%=Session["id"]%>';
	var c=v;
	$.ajax({
		url:'/heartbeat/do/mainListShare',
		data:{
			music_sq:c,
			id:member_id
		},
		success:function(){
			alert('공유되었습니다.');
		}
	})
}
//common- discover, explore- discoverList
/*function showDetailSearch(){
	$('#detailSearchCategory').toggle();
}*/

function autoSearch(){
	$("#detailText").autocomplete({
		focus:function(event,ui){
			$(this).val(ui.item.label);
			return false;
		},
		minlength:1,
		source:function(request,response){
			var keyword=($('#cat').val()==null)? "":$('#cat').val();
			$.ajax({
				url: "/heartbeat/do/getKeyword/"+keyword,
				dataType:"json",
				data:{
					searchWord:request.term
				},
				success:function(data){
					if(keyword=='tag'){
						response($.map(data.list,function(item){
							return{
								label:item.tag_meaning,
								value:item.tag_meaning
							};
						}))	
					}
					else if(keyword=='artist'){
						response($.map(data.list,function(item){
							return{
								label:item.nick,
								value:item.nick
							};
						}))	
					}
					else if(keyword=='title'){
						response($.map(data.list,function(item){
							return{
								label:item.music_nm,
								value:item.music_nm
							};
						}))	
					}
				},
			})
		},
		select:function(event,ui){
			if(event.keyCode==13){searchKeywordUsers();}
			else searchKeywordUsers();
		}
	})
}

function searchKeywordUsers(){
	
		var cat=$('#cat').val();
		var det= $('#detailText').val().trim();
		var e=det.replace(/'/g,"따옴표ㄱㄴㄷㄹ");
		//alert('det:'+det);
		//alert('e:'+e);
		if(cat.length==0){
			alert('항목을 선택해주세요');
			return false;
		}else if(det.length==0){
			alert('검색어를 입력해주세요.');
			return false;
		}
		
		//alert('입력할 단어: '+det);
		if(cat=='tag'){
			var v=$('#tag').val().split(",");
			var res=0;
			//alert('tag in');
			for(var i in v){
				//alert('v['+i+']:'+v[i]);
				if(v[i]==det){
					res=1;
					//alert('v['+i+']==det res:'+res);
					break;
				}
			}
			var len= $('#tag').val().length;
			//alert('v: '+v);
			if(res==0){
				//alert('else');
				var str="<li class='keyword-tag-added'>"	// cwi
					+"<span class='badge badge-pill badge-secondary shake-opacity' onclick='deleteKeywordTag(this)'>"
					+det
					+"<input type='hidden' value='"+e+"' class='addTag-hidden'>"
					+"</span></li>";
						
				$('.keyword-tag').append(str);
				if(len==0) 	$('#tag').val($('#tag').val()+''+e+'');
				else 		$('#tag').val($('#tag').val()+','+e+'');
			}else if(len==0){
				alert('검색어를 입력해주세요.')
			}else{
				alert('존재하는 검색어입니다.');
			}
	}else if(cat=='artist'){
			var v=$('#artist').val().split(",");
			var res=0;
			//alert('tag in');
			for(var i in v){
				//alert('v['+i+']:'+v[i]);
				if(v[i]==det){
					res=1;
					//alert('v['+i+']==det res:'+res);
					break;
				}
			}
			var len= $('#artist').val().length;
			//alert('v: '+v);
			if(res==0){
				//alert('else');
				var str="<li class='keyword-artist-added'>"	// cwi
					+"<span class='badge badge-pill badge-secondary shake-opacity' onclick='deleteKeywordArtist(this)'>"
					+det
					+"<input type='hidden' value='"+e+"' class='addArtist-hidden'>"
					+"</span></li>";
						
				$('.keyword-artist').append(str);
				if(len==0) 	$('#artist').val($('#artist').val()+''+e+'');
				else 		$('#artist').val($('#artist').val()+','+e+'');
			}else if(len==0){
				alert('검색어를 입력해주세요.')
			}else{
				alert('존재하는 검색어입니다.');
			}
		}else if(cat=='title'){
			var v=$('#title').val().split(",");
			var res=0;
			//alert('tag in');
			for(var i in v){
				//alert('v['+i+']:'+v[i]);
				if(v[i]==det){
					res=1;
					//alert('v['+i+']==det res:'+res);
					break;
				}
			}
			var len= $('#title').val().length;
			//alert('v: '+v);
			if(res==0){
				//alert('else');
				var str="<li class='keyword-title-added'>"	// cwi
						+"<span class='badge badge-pill badge-secondary shake-opacity' onclick='deleteKeywordTitle(this)'>"
						+det
						+"<input type='hidden' value='"+e+"' class='addTitle-hidden'>"
						+"</span></li>";
						
				$('.keyword-title').append(str);
				
				if(len==0) 	$('#title').val($('#title').val()+''+e+'');
				else 		$('#title').val($('#title').val()+','+e+'');
			}else if(len==0){
				alert('검색어를 입력해주세요.')
			}else{
				alert('존재하는 검색어입니다.');
			}
		}
}
function searchDetailShowKeyword(category){
	var r=category.value;
	$('#cat').val("");
	$('#cat').val(r);
	$('#cat').show;
	$('#detailTextSpace').show();
}

function clickdetailText(){
	var c=document.getElementById('cat').value;
	var d=document.getElementById('detailText').value.trim().split(' ');
}

function deleteArtistAll(){
	$('#artist').val("");
	$('.keyword-artist-added').remove();
	$('.addArtist-hidden').remove();
}

function deleteTitleAll(){
	$('#title').val("");
	$('.keyword-title-added').remove();
	$('.addTitle-hidden').remove();
}

function deleteTagAll(){
	$('#tag').val("");
	$('.keyword-tag-added').remove();
	$('.addTag-hidden').remove();
}

function deleteKeywordTag(v){
	let val=$(v);
	//alert('val: '+val);
	let pLi= val.closest('li'); // 삭제 대상 keyword
	let pUl= pLi.closest('ul'); // 삭제 대상 부모 name
	let i= $('.keyword-tag').index(pUl);
	
	let sTag=$('#tag').val().split(",");
	let str="";
	$('#tag').val("");
	for(let item in sTag){
		if(pLi.find('.addTag-hidden').val()!= sTag[item]){
			if(str.length==0) str+=sTag[item];
			else str+=","+sTag[item];
		}
	}
	
	$('#tag').val(str);
	pLi.remove();
	
}
function deleteKeywordArtist(v){
	let val=$(v);
	//alert('val: '+val);
	let pLi= val.closest('li'); // 삭제 대상 keyword
	let pUl= pLi.closest('ul'); // 삭제 대상 부모 name
	let i= $('.keyword-artist').index(pUl);
	
	let sTag=$('#artist').val().split(",");
	let str="";
	$('#artist').val("");
	for(let item in sTag){
		if(pLi.find('.addArtist-hidden').val()!= sTag[item]){
			if(str.length==0) {
				str+=sTag[item];
			}
			else{
				str+=","+sTag[item];
			}
		}
	}
	
	$('#artist').val(str);
	pLi.remove();
	
}
function deleteKeywordTitle(v){
	let val=$(v);
	//alert('val: '+val);
	let pLi= val.closest('li'); // 삭제 대상 keyword
	let pUl= pLi.closest('ul'); // 삭제 대상 부모 name
	let i= $('.keyword-title').index(pUl);
	
	let sTag=$('#title').val().split(",");
	let str="";
	
	$('#title').val("");
	for(let item in sTag){
		if(pLi.find('.addTitle-hidden').val()!= sTag[item]){
			if(str.length==0) str+=sTag[item];
			else str+=","+sTag[item];
		}
	}
	
	$('#title').val(str);
	pLi.remove();
	
}
function searchList(){
	var art=$('#artist').val().trim();
	var tit=$('#title').val().trim();
	var tag=$('#tag').val().trim();
	var c=$('#cat').val().length;
	art=art.replace(/따옴표ㄱㄴㄷㄹ/g,"'");
	tit=tit.replace(/따옴표ㄱㄴㄷㄹ/g,"'");
	tag=tag.replace(/따옴표ㄱㄴㄷㄹ/g,"'");
	if(c==0){
		alert('항목을 선택하고 검색어를 입력해주세요.');
		return false;
	}
	else if(tit.length==0 && tag.length==0 && art.length==0 ){
		alert('검색어를 입력해주세요');
		return false;
	}else{
		if(art.length==0 || art==null || art=='' || art==' ') art='all';
		if(tit.length==0 || tit==null || tit==''|| tit==' ') tit='all';
		if(tag.length==0 || tag==null || tag=='' || tag==' ') tag='all';
	}

		$.ajax({
			type:'POST',
			url:'/heartbeat/do/discoverList',
			data:{
					
					kArtist:art,
					kTitle:tit,
					kTag:tag,
				},
			success:function(data){
					$('#keywordList').html("");
					$('#keywordList').html(data);
			}
		});	
}



/* member - memberAlarmList */
function getMemberAlarmList(){
	$('#alarmContent').toggle();
	getMemberAlarmList2();
}

function getMemberAlarmList2() {
	$.ajax({
		url:'/heartbeat/do/memberAlarmList',
	
		success:function(data){
			$('#alarmContent').html("");
			$('#alarmContent').html(data);
		}
	});
}

function updateAlarmStatus(v) {
	$.ajax({
		url:'/heartbeat/do/updateAlarmStatus',
		data:{
			alarmSq:v,
		},
		success:function(){
			getMemberAlarmList2();
			getAlarmCount();
		}
	});
}
