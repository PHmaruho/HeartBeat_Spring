package com.zero.heartbeat.model;

public class MusicTag {
	private int			music_tag_sq;
	private int			music_sq;
	private String		tag_cd;
	
	// 최우일 - 태그 의미
	private String tag_meaning;
	
	public String getTag_meaning() {
		return tag_meaning;
	}
	public void setTag_meaning(String tag_meaning) {
		this.tag_meaning = tag_meaning;
	}
	public int getMusic_tag_sq() {
		return music_tag_sq;
	}
	public void setMusic_tag_sq(int music_tag_sq) {
		this.music_tag_sq = music_tag_sq;
	}
	public int getMusic_sq() {
		return music_sq;
	}
	public void setMusic_sq(int music_sq) {
		this.music_sq = music_sq;
	}
	public String getTag_cd() {
		return tag_cd;
	}
	public void setTag_cd(String tag_cd) {
		this.tag_cd = tag_cd;
	}
}
