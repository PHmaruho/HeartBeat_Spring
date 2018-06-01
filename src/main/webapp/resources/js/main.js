function supports_history_api() {
	return !!(window.history && history.pushState);
}

function swapContent(link, option) {
	var req = new XMLHttpRequest();
	
	if (option == 2) {	// content
		if (link == "/?r=1") {
			req.open("GET", processUrl() + "/home?r=1", false);
		} else {
			req.open("GET", processUrl() + link, false);
		}
		req.send(null);
		
		if (req.status == 200) {
			document.getElementById('contentDiv').innerHTML = req.responseText;	// jquery보다 성능이 좋다고 함
			return true;
		}
	} else {
		swapOption();
	}
	alert("end");
	return false;
	
	function swapOption() {
		req.open("GET", processUrl() + link, false);
		req.send(null);
		alert("1");
		
		if (req.status == 200) {
			alert("2");
			if (option == 0) {
				alert("3");
				document.getElementById('footDiv').innerHTML = req.responseText;	// jquery보다 성능이 좋다고 함
			} else if (option == 1) {
				document.getElementById('headDiv').innerHTML = req.responseText;	// jquery보다 성능이 좋다고 함
			} else {
				alert(option);
				alert("main.js/swapContent -> 뭔가 에러가 발생했습니다. 팀장을 찾으세요.");
			}
			return true;
		}
	}
}

function goto(link, optionNumber) {
	var option = 2;
	
	if (arguments.length == 1) {
		if (swapContent(link + "?r=1"), option) {
			history.pushState(null, null, processUrl() + link);
		}
	} else if (arguments.length == 2) {
		option = optionNumber;	// 0일땐 foot, 1일땐 head로 이동
		swapContent(link, option);
	} else {
		alert("goto 매개변수 확인해주세요. 매개변수 갯수 : " + arguments.length);
	}
}

function toform(link, id) {
	var data = $(id).serialize();
	
	if (swapContent(link + "?r=1&" + data)) {
		history.pushState(null, null, processUrl() + link);
	}
}

function processUrl() {
	var pac = $('#packageName').val();
	var url1 = location.href;
	var url2 = url1.split(pac);
	return url2[0] + pac;
}

window.onload = function() {
	if (!supports_history_api()) {
		return;
	}
	
	window.setTimeout(function() {
		window.addEventListener("popstate", function(e) {
			swapContent(location.pathname + "?r=1");
		}, false);
	}, 1);
}
