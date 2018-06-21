package com.zero.heartbeat.dao;

import java.util.List;

import com.zero.heartbeat.model.MusicLike;
import com.zero.heartbeat.model.MusicTag;
import com.zero.heartbeat.model.Tag;

import scala.collection.generic.BitOperations.Int;

import com.zero.heartbeat.model.Album;
import com.zero.heartbeat.model.Artist;
import com.zero.heartbeat.model.Code;
import com.zero.heartbeat.model.Member;

import java.util.ArrayList;
import java.util.HashMap;

import com.zero.heartbeat.model.Music;

public interface ActivityDao {

	// JAN
	int likeCount(int music_like_sq, int member_sq);
	void likeCancel(int music_like_sq);
	void insertLike(MusicLike like);
	List<MusicLike> likeList(int member_sq);

	// PHmaruho
	public List<Code> selectAlbumType();
	public List<Tag> searchTag();
	public int uploadAlbumPro_album(Album albumDto);
	public int selectAlbumSeq(int member_sq);
	public Boolean uploadMusicPro(Music musicDto);
	public List<Integer> selectMusicSeq(int album_sq);
	public Boolean insertArtistList(Artist artistDto);
	public Boolean insertMusicTagList(MusicTag musicTagDto);
	public void updateAlbumTitleMusic(int music_sq);
	public int selectOneMusicSeq(int album_sq);
	
	
	HashMap<String, Object> selectMusicDetail(int sq);	// 최우일
	List<Member> selectMusicArtists(int sq);	// 최우일

}
