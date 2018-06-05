package com.zero.heartbeat.model;

public class AlarmList {

	private int			alarm_sq;
	private int			member_sq;
	private int			target_sq;
	private String		alarm_type;
	private String		status;
	
	private String nick;
	private String music_like_type;
	private String music_nm;
	private String album_nm;
	
	public int getAlarm_sq() {
		return alarm_sq;
	}
	public void setAlarm_sq(int alarm_sq) {
		this.alarm_sq = alarm_sq;
	}
	public int getMember_sq() {
		return member_sq;
	}
	public void setMember_sq(int member_sq) {
		this.member_sq = member_sq;
	}
	public int getTarget_sq() {
		return target_sq;
	}
	public void setTarget_sq(int target_sq) {
		this.target_sq = target_sq;
	}
	public String getAlarm_type() {
		return alarm_type;
	}
	public void setAlarm_type(String alarm_type) {
		this.alarm_type = alarm_type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getMusic_like_type() {
		return music_like_type;
	}
	public void setMusic_like_type(String music_like_type) {
		this.music_like_type = music_like_type;
	}
	public String getMusic_nm() {
		return music_nm;
	}
	public void setMusic_nm(String music_nm) {
		this.music_nm = music_nm;
	}
	public String getAlbum_nm() {
		return album_nm;
	}
	public void setAlbum_nm(String album_nm) {
		this.album_nm = album_nm;
	}
	
	
}
