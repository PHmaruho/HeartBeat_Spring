var detailPlayer = [];
var maxDetailNum = $('#maxDetailNum').val();


(function() {
	musicMain.setMusicPage(true);
	for (var i = 0; i <= maxDetailNum; i++) {
		initDetail(i, $('#detailMusicSq' + i).val());
		
//		if(detailPlayer[i].sq == getFootMusicSq()) {
//			console.log(i + '번째 : ' + getFootMusicSq());
//		}
	}
	console.log(musicMain.getFootReady());
//		while(!musicMain.getFootReady()) {
//			setTimeout(function () {
//				console.log(!musicMain.getFootReady());
//			}, 100);
//		}
})();

function initDetail(detailNum, sq) {
	var waveContainer = '#detailWaveForm' + detailNum;
	
	detailPlayer[detailNum] = WaveSurfer.create({
		container : waveContainer,
		waveColor: '#D2EDD4',
		progressColor: '#46B54D',
		barWidth : 5,
		barHeight : 1,
		height : 100,
		barRadius : 6,
		responsive : 10
	});
	
	loadDetail(detailNum, sq)
	detailPlayer[detailNum].sq = sq;
	detailPlayer[detailNum].setMute(true);
	
	detailPlayer[detailNum].on('ready', function () {
		detailPlayer[detailNum].duration = detailPlayer[detailNum].getDuration();
	    $('#detailDuration' + detailNum).text( formatTime(detailPlayer[detailNum].getDuration()) );
	    $('#detailProgress' + detailNum).text( formatTime(0));
	    detailPlayer[detailNum].ready = true;
	});
	
	detailPlayer[detailNum].on('audioprocess', function () {
	    $('#detailProgress' + detailNum).text( formatTime(detailPlayer[detailNum].getCurrentTime()) );
	    detailPlayer[detailNum].ready = false;
	});
}

function loadDetail(detailNum, sq) {
	detailPlayer[detailNum].load( "/heartbeat/resources/music/" + sq + ".mp3");
}

//
//
//
//detailPlayer.on('seek', function (e) {
//    seekDetailToFoot(e);
//});
