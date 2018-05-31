package com.zero.heartbeat.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zero.heartbeat.model.SearchKeyword;
import com.zero.heartbeat.model.SearchList;

@Repository
public class ExploreDaoImpl implements ExploreDao {
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// SqlSession
	@Autowired private SqlSession session;

	// JSY
	public ArrayList<SearchList> selectAllSearchList(SearchKeyword dto) {
		return session.select
	}
}
