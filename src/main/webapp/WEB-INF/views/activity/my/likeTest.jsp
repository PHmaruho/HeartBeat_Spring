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
<style type="text/css">
/* body 공통 속성 */

	body {margin:0;padding:0; font:normal dotum,'돋움';}

	ul,ol,dl {list-style:none}

	img {border:0;vertical-align:top;}

	ul {list-style:none; padding:0; margin:0;}

	/* 중앙 우측 하단 박스 속성 */

	#ub_box_right {width:215px; height:283px; background:#000; padding:15px; }

	#ub_poll {float:right; width:215px; height:186px; background:#FFF; margin:0 0 15px 0;}

	#ub_notice {float:right; width:215px; height:80px; background:#FFF;}


</style>
</head>
<body>
<div class="div3">
<div id="lay_out">

	<div id="ub_top"></div>

	<div id="ub_left">

		<div id="ub_box">

			<div id="ub_main_bn"></div>

			<div id="ub_main_comm"></div>

			<div id="ub_main_link"></div>

		</div>


		<c:if test="${music_like_sq ne null}">
			<a href='javascript: like_func();'>
			<img src="${pageContext.request.contextPath }/resources/img/profile/like.png" id='like_img'></a>
		</c:if>
		
	
</table>
</div>

</body>
