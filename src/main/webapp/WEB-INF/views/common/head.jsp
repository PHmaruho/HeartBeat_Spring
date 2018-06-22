<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<style type="text/css">
.head {
	weight : 100%;
	height : 60px;
}
.modal-backdrop {
	z-index: 990;
}

/* .modal-content{
		z-index:1010;
	} */


.jan-contents {
	position : relative;
	height : 100%;
	width: 70%;
	margin: auto;
	
}
.logoImg {
	weight : 100px;
	height : 60px;
	margin-left : 10%;
	background-color: white;
}

.cbtn {
	height : 60px;
	border : 0;
	outline : 0;
}
.glyphicon {
	height : 60px;
	wieght : 60px;
	border : 0;
	outline : 0;
}

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
</script>

</head>
<body>
<div class="head">
	<div class="jan-contents">
		<img src="${pageContext.request.contextPath }/resources/img/banner/logo.gif" class="logoImg" >
		<button onclick="goto('/home')" class="cbtn">HOME</button>
		<button onclick="goto('/discover')"> <i class="glyphicon glyphicon-search"></i></button>
	</div>
	
	<c:if test="${!empty loginSession }">
		<button onclick="goto('/logout');goto('/head');goto('/')">logout</button>
		<button onclick="goto('/memberInfoChangeForm')">개인정보수정</button>
	</c:if>
	
<c:if test="${empty loginSession }">
	<button data-toggle="modal" data-target="#myModal" id="modalBtnLogin">로그인</button>
	<div id="myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	    <!-- Modal content-->
	    <div class="modal-content">
	      <!-- <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Modal Header</h4>
	      </div> -->
	      <div class="modal-body">
	        <form action="/heartbeat/loginPro" method="post" id="log_kkhform">
				<table>
					<tr>
						<td>이메일</td>
						<td><input type="text" id="log_email" name="email"
							required="required"></td>
							<td>
								<span id="log_email_msg"></span>
							</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" id="log_pw" name="pw"
							required="required"></td>
							<td>
								<span id="log_pw_msg"></span>
							</td>
					</tr>
					<tr>
						<td colspan="2"><span id="log_msg"></span></td>
					</tr>
					<tr>
						<td colspan="2"><input type="button" value="로그인" onclick="kkhcheck()">
						<input type="button" value="취소" data-dismiss='modal'>
						</td>
					</tr>
				</table>
			</form>
	      </div>
	      <!-- <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div> -->
	    </div>
	  </div>
	</div>	
	
	<input type="button" value="회원가입" data-toggle="modal" data-target="#myModal2" id="joinBtn">
		<div id="myModal2" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		    <!-- Modal content-->
		    <div class="modal-content">      
		      <div class="modal-body">
		        <form action="/heartbeat/joinPro" method="post" id="kkhform">
					<table>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="email" id="email" required="required"></td>
							<td><span id="email_msg"></span></td>
						</tr>
						<tr>
							<td colspan="2">
								<span id="email_validate"></span>
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="pw" id="pw" required="required"></td>
							<td><span id="pw_msg"></span></td>
						</tr>
						<tr>
							<th>비밀번호확인</th>
							<td><input type="password" id="re_pw" required="required"></td>
							<td><span id="repw_msg"></span></td>
						</tr>
						<tr>
							<th>별명</th>
							<td><input type="text" name="nick" id="nick" required="required"></td>
							<td><span id="nick_msg"></span></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="button" id="join_btn" value="회원가입" onclick="kkhjoin()">
								<input type="button" value="취소" data-dismiss='modal'>
							</td>
						</tr>
					</table>
				</form>
		      </div>	      
		    </div>	
		  </div>
		</div>
	</c:if>
	</div>
</body>
