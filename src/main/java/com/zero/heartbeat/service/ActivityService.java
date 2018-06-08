package com.zero.heartbeat.service;

import java.util.HashMap;
import java.util.List;

import com.zero.heartbeat.model.MusicLike;
import com.zero.heartbeat.model.Code;
import com.zero.heartbeat.model.Member;
import com.zero.heartbeat.model.Music;

public interface ActivityService {

	int likeCount(int music_like_sq, int member_sq);
	void likeCancel(int music_like_sq);
	void insertLike(MusicLike like);
	List<MusicLike> likeList(int member_sq);

	// PHmaruho
	public List<Code> selectAlbumType();
	
	HashMap<String, Object> selectMusicDetail(int sq); // 최우일
	List<Member> selectMusicArtists(int sq); // 최우일
}
