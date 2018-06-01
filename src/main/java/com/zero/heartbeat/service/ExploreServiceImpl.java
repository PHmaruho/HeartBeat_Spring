package com.zero.heartbeat.service;

import java.util.ArrayList;
import java.util.List;

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
import com.zero.heartbeat.model.Tag;

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
	public List<SearchList> selectAllSearchList(SearchKeyword dto) {
		List<SearchList> list= exploreDao.selectAllSearchList(dto);
		logger.info("ExploreServiceImpl selectAllSearchList working");
		return list;
	}
	public List<String> getKeywordTag(String searchWord) {
		List<String> tag=exploreDao.getKeywordTag(searchWord);
		logger.info("ExploreServiceImpl getKeywordTag working");
		return tag;
	}
}
