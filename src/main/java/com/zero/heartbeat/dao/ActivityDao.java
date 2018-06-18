package com.zero.heartbeat.dao;

import java.util.List;
import java.util.Map;

import com.zero.heartbeat.model.MusicLike;
import com.zero.heartbeat.model.Tag;
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

	// PHmaruho
	public List<Code> selectAlbumType();
	public List<Tag> searchTag();
	
	
	Music selectMusicDetail(int sq);	// 최우일
	List<Member> selectMusicArtists(int sq);	// 최우일
	Map<Integer, HashMap<String, Object>> selectReplyAtMusic(int sq);	// 최우일
	List<Music> selectMusicByArtist(int sq);	// 최우일
	Member selectMemberArtist(int sq);	// 최우일

}
