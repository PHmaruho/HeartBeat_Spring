package com.zero.heartbeat.dao;

import java.util.List;
import java.util.Map;

import com.zero.heartbeat.model.MusicLike;
import com.zero.heartbeat.model.MusicTag;
import com.zero.heartbeat.model.Reply;
import com.zero.heartbeat.model.Tag;

import scala.collection.generic.BitOperations.Int;

import com.zero.heartbeat.model.Album;
import com.zero.heartbeat.model.Artist;
import com.zero.heartbeat.model.SearchList;
import com.zero.heartbeat.model.Tag;
import com.zero.heartbeat.model.AllLikeList;
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
	public int uploadAlbumPro_album(Album albumDto);
	public int selectAlbumSeq(int member_sq);
	public Boolean uploadMusicPro(Music musicDto);
	public List<Integer> selectMusicSeq(int album_sq);
	public Boolean insertArtistList(Artist artistDto);
	public Boolean insertMusicTagList(MusicTag musicTagDto);
	public void updateAlbumTitleMusic(int music_sq, int img_seq);
	public int selectOneMusicSeq(int album_sq);
	public Map<String, Object> selectReplyOrders(String reply_sq_str);
	public Map<String, Object> selectReplyOrders1(String reply_sq_str);
	public int insertReplyMusic(Reply replyDto);
	public int insertReplyMusic1(Reply replyDto);
	public Reply selectLastReply(int member_sq);
	public int updateReplyGroup(Reply replyDto);
	public int selectTotalReply(int music_sq);
	public List<Reply> selectReplyList(Map<String, Object> map);
	
	
	Music selectMusicDetail(int sq);	// 최우일
	List<Member> selectMusicArtists(int sq);	// 최우일
	Map<Integer, HashMap<String, Object>> selectReplyAtMusic(int sq);	// 최우일
	List<Music> selectMusicByArtist(int sq);	// 최우일
	Member selectMemberArtist(int sq);	// 최우일

}
