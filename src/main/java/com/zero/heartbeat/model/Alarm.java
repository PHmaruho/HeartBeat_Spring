package com.zero.heartbeat.model;

public class Alram {
	private int			alram_sq;
	private int			member_sq;
	private int			target_sq;
	private String		alram_type;
	private String		status;
	
	public int getAlram_sq() {
		return alram_sq;
	}
	public void setAlram_sq(int alram_sq) {
		this.alram_sq = alram_sq;
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
	public String getAlram_type() {
		return alram_type;
	}
	public void setAlram_type(String alram_type) {
		this.alram_type = alram_type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
