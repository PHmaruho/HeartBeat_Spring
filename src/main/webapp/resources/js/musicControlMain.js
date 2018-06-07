var formatTime = function (time) {
    return [
        Math.floor((time % 3600) / 60), // minutes
        ('00' + Math.floor(time % 60)).slice(-2) // seconds
    ].join(':');
};

var musicMain = (function() {
	var isMusicPage = false;
	var isFootReady = false;
	
	function getMusicPage() {
		return isMusicPage;
	};
	
	function setMusicPage(bool) {
		isMusicPage = bool;
	};
	
	function getFootReady() {
		return isFootReady;
	};
	
	function setFootReady(bool) {
		isFootReady = bool;
	};
	
	return {
		getMusicPage : getMusicPage,
		setMusicPage : setMusicPage,
		getFootReady : getFootReady,
		setFootReady : setFootReady
	};
})();
