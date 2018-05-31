function supports_history_api() {
	return !!(window.history && history.pushState);
}

function swapContent(link) {
	var req = new XMLHttpRequest();
	if (link == "/?r=1") {
		req.open("GET", "http://localhost:8181/home?r=1", false);
	} else {
		req.open("GET", link, false);
	}
	req.send(null);
	
	if (req.status == 200) {
		document.getElementById("contentDiv").innerHTML = req.responseText;
		return true;
	}
	return false;
}

function goto(link) {
	if (swapContent(link + "?r=1")) {
		history.pushState(null, null, "http://localhost:8181" + link);
	}
}

function toform(link, id) {
	var data = $(id).serialize();
	alert(data);
	
	if (swapContent(link + "?r=1&" + data)) {
		history.pushState(null, null, "http://localhost:8181" + link);
	}
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
