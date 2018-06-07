var footPlayer;
var footProgressFlag = 0;

initFoot(302);

function initFoot(sq) {
	footPlayer = WaveSurfer.create({
		container : '#footWaveform',
	});
	
	loadFoot(sq);
	footPlayer.sq = sq;
	
	footPlayer.on('ready', function () {
		footPlayer.duration = footPlayer.getDuration();
		$('#footDuration').text(formatTime(footPlayer.duration));
		$('#footProgress').text( formatTime(0));
		musicMain.setFootReady(true);
	});
	
	footPlayer.on('audioprocess', footProgress);
}


function loadFoot(sq) {
	footPlayer.load( "/heartbeat/resources/music/" + sq + ".mp3");
	musicMain.setFootReady(false);
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
}

function getFootMusicSq() {
	return footPlayer.sq;
}