function kkhcheck() {
	alert("실행");

	var context = $('#path').val();
	var Vemail = $('#email').val();
	var Vpw = $('#pw').val();
	
	$.ajax({
		url : "/do/login",
		data : {email : Vemail,pw : Vpw},
		dataType : 'json',
		success : function(data) { // json으로 받았기
			// 때문에 .fisrtName으로 불러올 수 있음
			if (data==null || data =="") {
				$('#msg').html("회원정보가 없습니다.");
				return false;
			} else {
				alert("실행됨");
				return true;
			}
		}
	})
}