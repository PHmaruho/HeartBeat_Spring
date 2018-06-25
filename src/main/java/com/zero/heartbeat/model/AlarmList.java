package com.zero.heartbeat.model;

public class AlarmList {

	private int		alarm_sq;
	private String	alarm_type;
	private String album_nm;
	private String music_like_type;
	private String music_nm;
	private String nick;
	private int reply_level;
	private int music_sq;
	private String member_sq;

	
	public String getMember_sq() {
		return member_sq;
	}
	public void setMember_sq(String member_sq) {
		this.member_sq = member_sq;
	}
	public int getMusic_sq() {
		return music_sq;
	}
	public void setMusic_sq(int music_sq) {
		this.music_sq = music_sq;
	}
	public int getAlarm_sq() {
		return alarm_sq;
	}
	public void setAlarm_sq(int alarm_sq) {
		this.alarm_sq = alarm_sq;
	}
	public String getAlarm_type() {
		return alarm_type;
	}
	public void setAlarm_type(String alarm_type) {
		this.alarm_type = alarm_type;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getReply_level() {
		return reply_level;
	}
	public void setReply_level(int reply_level) {
		this.reply_level = reply_level;
	}
	public String getAlbum_nm() {
		return album_nm;
	}
	public void setAlbum_nm(String album_nm) {
		this.album_nm = album_nm;
	}
	public String getMusic_nm() {
		return music_nm;
	}
	public void setMusic_nm(String music_nm) {
		this.music_nm = music_nm;
	}
	public String getMusic_like_type() {
		return music_like_type;
	}
	public void setMusic_like_type(String music_like_type) {
		this.music_like_type = music_like_type;
	}
	
	
	
}
