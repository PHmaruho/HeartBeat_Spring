package com.zero.heartbeat.model;

public class Music {
	private int			music_sq;
	private int			album_sq;
	private int			music_no;
	private String		music_nm;
	private int			play_time;
	private String		comment;
	private int			like;
	private int			share;
	private String		open_yn;
	
	public int getMusic_sq() {
		return music_sq;
	}
	public void setMusic_sq(int music_sq) {
		this.music_sq = music_sq;
	}
	public int getAlbum_sq() {
		return album_sq;
	}
	public void setAlbum_sq(int album_sq) {
		this.album_sq = album_sq;
	}
	public int getMusic_no() {
		return music_no;
	}
	public void setMusic_no(int music_no) {
		this.music_no = music_no;
	}
	public String getMusic_nm() {
		return music_nm;
	}
	public void setMusic_nm(String music_nm) {
		this.music_nm = music_nm;
	}
	public int getPlay_time() {
		return play_time;
	}
	public void setPlay_time(int play_time) {
		this.play_time = play_time;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public int getShare() {
		return share;
	}
	public void setShare(int share) {
		this.share = share;
	}
	public String getOpen_yn() {
		return open_yn;
	}
	public void setOpen_yn(String open_yn) {
		this.open_yn = open_yn;
	}
}
