<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<style type="text/css">
	.foot {
		background-color: yellow;
		width: 100%;
		height: 100%;
		display: inline-block;
	}
</style>
</head>

<body>
	<div class="cwi-foot-main">
		<div class="foot-player-main">
			<div hidden="true" id="footWaveform"></div>	
			<div class="cwi-foot-player-left">
				<span class="cwi-foot-player-buttons">
					<a id="footBackBtn"><img src="${pageContext.request.contextPath }/resources/img/icon/008-backward.png"></a>
					<a id="footPlayBtn" onclick="playFromFoot()">
						<img src="${pageContext.request.contextPath }/resources/img/icon/011-play-button.png">
					</a>
					<a id="footPauseBtn" class="cwi-foot-display-none" onclick="pauseFromFoot()">
						<img src="/heartbeat/resources/img/icon/006-pause.png">
					</a>
					<a id="footForBtn"><img src="${pageContext.request.contextPath }/resources/img/icon/009-forward.png"></a>
					<a id="footChnageBtn"><img src="${pageContext.request.contextPath }/resources/img/icon/002-change.png"></a>
					<a id="footRepeatBtn"><img src="${pageContext.request.contextPath }/resources/img/icon/001-refresh.png"></a>
				</span>
				<span id="footProgress" class="cwi-foot-current">0:00</span>
				<span class="cwi-foot-player-bar"> 
					<input type="range" id="footProgressBar" value="0" min="0.0" max="1.0" step="0.0001"
						onmousedown="switchFootProgress()" onmouseup="switchFootProgress()" oninput="changeFootProgress()">
				</span>
				<span id="footDuration" class="cwi-foot-current">0:00</span>
				
				<div id="footVolumeLeave" class="cwi-foot-player-volume-contorl">
					<span id="footVolumeEnter" class="cwi-foot-player-volume-icon">
						<img src="${pageContext.request.contextPath }/resources/img/icon/volume-button-64.png">
					</span>
					<div id="footVolumeDisplay" class="cwi-foot-player-volume cwi-foot-display-none">
						<input id="footVoulume" type="range" min="0.0" max="1.0" step="0.01" value="0.5"
							oninput="footPlayer.setVolume(this.value)" onchange="footPlayer.setVolume(this.value)">	
					</div>
				</div>
			</div>
			
			
			<div class="cwi-foot-player-right">
				<table class="cwi-foot-player-info">
					<tr>
						<td rowspan="2"><span id="footImage"></span></td>
						<td><span id="footArtists" class="cwi-vertical-bottom"></span></td>
					</tr>
					<tr>
						<td><span id="footTitle" class="cwi-vertical-top"></span></td>
					</tr>
				</table>
				
				<%-- <input type="button" value="playlist" onclick="playlistClick()">
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
				</div> --%>
			</div>
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
		

	</script>
</body>
