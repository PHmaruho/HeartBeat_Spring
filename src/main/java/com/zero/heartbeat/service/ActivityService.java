package com.zero.heartbeat.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zero.heartbeat.model.MusicLike;
import com.zero.heartbeat.model.SearchList;
import com.zero.heartbeat.model.Tag;
import com.zero.heartbeat.model.AllLikeList;
import com.zero.heartbeat.model.Code;
import com.zero.heartbeat.model.Member;
import com.zero.heartbeat.model.Music;

public interface ActivityService {

	//JAN
	int likeCount(int music_like_sq, int member_sq);
	void likeCancel(int music_like_sq);
	void insertLike(MusicLike like);
	List<MusicLike> likeList(int member_sq);
	List<AllLikeList> selectAllLikeList(int id);
	List<AllLikeList> selectUnLikeList(int id);
	void clickUnlikeMusic(int unLike);
	void clickUnlikeAlbum(int unLike);
	void clickLikeAlbum(int likeAlbum, int id);
	void clickLikeMusic(int likeMusic, int id);
	void unLikeCancel(int unLikeCancel, String music_like_type);
	List<Member> selectFollowing(int id);
	List<Member> selectFollower(int id);
	void follow(int mbsq, int ss);
	int followCheck(int mbsq, int ss);
	void unfollow(int memberSq, int targetSq);
	
	

	// PHmaruho
	public List<Code> selectAlbumType();
	public List<Tag> searchTag();
	public void uploadAlbumPro(MultipartHttpServletRequest mhsr, HttpServletRequest request);
	
	HashMap<String, Object> selectMusicDetail(int sq); // 최우일
	List<Member> selectMusicArtists(int sq); // 최우일
	
}
