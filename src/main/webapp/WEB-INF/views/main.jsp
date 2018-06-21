<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Heart Beat</title>
<link href="${pageContext.request.contextPath }/resources/css/csshake.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/kkh.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/jan.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/cwi.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/resources/js/jquery.3.3.1.js?v=<%=System.currentTimeMillis() %>"></script>
<script src="${pageContext.request.contextPath }/resources/js/wavesurfer.js?v=<%=System.currentTimeMillis() %>"></script>
<script src="${pageContext.request.contextPath }/resources/js/musicControlMain.js?v=<%=System.currentTimeMillis() %>"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
	.headDiv {
		height: 80px;
		width:100%;
		background-color: yellow;
		position: fixed;
		top: 0px;
		z-index: 999;
	}
	
	.contentWrap {
		width: 100%;
		position: relative;
		/* background-color: green; */
	}
	
	.emptyDiv {
		height: 80px;
		position: relative;
	}
	
	.footDiv {
		height: 50px;
		width: 100%;
		position: fixed;
		bottom: 0px;
		z-index: 999;
	}
</style>
<script type="text/javascript">
$(document).ready(function(){
	var i=0;
	if(i==0){
		goto("/head");
		i++;
	}
});
</script>
</head>
<body>
	<div class="headDiv" id="headDiv">
		<c:import url="/head"></c:import>
	</div>
	
	<div class="contentWrap">
		<div class="emptyDiv"></div>
		 
		<div class="contentDiv" id="contentDiv">
			<c:import url="${url }?c=${c }"></c:import>
		</div>
		
		<div class="emptyDiv"></div>
	</div>
	
	<div class="footDiv" id="footDiv">
		<c:import url="/foot"></c:import>
	</div>
	
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
	
	<input type="hidden" value="${packageName }" id="packageName">
	<script src="${pageContext.request.contextPath }/resources/js/kihan.js?v=<%=System.currentTimeMillis() %>"></script>
	<script src="${pageContext.request.contextPath }/resources/js/main.js?v=<%=System.currentTimeMillis() %>"></script>
</body>
</html>