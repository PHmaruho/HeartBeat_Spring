var footPlayer;
var footProgressFlag = 0;

cookieList();
initFoot(302);

function initFoot(sq) {
	footPlayer = WaveSurfer.create({
		container : '#footWaveform',
	});
	
	loadFoot(sq);
	getFootLoad(sq);
	
	footPlayer.on('ready', function () {
		musicMain.setFootReady(true);
		footPlayer.duration = footPlayer.getDuration();
		$('#footDuration').text(formatTime(footPlayer.duration));
		$('#footProgress').text( formatTime(0));
		
		if (musicMain.getMusicPage()) {
			for(var i = 0; i <= maxDetailNum; i++) {
				if (typeof detailPlayer[i] !== 'undefined' && detailPlayer[i].sq == footPlayer.sq) {
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
	pauseDisplayButton();
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
		var val = footPlayer.getCurrentTime()/footPlayer.duration;
		$('#footProgress').text( formatTime(footPlayer.getCurrentTime()) );
	    $('#footProgressBar').val(val);
	    
	    $('#footProgressBar').css('background-image',
                '-webkit-gradient(linear, left top, right top, '
                + 'color-stop(' + val + ', #FF0000), '
                + 'color-stop(' + val + ', #C5C5C5)'
                + ')'
        );
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
	
	playDisplayButton();
}

function pauseFromFoot() {
	var num = musicMain.getDetailNum();
	if (num != -1) {
		detailPlayer[num].pause();
	}
	footPlayer.pause();
	
	pauseDisplayButton();
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
		    console.log('code : ' + request.status + '\n' + 'message : ' + request.responseText + '\n' + 'error : ' + error);
	    }
	});
}

function setCookie(cname, cvalue) {
    var d = new Date();
    d.setTime(d.getTime() + (90 * 24 * 60 * 60 * 1000));	// 90일 * 24시간 * 60분 * 60초 * 1000밀리초
    var expires = 'expires=' + d.toUTCString();
    
    if (arguments.length === 2) {
    	var cookieName = 'cookieOrder' + cname;
    	var cookie = {'cookieOrder' : 'cookieOrder', 'cookieOrder1' : cvalue + ''};
    	
    	$.ajax({
    		type : 'POST',
    		url : '/heartbeat/do/cookieList',
    		data : JSON.stringify(cookie),
    		contentType: 'application/json; charset=UTF-8',
    		success : function(data) {
    			document.cookie = 'cookieOrder' + cname + '=' + encodeURI(cvalue) + ';' + expires + ';path=/';
    			footPlayer.cookieList[cookieName] = data.cookieOrder1;
    		},
    		error:function(request,status,error){
    		    console.log('code : ' + request.status + '\n' + 'message : ' + request.responseText + '\n' + 'error : ' + error);
    	    }
    	});
    } else if (arguments.length === 1) {
    	document.cookie = 'cookieOrder=' + encodeURI(cname) + ';' + expires + ';path=/';
    } else {
    	console.log('musicControlFoot setCookie parameter error');
    }
}

function getCookie(cname) {
	var name;
	var ca = document.cookie.split(';');
	
	if (arguments.length === 1) {
		name = 'cookieOrder' + cname + '=';
	} else if (arguments.length === 0) {
		name = 'cookieOrder=';
	} else {
		console.log('musicControlFoot getCookie parameter error');
	}
    
    for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        
        if (c.indexOf(name) == 0) {
            return decodeURI(c.substring(name.length, c.length));
        }
    }
    
    return '';
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
	var max = getMaxCookie();
	
	if (arguments.length === 1) {
		var cur = getCookie();
		
		for (var i = cname; i < max; i++) {
			setCookie(i, getCookie(i + 1));
		}
		document.cookie = 'cookieOrder' + max + '=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;';
		delete footPlayer.cookieList['cookieOrder' + max];
		
		if (cname == cur) {
			loadFoot(getCookie(cur));
		} else if (cname < cur) {
			setCookie(cur - 1);
		}
	} else if (arguments.length === 0) {
		
		for (var i = 1; i <= max; i++) {
			document.cookie = 'cookieOrder' + i + '=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;';
		}
		document.cookie = 'cookieOrder=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;';
		delete footPlayer.cookieList;
	} else {
		console.log('musicControlFoot deleteCookie parameter error');
	}
}

function getMaxCookie() {
	var obj = cookieToObject();
	var arr = [];
	
	for (var i in obj) {
		arr.push(i.replace('cookieOrder', ''));
	}
	
	return Math.max.apply(null, arr);
}

function cookieFromAdd(sq) {
	var max = getMaxCookie();
	
	if (max >= 100) {
		var cur = getCookie();
		
		for (var i = 1; i < max; i++) {
			setCookie(i, getCookie(i + 1));
		}
		setCookie(max, sq);
		
		if (cur == 1) {
			loadFoot(getCookie(1));
		}
	} else if (max == 0) {
		setCookie(1, sq);
		setCookie(1);
	} else {
		setCookie(max + 1, sq);
	}
}

function cookieFromPlay(sq) {
	var max = getMaxCookie();
	var cur = getCookie();
	
	if (max >= 100) {
		for (var i = 1; i < cur; i++) {
			setCookie(i, getCookie(i + 1));
		}
	} else if (max == 0) {
		setCookie(1, sq);
		setCookie(1);
	} else {
		for (var i = max; i >= cur; i--) {
			setCookie(i + 1, getCookie(i));
		}
	}
	
	setCookie(cur, sq);
	loadFoot(sq);
}

function cookieList() {
	var cookie = cookieToObject();
	
	if (getMaxCookie() != 0) {
		$.ajax({
			type : 'POST',
			url : '/heartbeat/do/cookieList',
			data : JSON.stringify(cookie),
			contentType: 'application/json; charset=UTF-8',
			success : function(data) {
				footPlayer.cookieList = data;
				console.log(footPlayer.cookieList);
			},
			error:function(request,status,error){
			    console.log('code : ' + request.status + '\n' + 'message : ' + request.responseText + '\n' + 'error : ' + error);
		    }
		});
	}
}

function initPlaylist() {
	var list = $('#playlistTable');
	var max = getMaxCookie();
	var newHtml = '';
	
	for (var i = 1; i <= max; i++) {
		var cookie = footPlayer.cookieList['cookieOrder' + i];
		newHtml = newHtml + 
		'<tr onclick="loadFoot('+ cookie.music_sq +')">' +
			'<td>sq : '+ cookie.music_sq +' </td>' +
			'<td>'+
				'<c:forEach var="artistList" items="${playlist.artistList}">' +
					'artist : ${artistList.nick }' +
				'</c:forEach>' +
			'</td>' +
		'</tr>';
	}
}

$('input[type="range"]').change(function () {
    var val = ($(this).val() - $(this).attr('min')) / ($(this).attr('max') - $(this).attr('min'));
    
    $(this).css('background-image',
                '-webkit-gradient(linear, left top, right top, '
                + 'color-stop(' + val + ', #FF0000), '
                + 'color-stop(' + val + ', #C5C5C5)'
                + ')'
                );
});

function playDisplayButton() {
	$('#footPlayBtn').addClass('cwi-foot-display-none');
	$('#detailPlayBtn' + musicMain.getDetailNum()).addClass('cwi-foot-display-none');
	$('#footPauseBtn').removeClass('cwi-foot-display-none');
	$('#detailPauseBtn' + musicMain.getDetailNum()).removeClass('cwi-foot-display-none');
	$('#detailRotateBtn' + musicMain.getDetailNum()).addClass('cwi-detail-rotate');
}

function pauseDisplayButton() {
	$('#footPlayBtn').removeClass('cwi-foot-display-none');
	$('#detailPlayBtn' + musicMain.getDetailNum()).removeClass('cwi-foot-display-none');
	$('#footPauseBtn').addClass('cwi-foot-display-none');
	$('#detailPauseBtn' + musicMain.getDetailNum()).addClass('cwi-foot-display-none');
	$('#detailRotateBtn' + musicMain.getDetailNum()).removeClass('cwi-detail-rotate');
}

$('#footVolumeEnter').on('mouseenter', function() {
	$('#footVolumeDisplay').removeClass('cwi-foot-display-none');
});

$('#footVolumeLeave').on('mouseleave', function() {
	$('#footVolumeDisplay').addClass('cwi-foot-display-none');
});


function cwi_reLike(sq, v) {
	if (checkLogin()) {
		$.ajax({
			url: '/heartbeat/do/reLike/' + sq,
			success: function() {
				$('#'+v.parentNode.id).load('#'+v.id+' '+'#'+v.id);
			}
		});
	}
}

function cwi_unLike(sq, v) {
	if (checkLogin()) {
		$.ajax({
			url: '/heartbeat/do/unLike/' + sq,
			success: function() {
				$('#'+v.parentNode.id).load('#'+v.id+' '+'#'+v.id);
			}
		});
	}
}

function checkLogin() {
	if ($('#loginSession').val() == '') {
		loginButtonClick();
		return false;
	} else {
		return true;
	}
}

function cwi_follow(sq, v) {
	if (checkLogin()) {
		var session = $('#loginSession').val();
		
		if (sq == session) {
			alert('본인을 팔로우 할 수 없습니다.');
		} else {
			$.ajax({
				url: '/heartbeat/do/follow',
				data: {
					member_sq : sq,
					loginSession : session
				},
				success : function() {
					$('#'+v.parentNode.id).load('#'+v.id+' '+'#'+v.id);
				}
			});
		}
	}
}


function cwi_unfollow(targetSq, v) {
	if (checkLogin()) {
		var memberSq = $('#loginSession').val();
		
		if(targetSq == memberSq) {
			alert('본인을 팔로우할 수 없습니다.')
		} else {
			$.ajax({
				url: '/heartbeat/do/unfollow',
				data: {
					member_sq : memberSq,
					target_sq : targetSq
				},
				success : function() {
					$('#'+v.parentNode.id).load('#'+v.id+' '+'#'+v.id);
				}
			});
		}
	}
}

//console.log(cookieToObject());
//deleteCookie(1);
//console.log(cookieToObject());
//console.log(footPlayer.cookieList);

//deleteCookie();
//cookieFromAdd(302);
//console.log(document.cookie);
