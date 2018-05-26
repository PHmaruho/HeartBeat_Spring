package com.zero.heartbeat.model;

public class Like {
	private int			like_sq;
	private int			target_sq;
	private int			user_sq;
	private String		like_type;
	
	public int getLike_sq() {
		return like_sq;
	}
	public void setLike_sq(int like_sq) {
		this.like_sq = like_sq;
	}
	public int getTarget_sq() {
		return target_sq;
	}
	public void setTarget_sq(int target_sq) {
		this.target_sq = target_sq;
	}
	public int getUser_sq() {
		return user_sq;
	}
	public void setUser_sq(int user_sq) {
		this.user_sq = user_sq;
	}
	public String getLike_type() {
		return like_type;
	}
	public void setLike_type(String like_type) {
		this.like_type = like_type;
	}
}
