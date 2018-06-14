package com.zero.heartbeat.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zero.heartbeat.model.MusicLike;
import com.zero.heartbeat.model.SearchList;
import com.zero.heartbeat.model.Tag;
import com.zero.heartbeat.model.AllLikeList;
import com.zero.heartbeat.model.Code;
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
	public List<AllLikeList> selectAllLikeList(String id) {
		// TODO Auto-generated method stub
		logger.info("selectAllLikeList DaoImpl ");
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
	public List<AllLikeList> selectUnLikeList(String id) {
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

	
	
	// PHmaruho
	@Override
	public List<Code> selectAlbumType() {
		// TODO Auto-generated method stub
		return session.selectList("selectAlbumType");
	}
	
	// JSY
	@Override
	public List<Tag> searchTag() {
		// TODO Auto-generated method stub
		return session.selectList("selectMusicTag");
	}
	
	// 최우일
	@Override
	public HashMap<String, Object> selectMusicDetail(int sq) {
		return session.selectOne("selectMusicDetail", sq);
	}

	// 최우일
	@Override
	public List<Member> selectMusicArtists(int sq) {
		return session.selectList("selectMusicArtists", sq);
	}

	
	



	

	
}
