var footPlayer;
var footProgressFlag = 0;

initFoot(302);

function initFoot(sq) {
	footPlayer = WaveSurfer.create({
		container : '#footWaveform',
	});
	
	loadFoot(sq);
	getFootLoad(sq);
	musicMain.setFootReady(true);
	
	footPlayer.on('ready', function () {
		footPlayer.duration = footPlayer.getDuration();
		$('#footDuration').text(formatTime(footPlayer.duration));
		$('#footProgress').text( formatTime(0));
		
		if (musicMain.getMusicPage()) {
			for(var i = 0; i <= maxDetailNum; i++) {
				if (detailPlayer[i].sq == footPlayer.sq) {
					musicMain.setDetailNum(i);
				}
			}
		}
		
		var array = footPlayer.info.artistList;
		var artistsLength = array.length;
		var artists = '';
		
		for (var j = 0; j < artistsLength; j++) {
			artists = artists + array[j].nick;
			
			if (j + 1 != artistsLength) {
				artists = artists + ', ';
			}
		}
		$('#footImage').html('<img src="/heartbeat/resources/img/album/' + footPlayer.info.album_sq + '.png" width="30" height="30">');
		$('#footTitle').html('title : ' + footPlayer.info.music_nm);
		$('#footArtists').html('artists : ' + artists);
	});
	
	footPlayer.on('audioprocess', footProgress);
}


function loadFoot(sq) {
	footPlayer.sq = sq;
	musicMain.setFootReady(false);
	musicMain.setDetailNum(-1);
	footPlayer.load( "/heartbeat/resources/music/" + sq + ".mp3");
}

function switchFootProgress() {
	if (footProgressFlag == 0) {
		footProgressFlag = 1;
	} else {
		footProgressFlag = 0;
		footPlayer.seekTo(Number($('#footProgressBar').val()));
	}
}

function footProgress()  {
	if (footProgressFlag == 0) {
		$('#footProgress').text( formatTime(footPlayer.getCurrentTime()) );
	    $('#footProgressBar').val(footPlayer.getCurrentTime()/footPlayer.duration);
	}
}

function changeFootProgress() {
	$('#footProgress').text( formatTime($('#footProgressBar').val() * footPlayer.duration) );
	
	var num = musicMain.getDetailNum();
	if (num != -1) {
		detailPlayer[num].seekTo(Number($('#footProgressBar').val()));
	}
}

function playFromFoot() {
	var num = musicMain.getDetailNum();
	if (num != -1) {
		detailPlayer[num].play();
	}
	footPlayer.play();
}

function pauseFromFoot() {
	var num = musicMain.getDetailNum();
	if (num != -1) {
		detailPlayer[num].pause();
	}
	footPlayer.pause();
}

function checkFootReady(callback, parameter) {
	var repeat = setInterval(isReady, 50);
	var params = arguments.length;
	
	function isReady() {
		if(musicMain.getFootReady() == true) {
			clearInterval(repeat);
			if (typeof callback === "function") {
				if(params == 1) {
					callback();
				} else if(params == 2) {
					callback(parameter);
				} else {
					console.log('checkFootReady parameter error');
				}
			} else {
				console.log('checkFootReady callback error');
			}
		}
	}
}

function getFootLoad(sq) {
	$.ajax({
		type : 'GET',
		url : '/heartbeat/do/footLoad/' + sq,
		success : function(data) {
			footPlayer.info = data;
		},
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:" + request.responseText + "\n"+"error:"+error);
	    }
	});
}


function addCookie(sq) {
	var max = getMaxCookie() + 1
	if (max < 51) {
		var cname = 'cookieOrder' + max;
		setCookie(cname, sq, 365);
		console.log(document.cookie);
	} 
}

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+ d.toUTCString();
    document.cookie = cname + "=" + encodeURI(cvalue) + ";" + expires + ";path=/";
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return decodeURI(c.substring(name.length, c.length));
        }
    }
    return "";
}

function cookieToObject() {
	var ca = document.cookie.split(';');
	var result = {};
		
	for (var i = 0; i < ca.length; i++) {
		var c = ca[i];

		while (c.charAt(0) == ' ') {
			c = c.substring(1);
		}
		
		var cur = c.split('=');
		
		result[cur[0]] = cur[1];
	}
	return result;
}

function deleteCookie(cname) {
	document.cookie = cname + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
}

function getMaxCookie() {
	var obj = cookieToObject();
	var arr = [];
	
	for (var i in obj) {
		arr.push(i.replace('cookieOrder', ''));
	}
	
	return Math.max.apply(null, arr);
}

getMaxCookie();

//setCookie('order1', 'con1', 365);
//setCookie('order2', 'con2', 365);
//setCookie('order3', 'con3', 365);
//setCookie('order4', 'con4', 365);