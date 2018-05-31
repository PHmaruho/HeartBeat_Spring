package com.zero.heartbeat.model;

public class Alarm {
	private int			alarm_sq;
	private int			member_sq;
	private int			target_sq;
	private String		alarm_type;
	private String		status;
	
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
}