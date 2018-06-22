package com.zero.heartbeat.dao;

import java.awt.print.Pageable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zero.heartbeat.model.MusicLike;
import com.zero.heartbeat.model.MusicTag;
import com.zero.heartbeat.model.Tag;
import com.zero.heartbeat.model.Album;
import com.zero.heartbeat.model.Artist;
import com.zero.heartbeat.model.SearchList;
import com.zero.heartbeat.model.Tag;
import com.zero.heartbeat.model.AllLikeList;
import com.zero.heartbeat.model.Code;
import com.zero.heartbeat.model.Follow;
import com.zero.heartbeat.model.Member;
import com.zero.heartbeat.model.Music;

@Repository
public class ActivityDaoImpl implements ActivityDao {
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// SqlSession
	@Autowired private SqlSession session;

	//JAN 1. 좋아요 동일한 시퀀스 레코드 확인
	@Override
	public int likeCount(int music_like_sq, int member_sq) {
		// TODO Auto-generated method stub
		Map<String , Object> map = new HashMap<String,Object>();
		map.put("music_like_sq", music_like_sq);
		map.put("member_sq", member_sq);
		return session.selectOne("activity.likeCount",map);
	}

	//JANunlike 메소드
	@Override
	public void likeCancel(int music_like_sq) {
		// TODO Auto-generated method stub
		session.delete("activity.likeCancel",music_like_sq);
	}
	
	//JAN like 추가
	@Override
	public void insertLike(MusicLike like) {
		// TODO Auto-generated method stub
		session.insert("activity.insertLike",like);
		
	}
	
	//JAN
	@Override
	public List<MusicLike> likeList(int member_sq) {
		// TODO Auto-generated method stub
		return session.selectList("activity.likeList",member_sq);
	}
	
	//JAN
	@Override
	public List<AllLikeList> selectAllLikeList(int id) {
		// TODO Auto-generated method stub
		
		return session.selectList("selectAllLikeList",id);
	}
	//JAN
	@Override
	public void clickUnlikeMusic(int unLike) {
		// TODO Auto-generated method stub
		session.update("clickUnlikeMusic",unLike);
	}
	//JAN
	@Override
	public void clickUnlikeAlbum(int unLike) {
		// TODO Auto-generated method stub
		session.update("clickUnlikeAlbum",unLike);
	}
	
	//JAN
	@Override
	public List<AllLikeList> selectUnLikeList(int id) {
		// TODO Auto-generated method stub
		
		return session.selectList("selectUnLikeList",id);
	}
	//JAN
	@Override
	public void clickLikeAlbum(int likeAlbum, int id) {
		// TODO Auto-generated method stub
		Map<String , Object> map = new HashMap<String,Object>();
		map.put("likeAlbum", likeAlbum);
		map.put("id", id);
		session.insert("clickLikeAlbum",map);
	}
	//JAN
	@Override
	public void clickLikeMusic(int likeMusic, int id) {
		// TODO Auto-generated method stub
		Map<String , Object> map = new HashMap<String,Object>();
		map.put("likeMusic", likeMusic);
		map.put("id", id);
		session.insert("clickLikeMusic",map);
	}
	
	//JAN
	@Override
	public void unLikeCancel(int unLikeCancel, String music_like_type) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("unLikeCancel", unLikeCancel);
		map.put("music_like_type", music_like_type);
		logger.info("unLike:"+map.get("unLikeCancel"));
		session.update("unLikeCancel",map);
	}
	
	//JAN
	@Override
	public List<Member> selectFollowing(int id) {
		// TODO Auto-generated method stub
		return session.selectList("selectFollowing",id);
	}
	//JAN
	@Override
	public List<Member> selectFollower(int id) {
		// TODO Auto-generated method stub
		return session.selectList("selectFollower",id);
	}
	
	//JAN
	@Override
	public void follow(int mbsq, int ss) {
		// TODO Auto-generated method stub
		Follow following = new Follow();
		
		following.setTarget_sq(mbsq);
		following.setMember_sq(ss);
		
		session.insert("follow",following);
	}
	
	//JAN
	@Override
	public void unfollow(int memberSq, int targetSq) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("member_sq",memberSq);
		map.put("target_sq", targetSq);
		
		session.delete("unfollow",map);
	}

	
	
	//JAN
	@Override
	public int followCheck(int mbsq, int ss) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("target_sq", mbsq);
		map.put("me", ss);
		
		return session.selectOne("followCheck",map);
	}

	
	
	// PHmaruho
	@Override
	public List<Code> selectAlbumType() {
		// TODO Auto-generated method stub
		return session.selectList("selectAlbumType");
	}
	@Override
	public int uploadAlbumPro_album(Album albumDto) {
		// TODO Auto-generated method stub
		return session.insert("insertAlbum", albumDto);
	}
	
	@Override
	public int selectAlbumSeq(int member_sq) {
		// TODO Auto-generated method stub
		return session.selectOne("selectAlbumSeq", member_sq);
	}
	
	@Override
	public Boolean uploadMusicPro(Music musicDto) {
		// TODO Auto-generated method stub
		int result = session.insert("insertAlbumMusic", musicDto);
		
		if(result != 1) {
			return false;
		}
		return true;
	}
	
	@Override
	public List<Integer> selectMusicSeq(int album_sq) {
		// TODO Auto-generated method stub
		return session.selectList("selectAlbumMusicSeq", album_sq);
	}
	
	@Override
	public Boolean insertArtistList(Artist artistDto) {
		// TODO Auto-generated method stub
		int result = session.insert("insertArtistList", artistDto);
		
		if(result != 1) {
			return false;
		}
		
		return true;
	}
	
	@Override
	public Boolean insertMusicTagList(MusicTag musicTagDto) {
		// TODO Auto-generated method stub
		int result = session.insert("insertMusicTagList", musicTagDto);
		
		if(result != 1) {
			return false;
		}
		
		return true;
	}
	
	@Override
	public void updateAlbumTitleMusic(int music_sq, int img_seq) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("music_sq", music_sq);
		map.put("album_sq", img_seq);
		session.update("updateAlbumTitleMusic", map);
	}
	
	@Override
	public int selectOneMusicSeq(int album_sq) {
		// TODO Auto-generated method stub
		return session.selectOne("selectAlbumMusicSeq", album_sq);
	}
	
	// JSY
	@Override
	public List<Tag> searchTag() {
		// TODO Auto-generated method stub
		return session.selectList("selectMusicTag");
	}
	
	// 최우일
	@Override
	public Music selectMusicDetail(int sq) {
		return session.selectOne("selectMusicDetail", sq);
	}

	// 최우일
	@Override
	public List<Member> selectMusicArtists(int sq) {
		return session.selectList("selectMusicArtists", sq);
	}

	// 최우일
	@Override
	public Map<Integer, HashMap<String, Object>> selectReplyAtMusic(int sq) {
		return session.selectMap("selectReplyAtMusic", sq, "time_stamp");
	}

	// 최우일
	@Override
	public List<Music> selectMusicByArtist(int sq) {
		return session.selectList("selectMusicByArtist", sq);
	}

	// 최우일
	@Override
	public Member selectMemberArtist(int sq) {
		return session.selectOne("selectMemberArtistCwi", sq);
	}
}
