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
import com.zero.heartbeat.model.Tag;
import com.zero.heartbeat.model.Code;
import com.zero.heartbeat.model.Member;
import com.zero.heartbeat.model.Music;

@Repository
public class ActivityDaoImpl implements ActivityDao {
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// SqlSession
	@Autowired private SqlSession session;

	// 1. 좋아요 동일한 시퀀스 레코드 확인
	@Override
	public int likeCount(int music_like_sq, int member_sq) {
		// TODO Auto-generated method stub
		Map<String , Object> map = new HashMap<String,Object>();
		map.put("music_like_sq", music_like_sq);
		map.put("member_sq", member_sq);
		return session.selectOne("activity.likeCount",map);
	}

	//unlike 메소드
	@Override
	public void likeCancel(int music_like_sq) {
		// TODO Auto-generated method stub
		session.delete("activity.likeCancel",music_like_sq);
	}
	
	//like 추가
	@Override
	public void insertLike(MusicLike like) {
		// TODO Auto-generated method stub
		session.insert("activity.insertLike",like);
		
	}

	@Override
	public List<MusicLike> likeList(int member_sq) {
		// TODO Auto-generated method stub
		return session.selectList("activity.likeList",member_sq);
	}

	// PHmaruho
	@Override
	public List<Code> selectAlbumType() {
		// TODO Auto-generated method stub
		return session.selectList("selectAlbumType");
	}
	
	@Override
	public List<Tag> searchTag() {
		// TODO Auto-generated method stub
		return session.selectList("selectMusicTag");
	}
	
	// 최우일
	@Override
	public HashMap<String, Object> selectMusicDetail(int sq) {	// 최우일
		return session.selectOne("selectMusicDetail", sq);
	}

	@Override
	public List<Member> selectMusicArtists(int sq) {	// 최우일
		return session.selectList("selectMusicArtists", sq);
	}
}
