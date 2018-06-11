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
<script type="text/javascript">
$(document).ready(function(){
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
			var cat=$('#cat').val();
			var det= $('#detailText').val();
			//alert('det: '+det);
			
			if(cat=='tag'){
				var v=$('#tag').val().indexOf(det);
				var len= $('#tag').val().length;
				//alert('v: '+v);
				if(v==-1){
					//alert('else');
					var str="<li class='keyword-tag-added'>"
							+det
							+"<input type='button' class='deleteTag' onclick='deleteKeywordTag(this)'>"
							+"<input type='hidden' value='"+det+"' class='addTag-hidden'>"
							+"</li>";
							
					$('.keyword-tag').append(str);
					if(len==0) 	$('#tag').val($('#tag').val()+''+det+'');
					else 		$('#tag').val($('#tag').val()+','+det+'');
				}else{
					alert('존재하는 검색어입니다.');
				}
			}else if(cat=='artist'){
				var v=$('#artist').val().indexOf(det);
				var len= $('#artist').val().length;
				//alert('v: '+v);
				if(v==-1){
					//alert('else');
					var str="<li class='keyword-artist-added'>"
							+det
							+"<input type='button' class='deleteArtist' onclick='deleteKeywordArtist(this)'>"
							+"<input type='hidden' value='"+det+"' class='addArtist-hidden'>"
							+"</li>";
							
					$('.keyword-artist').append(str);
					if(len==0) 	$('#artist').val($('#artist').val()+''+det+'');
					else 		$('#artist').val($('#artist').val()+','+det+'');
				}else{
					alert('존재하는 검색어입니다.');
				}
			}else if(cat=='title'){
				var v=$('#tag').val().indexOf(det);
				var len= $('#title').val().length;
				//alert('v: '+v);
				if(v==-1){
					//alert('else');
					var str="<li class='keyword-title-added'>"
							+det
							+"<input type='button' class='deleteTitle' onclick='deleteKeywordTitle(this)'>"
							+"<input type='hidden' value='"+det+"' class='addTitle-hidden'>"
							+"</li>";
							
					$('.keyword-title').append(str);
					
					if(len==0) 	$('#title').val($('#title').val()+''+det+'');
					else 		$('#title').val($('#title').val()+','+det+'');
				}else{
					alert('존재하는 검색어입니다.');
				}
			}
			
			/* if(cat=='title'){
				$('#searchBox').val($('#searchBox').val()+'*'+det+' ');
			}else if(cat=='artist'){
				$('#searchBox').val($('#searchBox').val()+'@'+det+' ');
			}else if(cat=='tag'){
				$('#searchBox').val($('#searchBox').val()+'#'+det+' ');
			}  */
		}
	})
})


</script>
</head>
<body>
	<!-- <div id="placeHolder">
		가수는 @, 곡명은 *를, 태그는 #을 붙이고 단어마다 스페이스바를 해주세요! ex)@가수 *곡명 #태그
	</div> -->
	 <!-- 검색: <input type="text" id="searchBox"> -->
	가수: 
	<input type="hidden" id="artist" value="" >
		<input type="button" onclick="deleteArtistAll()" value="리셋">
		<ul class="keyword-artist">
		</ul>
	곡명: 
	<input type="hidden" id="title" value="" >
		<input type="button" onclick="deleteTitleAll()" value="리셋">
		<ul class="keyword-title">
		</ul>
	태그: 
	<input type="hidden" id ="tag" value="" >
		<input type="button" onclick="deleteTagAll()" value="리셋">
		<ul class="keyword-tag">
		</ul>
	<input type="button" id="searchAll" value="검색" onclick="searchList()">
	<!-- <input type="button" id="detailSearch" onclick="showDetailSearch()" value="상세검색"> -->
	
	<div id="detailSearchCategory">
		<input type="button" value="tag" onclick="searchDetailShowKeyword(this)">
		<input type="button" value="artist" onclick="searchDetailShowKeyword(this)">
		<input type="button" value="title" onclick="searchDetailShowKeyword(this)">

		<!-- <div id="detailTextSpace" style="display: none;"> -->
			<input type="text" id="cat" readonly> 
			상세검색: <input type="text" id="detailText"> 
			<div class="keword-selected"></div>
		<!-- </div> -->
	</div>
	
	<div id="keywordList">
	</div>
</body>

</html>