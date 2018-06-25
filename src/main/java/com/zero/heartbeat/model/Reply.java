package com.zero.heartbeat.model;

import java.util.Date;

public class Reply {
	private int			reply_sq;
	private int			music_sq;
	private int			member_sq;
	private int			time_stamp;
	private String		reply_comment;
	private int			reply_order;
	private int			reply_level;
	private int			reply_group;
	private Date		write_dt;
	private String		reply_parent;
	
	// PHmaruho
	// reply 기능 때문에 추가
	private String reply_sq_str;
	private String nick;
	private String email;
	
	public int getReply_sq() {
		return reply_sq;
	}
	public void setReply_sq(int reply_sq) {
		this.reply_sq = reply_sq;
	}
	public int getMusic_sq() {
		return music_sq;
	}
	public void setMusic_sq(int music_sq) {
		this.music_sq = music_sq;
	}
	public int getMember_sq() {
		return member_sq;
	}
	public void setMember_sq(int member_sq) {
		this.member_sq = member_sq;
	}
	public int getTime_stamp() {
		return time_stamp;
	}
	public void setTime_stamp(int time_stamp) {
		this.time_stamp = time_stamp;
	}
	public String getReply_comment() {
		return reply_comment;
	}
	public void setReply_comment(String reply_comment) {
		this.reply_comment = reply_comment;
	}
	public int getReply_order() {
		return reply_order;
	}
	public void setReply_order(int reply_order) {
		this.reply_order = reply_order;
	}
	public int getReply_level() {
		return reply_level;
	}
	public void setReply_level(int reply_level) {
		this.reply_level = reply_level;
	}
	public int getReply_group() {
		return reply_group;
	}
	public void setReply_group(int reply_group) {
		this.reply_group = reply_group;
	}
	public Date getWrite_dt() {
		return write_dt;
	}
	public void setWrite_dt(Date write_dt) {
		this.write_dt = write_dt;
	}
	public String getReply_parent() {
		return reply_parent;
	}
	public void setReply_parent(String reply_parent) {
		this.reply_parent = reply_parent;
	}
	public String getReply_sq_str() {
		return reply_sq_str;
	}
	public void setReply_sq_str(String reply_sq_str) {
		this.reply_sq_str = reply_sq_str;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
