package com.zero.heartbeat.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.heartbeat.dao.ActivityDao;
import com.zero.heartbeat.dao.CommonDao;
import com.zero.heartbeat.dao.ExploreDao;
import com.zero.heartbeat.dao.MemberDao;
import com.zero.heartbeat.model.SearchKeyword;
import com.zero.heartbeat.model.SearchList;

@Service
public class ExploreServiceImpl implements ExploreService {
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// Autowired
	@Autowired private ActivityDao activityDao;
	@Autowired private CommonDao commonDao;
	@Autowired private ExploreDao exploreDao;
	@Autowired private MemberDao memberDao;
	
	// JSY
	public ArrayList<SearchList> selectAllSearchList(SearchKeyword dto) {
		ArrayList<SearchList> list= exploreDao.selectAllSearchList(dto);
		return list;
	}
}
