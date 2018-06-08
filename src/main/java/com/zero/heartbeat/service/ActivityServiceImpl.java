package com.zero.heartbeat.service;

import java.util.List;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.heartbeat.dao.ActivityDao;
import com.zero.heartbeat.dao.CommonDao;
import com.zero.heartbeat.dao.ExploreDao;
import com.zero.heartbeat.dao.MemberDao;
import com.zero.heartbeat.model.MusicLike;
import com.zero.heartbeat.model.Code;
import com.zero.heartbeat.model.Music;

@Service
public class ActivityServiceImpl implements ActivityService {
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	// Autowired
	@Autowired private ActivityDao activityDao;
	@Autowired private CommonDao commonDao;
	@Autowired private ExploreDao exploreDao;
	@Autowired private MemberDao memberDao;
	
	
	//JAN
	@Override
	public int likeCount(int music_like_sq, int member_sq) {
		// TODO Auto-generated method stub
		return activityDao.likeCount(music_like_sq,member_sq);
	}

	
	//JAN 이미 좋아요 목록에 있는 시퀀스의 캔슬메소드
	@Override
	public void likeCancel(int music_like_sq) {
		// TODO Auto-generated method stub
		activityDao.likeCancel(music_like_sq);
	}

	//JAN
	@Override
	public void insertLike(MusicLike like) {
		// TODO Auto-generated method stub
		activityDao.insertLike(like);
	}

	//JAN
	@Override
	public List<MusicLike> likeList(int member_sq) {
		// TODO Auto-generated method stub
		return activityDao.likeList(member_sq);
	}
	
	// PHmaruho
	@Override
	public List<Code> selectAlbumType() {
		// TODO Auto-generated method stub
		return activityDao.selectAlbumType();
	}
	
	// 최우일
	@Override
	public HashMap<String, Object> selectMusicDetail(int sq) {
		return activityDao.selectMusicDetail(sq);
	}
}
