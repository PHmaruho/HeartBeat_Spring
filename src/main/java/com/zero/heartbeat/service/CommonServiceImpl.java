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
	public List<MainList> selectAlbumMainList(int startNum) {
		List<MainList> list= new ArrayList<MainList>();
		list= commonDao.selectAlbumMainList(startNum);
		logger.info("CommonServiceImpl selectAlbumMainList working");
		return list;
	}

	@Override
	public List<Album> selectAlbumArriveList(Album album) {
		// TODO Auto-generated method stub
		return commonDao.selectAlbumArriveList(album);
	}

	//JAN 메인 컨텐츠 목록
	@Override
	public List<MainList> mainList(int startNum) {
		List<MainList> list= new ArrayList<MainList>();
		list= commonDao.mainList(startNum);
		logger.info("CommonServiceImpl mainList before");
		return list;
	}
}
