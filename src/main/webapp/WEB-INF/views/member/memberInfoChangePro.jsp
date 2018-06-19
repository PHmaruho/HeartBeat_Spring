<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<script type="text/javascript">
	function infoChange() {
		var pw = $('#pw').val();
		var re_pw = $('#re_pw').val();
		document.getElementById("pw_msg").innerHTML = "";
		document.getElementById("re_pw_msg").innerHTML = "";
		if (pw == null || pw == "") {
			document.getElementById("pw_msg").innerHTML = "비밀번호를 입력해주세요.";
			document.getElementById("pw").focus();
		} else {
			if (re_pw == null || re_pw == "") {
				document.getElementById("re_pw_msg").innerHTML = "비밀번호를 입력해주세요.";
				document.getElementById("re_pw").focus();
			} else if (pw != re_pw) {
				document.getElementById("re_pw_msg").innerHTML = "비밀번호가 다릅니다.";
				document.getElementById("re_pw").focus();
			} else {
				document.getElementById("form").submit();
			}
		}
	}
	$(document).ready(function(){
		var file = document.querySelector('#file');

		file.onchange = function () { 
		    var fileList = file.files ;
		    
		    // 읽기
		    var reader = new FileReader();
		    reader.readAsDataURL(fileList [0]);

		    //로드 한 후
		    reader.onload = function  () {
		        //로컬 이미지를 보여주기
		        /* document.querySelector('#preview').src = reader.result; */
		        
		        //썸네일 이미지 생성
		        var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
		        tempImage.src = reader.result; //data-uri를 이미지 객체에 주입
		        tempImage.onload = function() {
		            //리사이즈를 위해 캔버스 객체 생성
		            var canvas = document.createElement('canvas');
		            var canvasContext = canvas.getContext("2d");
		            
		            //캔버스 크기 설정
		            canvas.width = 100; //가로 100px
		            canvas.height = 100; //세로 100px
		            
		            //이미지를 캔버스에 그리기
		            canvasContext.drawImage(this, 0, 0, 100, 100);
		            //캔버스에 그린 이미지를 다시 data-uri 형태로 변환
		            var dataURI = canvas.toDataURL("image/jpeg");
		            
		            //썸네일 이미지 보여주기
		            document.querySelector('#thumbnail').src = dataURI;
		            
		            //썸네일 이미지를 다운로드할 수 있도록 링크 설정
		            /* document.querySelector('#download').href = dataURI; */
		        };
		    }; 
		}; 
	});
</script>
</head>
<body>
	<form action="/heartbeat/memberInfoChangePro2" id="form"
		enctype="multipart/form-data" method="post">
		<table>
			<tr>
				<td>
					<img id="thumbnail" width="100" height="100">
				</td>
			</tr>
			<tr>
				<td>
					<input type="file" id="file" value="업로드" name="file">
				</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" placeholder="${member.email }"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" placeholder="${member.nick }"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" required="required" id="pw"
					name="pw"></td>
				<td><span id="pw_msg"></span></td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td><input type="password" required="required" id="re_pw"
					name="re_pw"></td>
				<td><span id="re_pw_msg"></span></td>
			</tr>
			<tr>
				<td>
					<input type="button" value="수정" onclick="infoChange()">
				</td>
				<td>
					<input type="button" value="취소" onclick="goto('/')">
				</td>
			</tr>
		</table>
	</form>
</body>
