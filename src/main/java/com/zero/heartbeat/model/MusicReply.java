package com.zero.heartbeat.model;

public class MusicReply {
	private int			music_reply_sq;
	private int			music_sq;
	private int			user_sq;
	private int			time_stamp;
	private String		comment;
	private int			order;
	private int			level;
	private int			group;
	
	public int getMusic_reply_sq() {
		return music_reply_sq;
	}
	public void setMusic_reply_sq(int music_reply_sq) {
		this.music_reply_sq = music_reply_sq;
	}
	public int getMusic_sq() {
		return music_sq;
	}
	public void setMusic_sq(int music_sq) {
		this.music_sq = music_sq;
	}
	public int getUser_sq() {
		return user_sq;
	}
	public void setUser_sq(int user_sq) {
		this.user_sq = user_sq;
	}
	public int getTime_stamp() {
		return time_stamp;
	}
	public void setTime_stamp(int time_stamp) {
		this.time_stamp = time_stamp;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getGroup() {
		return group;
	}
	public void setGroup(int group) {
		this.group = group;
	}
}
