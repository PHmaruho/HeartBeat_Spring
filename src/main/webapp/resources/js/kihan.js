function kkhcheck() {
	alert("실행");
	var result=false;
	var Vemail = $('#email').val();
	var Vpw = $('#pw').val();
	alert("Vemail->"+Vemail);
	alert("Vpw->"+Vpw);
	
	$.ajax({
		url:"/heartbeat/do/login1",
		data:{email : Vemail,pw : Vpw},
		/*dataType:'json',*/
		success:function(data){
			alert(data);
			if (data==0){
				alert("회원정보가 없습니다");
				$('#msg').html("");
				document.getElementById("msg").innerHTML="씨발새끼야";
				var result =  false;
			} 
			if(data==1){
				alert("실행됨");
				var result = true;
			}
		}
	});
	return result;
}