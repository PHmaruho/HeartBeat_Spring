package com.zero.heartbeat.model;

import java.util.Date;

public class User {
	private int			user_sq;
	private String		email;
	private String		pw;
	private	String		nick;
	private String		status;
	private Date		pw_date;
	private Date		reg_date;
	
	public int getUser_sq() {
		return user_sq;
	}
	public void setUser_sq(int user_sq) {
		this.user_sq = user_sq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getPw_date() {
		return pw_date;
	}
	public void setPw_date(Date pw_date) {
		this.pw_date = pw_date;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
}
