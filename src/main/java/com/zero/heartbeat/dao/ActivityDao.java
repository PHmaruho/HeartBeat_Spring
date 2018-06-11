package com.zero.heartbeat.dao;

import java.util.List;

import com.zero.heartbeat.model.MusicLike;
import com.zero.heartbeat.model.Tag;
import com.zero.heartbeat.model.Code;
import java.util.HashMap;

import com.zero.heartbeat.model.Music;

public interface ActivityDao {

	int likeCount(int music_like_sq, int member_sq);
	void likeCancel(int music_like_sq);
	void insertLike(MusicLike like);
	List<MusicLike> likeList(int member_sq);

	// PHmaruho
	public List<Code> selectAlbumType();
	public List<Tag> searchTag();
	
	// 최우일
	HashMap<String, Object> selectMusicDetail(int sq);

}
