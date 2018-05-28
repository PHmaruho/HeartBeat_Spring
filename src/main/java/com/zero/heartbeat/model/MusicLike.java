package com.zero.heartbeat.model;

public class MusicLike {
	private int			music_like_sq;
	private int			target_sq;
	private int			member_sq;
	private String		music_like_type;
	
	public int getMusic_like_sq() {
		return music_like_sq;
	}
	public void setMusic_like_sq(int music_like_sq) {
		this.music_like_sq = music_like_sq;
	}
	public int getTarget_sq() {
		return target_sq;
	}
	public void setTarget_sq(int target_sq) {
		this.target_sq = target_sq;
	}
	public int getMember_sq() {
		return member_sq;
	}
	public void setMember_sq(int member_sq) {
		this.member_sq = member_sq;
	}
	public String getMusic_like_type() {
		return music_like_type;
	}
	public void setMusic_like_type(String music_like_type) {
		this.music_like_type = music_like_type;
	}
}
