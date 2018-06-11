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
			
			if(cat=='title'){
				$('#searchBox').val($('#searchBox').val()+'*'+det+' ');
			}else if(cat=='artist'){
				$('#searchBox').val($('#searchBox').val()+'@'+det+' ');
			}else if(cat=='tag'){
				$('#searchBox').val($('#searchBox').val()+'#'+det+' ');
			} 
		}
	})
})


</script>
</head>
<body>
	<div id="placeHolder">
		가수는 @, 곡명은 *를, 태그는 #을 붙이고 단어마다 스페이스바를 해주세요! ex)@가수 *곡명 #태그
	</div>
	검색: <input type="text" id="searchBox">
	<input type="button" id="searchAll" value="검색" onclick="searchList()">
	<input type="button" id="detailSearch" onclick="showDetailSearch()" value="상세검색">
	
	<div id="detailSearchCategory" style="display: none;">
		<input type="button" value="tag" onclick="searchDetailShowKeyword(this)">
		<input type="button" value="artist" onclick="searchDetailShowKeyword(this)">
		<input type="button" value="title" onclick="searchDetailShowKeyword(this)">

		<div id="detailTextSpace" style="display: none;">
			<input type="text" id="cat" style="display:none;"readonly> 
			상세검색: <input type="text" id="detailText"> 
		</div>
	</div>
	
	<div id="keywordList">
	</div>
</body>

</html>