package com.zero.heartbeat.model;

public class Alram {
	private int			alram_sq;
	private int			user_sq;
	private int			target_user_sq;
	private String		alram_kind;
	private String		status;
	
	public int getAlram_sq() {
		return alram_sq;
	}
	public void setAlram_sq(int alram_sq) {
		this.alram_sq = alram_sq;
	}
	public int getUser_sq() {
		return user_sq;
	}
	public void setUser_sq(int user_sq) {
		this.user_sq = user_sq;
	}
	public int getTarget_user_sq() {
		return target_user_sq;
	}
	public void setTarget_user_sq(int target_user_sq) {
		this.target_user_sq = target_user_sq;
	}
	public String getAlram_kind() {
		return alram_kind;
	}
	public void setAlram_kind(String alram_kind) {
		this.alram_kind = alram_kind;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
