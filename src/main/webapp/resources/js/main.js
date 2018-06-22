function supports_history_api() {
	return !!(window.history && history.pushState);
}

function swapContent(link) {
	if(link == "/foot?r=1" || link == "/head?r=1") {
		var newPath = link.replace('/', '').split('?')[0];
		$('#' + newPath +  'Div').load(processUrl() + link);
		return false;
	} else {
		musicMain.setDetailNum(-1);
		musicMain.setMusicPage(false);
		if (link == '/?r=1') {
			$('#contentDiv').load(processUrl() + '/home?r=1');
		} else {
			$('#contentDiv').load(processUrl() + link);
		}
		return true;
	}
}

function goto(link) {
	if (swapContent(link + "?r=1")) {
		history.pushState(null, null, processUrl() + link);
	}
}

function toform(link, id) {
	var data = $(id).serialize();
	alert(data);
	
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
