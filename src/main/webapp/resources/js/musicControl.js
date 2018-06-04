function toFoot(sq) {
	if (!checkFoot(sq)) {
		destroyFoot();
		setIsSyncTrue();
		initFoot(sq);
	} else {
		playAll();
	}
}

function playAll() {
	playFoot();
	playDetail();
}

function pauseAll() {
	pauseFoot();
	pauseDetail();
}

function checkFoot(sq) {
	if (sq == getFootMusic()) {
		return true;
	} else {
		return false;
	}
}

function progressSync(sq) {
	if (checkFoot(sq)) {
		playDetail(getFootCurrent());
	}
}