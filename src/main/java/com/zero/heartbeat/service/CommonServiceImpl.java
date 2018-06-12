package com.zero.heartbeat.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.heartbeat.dao.ActivityDao;
import com.zero.heartbeat.dao.CommonDao;
import com.zero.heartbeat.dao.ExploreDao;
import com.zero.heartbeat.dao.MemberDao;
import com.zero.heartbeat.model.Album;
import com.zero.heartbeat.model.MainList;
import com.zero.heartbeat.model.Member;
import com.zero.heartbeat.model.Music;
import com.zero.heartbeat.model.SearchList;

@Service
public class CommonServiceImpl implements CommonService {
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// Autowired
	@Autowired private ActivityDao activityDao;
	@Autowired private CommonDao commonDao;
	@Autowired private ExploreDao exploreDao;
	@Autowired private MemberDao memberDao;
	
	
	// JSY
	public List<MainList> selectAlbumMainListLike(int startNum) {
		List<MainList> list= new ArrayList<MainList>();
		list= commonDao.selectAlbumMainListLike(startNum);
		logger.info("CommonServiceImpl selectAlbumMainList working");
		return list;
	}
	public List<MainList> selectAlbumMainListNew(int startNum) {
		List<MainList> list= new ArrayList<MainList>();
		list= commonDao.selectAlbumMainListNew(startNum);
		logger.info("CommonServiceImpl selectAlbumMainListNew working");
		return list;
	}

	// JAN
	@Override
	public List<MainList> selectAlbumArriveList(int startNum) {
		// TODO Auto-generated method stub
		List<MainList> list= new ArrayList<MainList>();
		list= commonDao.selectAlbumArriveList(startNum);
		return list;
	}

	//JAN 메인 컨텐츠 목록
	@Override
	public List<MainList> mainListLike(int startNum) {
		List<MainList> list= new ArrayList<MainList>();
		list= commonDao.mainListLike(startNum);
		logger.info("CommonServiceImpl mainList before");
		return list;
	}
	//JAN
	public List<MainList> mainListNew(int startNum) {
		List<MainList> list = new ArrayList<MainList>();
		list= commonDao.mainListNew(startNum);
		return list;
	}

	// 최우일
	@Override
	public List<Music> selectPlaylistFoot(int sessionSq) {
		return commonDao.selectPlaylistFoot(sessionSq);
	}
	
}
