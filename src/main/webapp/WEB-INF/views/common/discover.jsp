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
<script type="text/javascript">
 
 $(function(){
	         $("#detailText").autocomplete({
	        	/* focus: function(event,ui){
	        		 return false;
	        	 },  
	        	
	        	 matchContains:false,
	        	 selectFirst:false,
	             minLength: 1, */
	    		 source: function(request,respone){
	    			 var keyword=($('#cat').val()==null)? "":$('#cat').val();
	    			 alert(keyword);
	    			$.ajax({
	    				type:"POST",
	    				dataType:'json',
	    				url: "/heartbeat/do/getKeyword/"+keyword,
	    				data:{
	    					searchWord:request.term
	    				},
	    				success:function(data){
	    					alert(ok);
	    				/*	
	    					var wordList= JSON.parse(data);
	    					response($.map(wordList,function(item){
	    						return {
	    							label:item,
	    							value:item
	    						};
	    					}))
	    				
	    					 */
	    	    		}/* ,
	    	    		select: function(event,ui){
	    	    			var cate=$('#categor').val();
	    	    			var deta= $('#detail').val();
	    	    			if(cate=='제목'){
	    		    			$('#searchBox').val($('#searchBox').val()+'*'+d+' ');
	    	    			}else if(cate=='아티스트'){
	    	    				$('#searchBox').val($('#searchBox').val()+'@'+d+' ');
	    	    			}else if(cate=='태그'){
	    	    				$('#searchBox').val($('#searchBox').val()+'#'+d+' ');
	    	    			}
	    	    		} */
		    		});
	         	} 
	   		}); 
	  });

	 function showDetailSearch(){
		$('#detailSearchCategory').toggle();
	}

	function searchDetailShowKeyword(category){
		var r=category.value;
		$('#cat').val("");
		$('#cat').val(r);
		$('#detailTextSpace').show();
	}
	function clickdetailText(){
		var c=document.getElementById('cat').value;
		var d=document.getElementById('detailText').value.trim().split(' ');
		alert('category: '+c);
		alert('detail: '+d);
	}
	
	 function autoTest(){
		var v= $('#searchBox').val();
		var varray=v.trim().split(' ');
			alert('varray: '+varray);
	}



function searchList(){
	
	var keyword=document.getElementById('searchBox').value.trim();
	/*alert('keyword: '+keyword);*/
	$.ajax({
		type:'POST',
		url:'/heartbeat/do/discoverList',
		data:{
				val:keyword
			},
		success:function(data){
			/* alert('ok'); */
			$('#keywordList').html("");
			$('#keywordList').html(data);
		}
		
	});
}
</script>
</head>
<body>
	<div id="placeHolder">
		가수는 @, 곡명은 *를, 태그는 #을 붙이고 단어마다 스페이스바를 해주세요! ex)@가수 *곡명 #태그
	</div>
	검색: <input type="text" id="searchBox">
	<input type="button" id="searchAll" value="검색" onclick="searchList()">
	<input type="button" id="detailSearch" onclick="showDetailSearch()" value="상세검색">
	
	<div id="detailSearchCategory" style="display: block;">
		<input type="button" value="tag" onclick="searchDetailShowKeyword(this)">
		<input type="button" value="artist" onclick="searchDetailShowKeyword(this)">
		<input type="button" value="title" onclick="searchDetailShowKeyword(this)">

		<div id="detailTextSpace" style="display: block;">
			<input type="text" id="cat"> 
			<input type="text" id="detailText"> 
			<input type="button" onclick="clickdetailText()" value="ok">
		</div>
	</div>
	
	<div id="keywordList">
		div id="keywordList"<Br>
		
	</div>
</body>

</html>