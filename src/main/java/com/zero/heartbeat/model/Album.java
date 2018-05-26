package com.zero.heartbeat.model;

import java.util.Date;

public class Album {
	private int 		album_sq;
	private String 		album_nm;
	private int 		music_sq;
	private int 		user_sq;
	private String		comment;
	private Date		release_dt;
	private String		img_path;
	private String		open_yn;
	private String		album_type;
	
	public int getAlbum_sq() {
		return album_sq;
	}
	public void setAlbum_sq(int album_sq) {
		this.album_sq = album_sq;
	}
	public String getAlbum_nm() {
		return album_nm;
	}
	public void setAlbum_nm(String album_nm) {
		this.album_nm = album_nm;
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
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getRelease_dt() {
		return release_dt;
	}
	public void setRelease_dt(Date release_dt) {
		this.release_dt = release_dt;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public String getOpen_yn() {
		return open_yn;
	}
	public void setOpen_yn(String open_yn) {
		this.open_yn = open_yn;
	}
	public String getAlbum_type() {
		return album_type;
	}
	public void setAlbum_type(String album_type) {
		this.album_type = album_type;
	}
}
