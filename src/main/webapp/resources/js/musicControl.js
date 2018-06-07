function toFoot(sq) {
	if (!checkFoot()) {
		footReload(sq);
	} else {
		playAll();
		
	}
}

function fromFoot() {
	if (checkFoot()) {
		playAll();
	} else {
		playFoot();
	}
}

function playAll(start) {
	if(arguments.length == 0) {
		playFoot();
		playDetail();
	} else if(arguments.length == 1) {
		playFoot(start);
		playDetail(start);
	} else {
		console.log('playFoot Error');
	}
}

function pauseAll() {
	pauseFoot();
	pauseDetail();
}

function checkFoot() {
	if (getDetailMusic() == getFootMusic()) {
		return true;
	} else {
		return false;
	}
}

function progressSync() {
	if (checkFoot()) {
		playDetail(getFootCurrent());
	}
}

function seekFootToDetail(number) {
	if (checkFoot()) {
		seekDetail(number);
	}
}

function seekDetailToFoot(number) {
	console.log('seekDetailToFoot enter');
	if (!checkFoot()) {
		console.log('1');
		toFoot(getDetailMusic());
	}
	
	if(isFootReady()) {
		console.log('2');
		seekFoot(number);
		playAll();
	}
	console.log('3');
}

function isFootReady() {
	console.log('i enter');
	while(!getFootReady()) {
		console.log(getFootReady());
	}
	return true;
}