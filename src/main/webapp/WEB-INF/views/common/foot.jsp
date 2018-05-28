<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<style type="text/css">
	.foot {
		background-color: yellow;
		height: 80px;
	}
</style>

</head>
<body>
	<div class="foot">
		foot
		<audio id="audio" controls="controls" preload="auto" src="resources/music/Kalimba.mp3" >
		</audio>
	</div>
	
	<script type="text/javascript">
	function setCookie(c_name,value,exdays) {
		var exdate=new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
		document.cookie=c_name + "=" + c_value;
	}
	
	function getCookie(c_name) {
	    var i,x,y,ARRcookies=document.cookie.split(";");
			for (i = 0; i < ARRcookies.length; i++) {
				x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
				y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
				x = x.replace(/^\s+|\s+$/g, "");
				if (x == c_name) {
					return unescape(y);
				}
			}
		}
	
	var song = document.getElementById('audio');
	var played = false;
	var tillPlayed = getCookie('timePlayed');
	function update()
	{
	    if(!played){
	        if(tillPlayed){
	        song.currentTime = tillPlayed;
	        song.play();
	        played = true;
	        }
	        else {
	                song.play();
	                played = true;
	        }
	    }
	
	    else {
	    setCookie('timePlayed', song.currentTime);
	    }
	}
	
	setInterval(update,50);
</script>
</body>
