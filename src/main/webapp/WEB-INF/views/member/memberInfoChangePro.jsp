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
<style type="text/css">
</style>
</head>
<body>
<div class="memberChagne">
	<form action="/heartbeat/memberInfoChangePro2" id="form"
		enctype="multipart/form-data" method="post">
		<table class="changeInfoTb" style="margin-left : 35%;margni-top : 20%;border-collapse: separate;border-spacing: 1px;text-align: left;line-height: 1.5;border-top: 1px solid #ccc;">
			<tr>
				<td colspan="3" align="center">
					<img id="thumbnail" width="100" height="100">
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<label for="file" style="display: inline-block; padding: .5em .75em; color: #999; font-size: inherit; line-height: normal; vertical-align: middle; background-color: #fdfdfd; cursor: pointer; border: 1px solid #ebebeb; border-bottom-color: #e2e2e2; border-radius: .25em;">파일선택</label>
					<input type="file" id="file" value="업로드" name="file" style="position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0;">
				</td>
			</tr>
			<tr>
				<th style="width: 150px;padding: 10px;font-weight: bold;vertical-align: top;border-bottom: 1px solid #ccc;background: #efefef;">아이디</th>
				<td style="width: 350px;padding: 10px;vertical-align: top;border-bottom: 1px solid #ccc;">
				<input type="text" placeholder="${member.email }"
					readonly="readonly"></td>
			</tr>
			<tr>
				<th style="width: 150px;padding: 10px;font-weight: bold;vertical-align: top;border-bottom: 1px solid #ccc;background: #efefef;">닉네임</th>
				<td style="width: 350px;padding: 10px;vertical-align: top;border-bottom: 1px solid #ccc;">
				<input type="text" placeholder="${member.nick }"
					readonly="readonly"></td>
			</tr>
			<tr>
				<th style="width: 150px;padding: 10px;font-weight: bold;vertical-align: top;border-bottom: 1px solid #ccc;background: #efefef;">비밀번호</th>
				<td style="width: 350px;padding: 10px;vertical-align: top;border-bottom: 1px solid #ccc;">
				<input type="password" required="required" id="pw"
					name="pw"></td>
				<td><span id="pw_msg"></span></td>
			</tr>
			<tr>
				<th style="width: 150px;padding: 10px;font-weight: bold;vertical-align: top;border-bottom: 1px solid #ccc;background: #efefef;">비밀번호확인</th>
				<td style="width: 350px;padding: 10px;vertical-align: top;border-bottom: 1px solid #ccc;">
				<input type="password" required="required" id="re_pw"
					name="re_pw"></td>
				<td><span id="re_pw_msg"></span></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick="infoChange()" class="btn">
					<input type="button" value="취소" onclick="goto('/')" class="btn">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
