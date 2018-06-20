<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<style>
.modal-backdrop {
	z-index: 990;
}

/* .modal-content{
		z-index:1010;
	} */
</style>
<script type="text/javascript">
$(document).ready(function(){
    $(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
            $(this).toggleClass('open');       
        }
    );
});

$(document).ready( function() {
/*     $('#myCarousel').carousel({
        interval:   4000
	}); */
	
	var clickEvent = false;
	$('#myCarousel').on('click', '.nav a', function() {
			clickEvent = true;
			$('.nav li').removeClass('active');
			$(this).parent().addClass('active');		
	}).on('slid.bs.carousel', function(e) {
		if(!clickEvent) {
			var count = $('.nav').children().length -1;
			var current = $('.nav li.active');
			current.removeClass('active').next().addClass('active');
			var id = parseInt(current.data('slide-to'));
			if(count == id) {
				$('.nav li').first().addClass('active');	
			}
		}
		clickEvent = false;
	});
});

function modalBtnLogin(){
	$('#modalBtnLogin').click();
}

function modaljoinBtn(){
	$('#joinBtn').click();
}
</script>

</head>
<body>
	<c:if test="${!empty loginSession }">
		<button onclick="goto('/logout');goto('/head')">logout</button>
		<button onclick="goto('/memberInfoChangeForm')">개인정보수정</button>
	</c:if>
	<c:if test="${empty loginSession }">
		<button id="modalBtnLogin1" onclick="modalBtnLogin()">로그인</button>
		<button id="joinBtn1" onclick="modaljoinBtn()">회원가입</button>
	</c:if>
</body>
