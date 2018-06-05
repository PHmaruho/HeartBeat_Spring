<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>

<script type="text/javascript">
function like_func() {
	var frm_read = $(frm_read);
	var target_sq = $('#target_sq',frm_read).val();
	//var member_sq = $('#member_sq',frm_read).varl();
	console.log("target_sq, member_sq :"+target_sq+","+member_sq);
$.ajax({
	url:"/do/like",
	type: "GET",
	cache: false,
	dataType: "json",
	data: 'target_sq='+target_sq,
	success: function(data) {
		var msg ='';
		var like_img='';
		msg += data.msg;
		alert(msg);
		
		if(data.like_check == 0 ) {
			like_img="resources/img/profile/dislike.png";
		} else {
			like_img="resources/img/profile/like.png"
		}
		$('#like_img',frm_read).attr('src',like_img);
		$('#like_cnt').html(data.like_cnt);
		$('#like_check').html(data.like_check);
	},
	error : function(request,status,error) {
		alert("code:"+request.status+"|n"+"message:"+request.responseText+"|n"+"error:"+error);
	}
});
}

</script>
</head>
<body>
<div class="div3">
	<c:choose>
		<c:when test="${music_like_sq ne null}">
			<a href='javascript: like_func();'>
			<img src="${pageContext.request.contextPath }/resources/img/profile/dislike.png" id='like_img'></a>
			
		</c:when>
		<c:otherwise>
			<a href='javascript:login_need();'>
			<img src="${pageContext.request.contextPath }/resources/img/profile/dislike.png"></a>
		</c:otherwise>
	</c:choose>
	
</div>

</body>
