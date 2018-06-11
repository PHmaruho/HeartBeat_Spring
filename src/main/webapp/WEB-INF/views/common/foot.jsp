<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<style type="text/css">
	.foot {
		background-color: yellow;
		height: 80px;
	}
	
	#footProgressBar {
		width: 50%
	}
	
	.cwi-foot-playlist {
		background-color: gray;
		position: absolute;
		bottom: 100%;
		right: 20%;
		display: none;
	}
	
	.cwi-foot-playlist:hover {
		cursor: pointer;
	}
	
	.cwi-foot-display-none {
		display: none;
	}
	
	.cwi-foot-display-block {
		display: block;
	}
	
	.cwi-foot-playlist-table {
		border: 1px solid black;
	}
</style>
</head>

<body>
	<div class="foot">
		<input type="button" value="play" onclick="playFromFoot()">
		<input type="button" value="pause" onclick="pauseFromFoot()">
		
		<span id="footProgress"></span>
		<input type="range" id="footProgressBar" value="0" min="0.0" max="1.0" step="0.0001"
			onmousedown="switchFootProgress()" onmouseup="switchFootProgress()" oninput="changeFootProgress()">
		<span id="footDuration"></span>
		<input id="footVoulume" type="range" min="0.0" max="1.0" step="0.01" value="0.5"
			oninput="footPlayer.setVolume(this.value)" onchange="footPlayer.setVolume(this.value)">	
		<div hidden="true" id="footWaveform"></div>	
		<input type="button" value="playlist" onclick="playlistClick()">
		<div id="playlist" class="cwi-foot-playlist">
			<table class="cwi-foot-playlist-table">
				<c:forEach var="playlist" items="${playlist}">
					<tr onclick="loadFoot(${playlist.music_sq}); alert(${playlist.music_sq} + '로 음악 변경, 임시기능이기에 직접 play 바람, 동기화 미지원')">
						<td>sq : ${playlist.music_sq} </td>
						<td>
							<c:forEach var="artistList" items="${playlist.artistList}">
								artist : ${artistList.nick }
							</c:forEach>
						</td>	
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	
	
	<script src="${pageContext.request.contextPath }/resources/js/musicControlFoot.js?v=<%=System.currentTimeMillis() %>"></script>
	<script type="text/javascript">
		var playlistTest = false;
		
		function playlistClick() {
			var o = document.getElementById('playlist');
			
			if (playlistTest == false) {
				o.style.display = 'block';
				playlistTest = true;
			} else {
				o.style.display = 'none';
				playlistTest = false;
			}
		}
		
		console.log(1);
	</script>
</body>
