function check() {
	alert("a");

	$.ajax({
		url : "<%=context%>/sample/sendVO2.do",
		data : {
			deptno : Vdeptno
		},
		dataType : 'json',
		success : function(data) {
			// json으로 받았기 때문에 .fisrtName으로 불러올 수 있음
			str = data.firstName + " " + data.lastName + " " + data.mno;
			alert(".ajax getDept str" + str);
			$('#RestDept').val(str);
		}
	})

	return false;
}