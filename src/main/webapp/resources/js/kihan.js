function kkhcheck() {
	var Vemail = $('#log_email').val();
	var Vpw = $('#log_pw').val();
	if(Vemail != null && Vemail != ""){
		if(Vpw != null && Vpw != ""){
			$.ajax({
				url : "/heartbeat/do/login",
				data : {
					email : Vemail,
					pw : Vpw
				},
				cache : false,
				success : function(data) {
					if (data != 0) {
						$.ajax({
							url : "/heartbeat/do/loginRest",
							data : {
								email : Vemail,
								pw : Vpw
							},
							dataType : 'json',
							cache : false,
							success : function(data) {
								if (data.email != null || data.email != "") {
									if (data.status == "A1") {
										var url = window.location.pathname.replace('/' + $('#packageName').val(), '');
										$('#loginUrl').val(url)	// cwi - 현재 url hidden에 저장
										document.getElementById("log_kkhform").submit();
									}
									if (data.status == "A2") {
										document.getElementById("log_msg").innerHTML = "재재된 계정입니다.";
									}
									if (data.status == "A0") {
										
										location.href = "/heartbeat/emailCertify?email="+data.email;
									}
								}
							}
						});
					}
					if (data == 0) {
						document.getElementById("log_msg").innerHTML = "다시 확인해주세요.";
					}
				}
			});		
		}else{
			document.getElementById("log_pw_msg").innerHTML="비밀번호를 입력해주세요";
			document.getElementById("log_pw").focus();
		}
		
	}else{
		document.getElementById("log_email_msg").innerHTML="이메일을 입력해주세요";
		document.getElementById("log_email").focus();
	}

}

$(document).ready(function(){
	$('#joinBtn').click(function(){
		/*$('#myModal').modal('hide');
		$('#myModal2').modal('toggle');*/
	})
	var emailex = /([\da-z_-]+)@([\da-z_-]+)\.([a-z\.]{2,6})/;
	
	$('#email').keyup(function(){
		var email = $("#email").val(); 
		/*document.getElementById("email_msg").innerHTML=email;*/
		if(email != null && email != ""){
			if(emailex.test(email)){
				document.getElementById("email_validate").innerHTML="";
			}else{
				document.getElementById("email_validate").innerHTML="올바른 형식으로 입력해주세요.";
			}
		}else{
			document.getElementById("email_validate").innerHTML="";
		}
	});
});

function kkhjoin(){
	var emailex = /([\da-z_-]+)@([\da-z_-]+)\.([a-z\.]{2,6})/;
	var Vemail = $('#email').val();
	var Vpw = $('#pw').val();
	var Vre_pw = $('#re_pw').val();
	var Vnick = $('#nick').val();
	document.getElementById("email_msg").innerHTML="";
	document.getElementById("pw_msg").innerHTML="";
	document.getElementById("repw_msg").innerHTML="";
	document.getElementById("nick_msg").innerHTML="";
	if(Vemail != null && Vemail != ""){
		if(emailex.test(Vemail)){
		if(Vpw != null && Vpw != ""){
			if(Vre_pw != null && Vre_pw != ""){
				if(Vnick != null && Vnick != ""){
					if(Vpw == Vre_pw){	
						$.ajax({
							url:"/heartbeat/do/emailCheck",
							data:{email:Vemail},
							success:function(data){
								if(data==0){
									document.getElementById("kkhform").submit();
								}else{
									document.getElementById("email_msg").innerHTML="존재하는 이메일입니다.";
									document.getElementById("email").focus();
								}
							}
						});						
					}else{
						document.getElementById("repw_msg").innerHTML="비밀번호가 다릅니다.";
						document.getElementById("re_pw").focus();
					}
				}else{
					document.getElementById("nick_msg").innerHTML="별명을 입력해주세요.";
					document.getElementById("nick").focus();
				}
			}else{
				document.getElementById("repw_msg").innerHTML="비밀번호확인을 입력해주세요.";
				document.getElementById("re_pw").focus();
			}
		}else{
			document.getElementById("pw_msg").innerHTML="비밀번호를 입력해주세요.";
			document.getElementById("pw").focus();
		}
		}
	}else{
		document.getElementById("email_msg").innerHTML="이메일을 입력해주세요";
		document.getElementById("email").focus();
	}
}

function modalBtnLogin(){
	$('#modalBtnLogin').click();
}

function modaljoinBtn(){
	$('#joinBtn').click();
}