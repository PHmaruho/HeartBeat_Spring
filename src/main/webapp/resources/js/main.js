function supports_history_api() {
	return !!(window.history && history.pushState);
}

function swapContent(link) {
	var req = new XMLHttpRequest();
	
	if(link == "/foot?r=1" || link == "/head?r=1") {
		var newLink = link.replace('/', '').split('?')[0];
		req.open("GET", processUrl() + link, false);
		req.send(null);
		
		if (req.status == 200) {
			document.getElementById(newLink +  'Div').innerHTML = req.responseText;	// jquery보다 성능이 좋다고 함
			return false;
		}
	} else {
		if (link == "/" + $('#packageName').val() + "/?r=1") {
			req.open("GET", processUrl() + "/home?r=1", false);
		} else {
			req.open("GET", processUrl() + link, false);
		}
		req.send(null);
		
		if (req.status == 200) {
			document.getElementById('contentDiv').innerHTML = req.responseText;	// jquery보다 성능이 좋다고 함
			return true;
		}
	}
	
	return false;
}

function goto(link) {
	if (swapContent(link + "?r=1")) {
		history.pushState(null, null, processUrl() + link);
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
			var pathname = location.pathname.split($('#packageName').val()).pop();
			swapContent(pathname + "?r=1");
		}, false);
	}, 1);
}