<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="/resources/js/jquery-ui.css">
  <script src="/resources/js/jquery-ui.js"></script>
  <script src="/resources/js/jquery.3.3.1.js"></script> -->
<script type="text/javascript">



/* 
 * 
 
 $(function(){
	    var autocomplete_text = ["자동완성기능","Autocomplete","개발로짜","국이"];
	         $("#detail").autocomplete({
	        	 focus: function(event,ui){
	        		 $(this).val(ui.item.label);
	        		 return false;
	        	 },
	            source: autocomplete_text,
	            minLength: 1,
	    		select: function(event, ui){
	    			var r=$('#categor').val();
	    			var d= $('#detail').val();
	    			if(r=='제목'){
		    			$('#searchBox').val($('#searchBox').val()+'*'+d+' ');
	    			}else if(r=='아티스트'){
	    				$('#searchBox').val($('#searchBox').val()+'@'+d+' ');
	    			}else if(r=='태그'){
	    				$('#searchBox').val($('#searchBox').val()+'#'+d+' ');
	    			}
	    		} 
	         });
	}) 
 
 
 
 */
	 function autoTest(){
		var v= $('#searchBox').val();
		var varray=v.trim().split(' ');
			alert('varray: '+varray);
	}

	function ds(){
		$('#detailSearch').toggle();
	}
	function searchDetail(testbutton){
		var r=testbutton.value;
		$('#categor').val("");
		$('#categor').val(r);
		$('#tagsearch').show();
	}
	
	function clickdetail(){
		var c=document.getElementById('categor').value;
		var d=document.getElementById('searchBox').value.trim().split(' ');
		alert('category: '+c);
		alert('detail: '+d);
	}

/* $(function(){
	$("#autocomplete").autocomplete({
		focus:function(event, ui){
			return false;
		},
		source:function(request, response){
			$.ajax({
				type: 'POST',
				url: "/autocomplete.jsp",
				dataType:"json",
				data:{value: request.term},
				success:function(data){
					response($.map(data,function(item){
						return{
							label: item.data,
							value: item.data
						}
					}));
				}
			})
		},
		minLength: 2,
		select: function(event, ui){
			$('#searchBox').val($('#searchBox').val()+'#'+$('#').val()+' ');
		}
	});
})  */

function searchList(){
	
	var keyword=document.getElementById('searchBox').value.trim();
	alert('keyword: '+keyword);
	$.ajax({
		type:'POST',
		url:'/heartbeat/do/discoverList',
		data:{
				val:keyword
			},
		success:function(data){
			alert('ok');
			$('#keywordList').html("");
			$('#keywordList').html(data);
		}
		
	});
}
</script>
</head>
<body>
	
	searchBox:<input type="text" id="searchBox">
	<input type="button" id="searchOne" value="검색" onclick="searchList()">
	<input type="button" id="detailSear1" onclick="ds()" value="상세검색">
	
	<div id="detailSearch" style="display: none;">
		<input type="button" value="태그" onclick="searchDetail(this)">
		<input type="button" value="아티스트" onclick="searchDetail(this)">
		<input type="button" value="제목" onclick="searchDetail(this)">

		<div id="tagsearch" style="display: none;">
			<input type="hidden" id="categor"> 
			<input type="text" id="detail"> 
			<input type="button" onclick="clickdetail()" value="ok">
		</div>
	</div>
	
	<div id="keywordList">
		div id="keywordList"<Br>
		
	</div>
</body>

</html>