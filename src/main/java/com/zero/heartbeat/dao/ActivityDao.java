package com.zero.heartbeat.dao;

import java.util.List;

import com.zero.heartbeat.model.MusicLike;
import com.zero.heartbeat.model.SearchList;
import com.zero.heartbeat.model.Tag;
import com.zero.heartbeat.model.AllLikeList;
import com.zero.heartbeat.model.Code;
import com.zero.heartbeat.model.Member;

import java.util.HashMap;

import com.zero.heartbeat.model.Music;

public interface ActivityDao {

	// JAN
	int likeCount(int music_like_sq, int member_sq);
	void likeCancel(int music_like_sq);
	void insertLike(MusicLike like);
	List<MusicLike> likeList(int member_sq);
	List<AllLikeList> selectAllLikeList(String id);
	List<AllLikeList> selectUnLikeList(String id);
	void clickUnlikeMusic(int unLike);
	void clickUnlikeAlbum(int unLike);
	void clickLikeAlbum(int likeAlbum, int id);
	void clickLikeMusic(int likeMusic, int id);
	void unLikeCancel(int unLikeCancel, String music_like_type);
	List<Member> selectFollowing(int id);
	List<Member> selectFollower(int id);
	
	
	// PHmaruho
	public List<Code> selectAlbumType();
	public List<Tag> searchTag();
	
	
	HashMap<String, Object> selectMusicDetail(int sq);	// 최우일
	List<Member> selectMusicArtists(int sq);	// 최우일
	
	

}
