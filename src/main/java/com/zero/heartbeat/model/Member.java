package com.zero.heartbeat.model;

import java.util.Date;

public class Member {
	private int			member_sq;
	private String		email;
	private String		pw;
	private	String		nick;
	private String		status;
	private Date		pw_dt;
	private Date		reg_dt;
	
	public int getMember_sq() {
		return member_sq;
	}
	public void setMember_sq(int member_sq) {
		this.member_sq = member_sq;
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
	public Date getPw_dt() {
		return pw_dt;
	}
	public void setPw_dt(Date pw_dt) {
		this.pw_dt = pw_dt;
	}
	public Date getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}
}
