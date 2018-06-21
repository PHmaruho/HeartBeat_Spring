package com.zero.heartbeat.model;

import java.util.List;

public class Music {
	private int			music_sq;
	private int			album_sq;
	private int			music_no;
	private String		music_nm;
	private int			play_time;
	private String		url;
	private String		music_comment;
	private int			music_like;
	private int			music_share;
	private String		open_yn;
	
	// 최우일 - 한 곡에 대한 여러 작업자들
	private List<Member>	artistList;
	private int			list_sq;
	private int			list_no;
	// 최우일 - 한 곡에 여러 태그들
	private List<MusicTag>	tagList;
	
	public List<MusicTag> getTagList() {
		return tagList;
	}
	public void setTagList(List<MusicTag> tagList) {
		this.tagList = tagList;
	}
	
	public int getList_sq() {
		return list_sq;
	}
	public void setList_sq(int list_sq) {
		this.list_sq = list_sq;
	}
	public int getList_no() {
		return list_no;
	}
	public void setList_no(int list_no) {
		this.list_no = list_no;
	}
	public List<Member> getArtistList() {
		return artistList;
	}
	public void setArtistList(List<Member> artistList) {
		this.artistList = artistList;
	}
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getMusic_comment() {
		return music_comment;
	}
	public void setMusic_comment(String music_comment) {
		this.music_comment = music_comment;
	}
	public int getMusic_like() {
		return music_like;
	}
	public void setMusic_like(int music_like) {
		this.music_like = music_like;
	}
	public int getMusic_share() {
		return music_share;
	}
	public void setMusic_share(int music_share) {
		this.music_share = music_share;
	}
	public String getOpen_yn() {
		return open_yn;
	}
	public void setOpen_yn(String open_yn) {
		this.open_yn = open_yn;
	}
}
