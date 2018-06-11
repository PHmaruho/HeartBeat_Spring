package com.zero.heartbeat.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zero.heartbeat.model.Member;
import com.zero.heartbeat.model.Music;
import com.zero.heartbeat.model.SearchKeyword;
import com.zero.heartbeat.model.SearchList;
import com.zero.heartbeat.model.Tag;

@Repository
public class ExploreDaoImpl implements ExploreDao {
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// SqlSession
	@Autowired private SqlSession session;

	// JSY
	public List<SearchList> selectAllSearchList(SearchKeyword dto) {
		logger.info("ExploreDaoImpl selectAllSearchList working");
		return session.selectList("selectAllSearchList",dto);
	}
	public List<Tag> getKeywordTag(String searchWord) {
		logger.info("ExploreDaoImpl getKeywordTag working");
		logger.info("ExploreDaoImpl keyword Tag: "+searchWord);
		return session.selectList("getKeywordTag",searchWord);
	}
	public List<Member> getKeywordArtist(String searchWord) {
		logger.info("ExploreDaoImpl getKeywordArtist working");
		return session.selectList("getKeywordArtist",searchWord);
	}
	public List<Music> getKeywordTitle(String searchWord) {
		logger.info("ExploreDaoImpl getKeywordTitle working");
		return session.selectList("getKeywordTitle",searchWord);
	}
}
