var formatTime = function (time) {
    return [
        Math.floor((time % 3600) / 60), // minutes
        ('00' + Math.floor(time % 60)).slice(-2) // seconds
    ].join(':');
};

var musicMain = (function() {
	var isMusicPage = false;
	var isFootReady = false;
	var detailNum = -1;
	
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
	
	function getDetailNum() {
		return detailNum;
	};
	
	function setDetailNum(num) {
		detailNum = num;
	};
	
	return {
		getMusicPage : getMusicPage,
		setMusicPage : setMusicPage,
		getFootReady : getFootReady,
		setFootReady : setFootReady,
		getDetailNum : getDetailNum,
		setDetailNum : setDetailNum
	};
})();
