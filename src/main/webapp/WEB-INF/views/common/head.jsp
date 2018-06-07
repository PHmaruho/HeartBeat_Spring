<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<style type="text/css">
img.left {
	float:left;
}
</style>
<script>
        $(document).ready(function(){
          
            $("#btn-menu").hover(function(){
                $("#sideNav").toggleClass("showHalfMenu");
                         
                
            });
            
            $(".side-li").hover(function(){
                $("#sideNav").toggleClass("showFullMenu");
               $(".removeText").toggle();              
               
            });
          
      
        });
    
    </script>
    
</head>
<body>
	<div class="head">
	<div class="container">
		<img
			src="${pageContext.request.contextPath }/resources/img/profile/logo.png"
			style="width: 100px; height: 50px; vertical-align: left" /> <img
			src="${pageContext.request.contextPath }/resources/img/profile/like.png"
			style="width: 30px; height: 30px; vertical-align: left" />
	
	<div class="collapse navbar-collapse" id="myNavbar">
	    <ul class="nav navbar-nav navbar-left">      
	      <li><a href="#" class="home"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
	        <form class="navbar-form navbar-left">
	      <div class="input-group">        
	        <div class="input-group-btn">
	          <button class="btn btn-default" type="submit">
	            <i class="glyphicon glyphicon-search"></i>
	          </button>
	        </div>
			<input type="text" class="form-control" placeholder="Search">
	      </div>
	    </form> 
	    </ul>
    	
		<form class="navbar-form navbar-right">
			<div class="input-group">
				<div class="input-group-btn">
					<button class="btn btn-default-1" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form>
	
		<a href="#">Home</a>
		<a href="#">Track</a>
		
		<!-- 로그인, 로그아웃 -->
		<c:choose>
		    <c:when test="${sessionScope.member_sq == null}">
			<button onclick="goto('/loginForm')">Login</button>
		    </c:when>
		    <c:otherwise>
		        ${sessionScope.nick}님
		        <a href="${path}/member/logout.do">로그아웃</a> |
		    </c:otherwise>
		</c:choose>    
		<hr>
	</div>
</div>
</body>
