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
		var e=det.replace(/'/g,"따옴표");
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
					var str="<li class='keyword-tag-added'>"
						+det
						+"<input type='button' class='deleteTag' onclick='deleteKeywordTag(this)' value='x'>"
						+"<input type='hidden' value='"+e+"' class='addTag-hidden'>"
						+"</li>";
						
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
				var str="<li class='keyword-artist-added'>"
						+det
						+"<input type='button' class='deleteArtist' onclick='deleteKeywordArtist(this)' value='x'>"
						+"<input type='hidden' value='"+e+"' class='addArtist-hidden'>"
						+"</li>";
						
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
				var str="<li class='keyword-title-added'>"
						+det
						+"<input type='button' class='deleteTitle' onclick='deleteKeywordTitle(this)' value='x'>"
						+"<input type='hidden' value='"+e+"' class='addTitle-hidden'>"
						+"</li>";
						
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
	art=art.replace(/따옴표/g,"'");
	tit=tit.replace(/따옴표/g,"'");
	tag=tag.replace(/따옴표/g,"'");
	/*
	var keyword=document.getElementById('searchBox').value.trim();
	//alert('keyword: '+keyword)
	var arr= keyword.split(" ");
	var con=["#","@","*"];
	var con2=["#@","#*","##","@@","@*","@#","**","*@","*#"];
	var con3
	=["!","$","%","^","&","+","-","=","-","_","|","[","]",":",";","\'","<",">",".","{","}","?",",","\"","||"];
	var count1=0;
	var count2=0;
	var count3=0;
	var noCategory=0;
	alert('val trim');
	alert('art:'+art);
	alert('tag:'+tag);
	alert('title:'+tit);
	*/
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
		/*alert('필터 후');
		alert('art:'+art);
		alert('tag:'+tag);
		alert('title:'+tit);*/
	}
	/*
	for(var i=0;i<arr.length;i++){
		count1=0;
		//alert('arr['+i+']:'+arr[i]);
		
		for(var c3=0;c3<con3.length;c3++){
			var result=arr[i].indexOf(con3[c3]);
			var result2=arr[i].lastIndexOf(con3[c3]);
			//alert('result1:'+result+'/result2:'+result2);
			if((result==-1)&&(result2==-1)) continue;
			else count3++;
		}
		//alert('count3: '+count3);
		if(count3==0){
			for(var c2=0;c2<con2.length;c2++){
				var result= arr[i].lastIndexOf(con2[c2]);
				var result2= arr[i].lastIndexOf(con2[c2]);
				if((result==-1)&&(result2==-1)){
					//alert('con2[c2]:'+con2[c2]+'/result:'+result+'/result2: '+result2);
					continue;
				}
				else {
					count2++;
				}
			}
			//alert('count2: '+count2);
			if(count2==0){
				for(var c=0;c<con.length;c++){
					
					var result=arr[i].indexOf(con[c]);
					var result2= arr[i].lastIndexOf(con[c]);
					//alert('1 / arr[i]:'+arr[i]+'/con[c]:'+con[c]+'/result:'+result+'/result2: '+result2);
					
					if((result==0)&(result2==0)&(result==result2)){
						var arr2=arr[i].split(con[c]);
						for(var c1=0;c1<con.length;c1++){
							var result=arr2[1].indexOf(con[c1]);
							var result2= arr2[1].lastIndexOf(con[c1]);
							var result3=arr2[1].length;
							//alert('2 / arr2[1]:'+arr2[1]+'/con[c]:'+con[c1]+'/result:'+result+'/result2: '+result2);
								if(result3!=0){
									if((result==-1)&& (result2==-1)) {
										count1+=-1;
										//alert('2 count: '+count1);
									}
								}else count1=0;
							}
					}
				}
			}
			}
		//alert('count1: '+count1);
		if(count1!=-3) {
			alert('검색어 분류 또는 빈칸을 확인해주세요.');
			return false;
		}
	}*/
		$.ajax({
			type:'POST',
			url:'/heartbeat/do/discoverList',
			data:{
					
					kArtist:art,
					kTitle:tit,
					kTag:tag
				},
			success:function(data){
				$('#keywordList').html("");
				$('#keywordList').html(data);
			}
		});	
}


/* member - memberAlarmList */
function getMemberAlarmList(v){
	$('#alarmContent').toggle();
	/*var id=<%=session.getAttribute(loginSession)%>;*/
	//alert('id:'+v);
	$.ajax({
		url:'/heartbeat/do/memberAlarmList',
		data:{
			member_id:v
		},
		success:function(data){
			$('#alarmContent').html("");
			$('#alarmContent').html(data);
		}
	})
	//alert('getMembreAlarmList: '+v);
	/*$(document).ready(function(){
		$('#alarmContent').toggle();
		setTimeout(alarmContentShow(id),1000);
		});*/
}
/*function alarmContentShow(v){
	var id=v;
	$.ajax({
		url:'/heartbeat/do/memberAlarmList',
		data:{
			member_id:711// id
		},
		success:function(data){
			$('#alarmContent').html("");
			$('#alarmContent').html(data);
		}
	})
}*/
function updateAlarmStatus(v){
	var c=$('#alarm_sq'+v).val();
	//alert('alarm_sq: '+c);
	$.ajax({
		url:'/heartbeat/do/updateAlarmStatus',
		data:{
			alarmSq:c,
		},
		success:function(){
			//alert('읽음 ok');
			location.reload();
		}
	})
}