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

import com.zero.heartbeat.model.SearchKeyword;
import com.zero.heartbeat.model.SearchList;

@Repository
public class ExploreDaoImpl implements ExploreDao {
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// SqlSession
	@Autowired private SqlSession session;

	// JSY
	public List<SearchList> selectAllSearchList(SearchKeyword dto) {
		logger.info("ExploreDaoImpl selectAllSearchList working");
	//	  Map<String, Object> param = new HashMap<String, Object>();
	//	  param.put("id", "1"); //#{id}에 셋팅
	//	  param.put("name", "victor"); //#{name}에 셋팅
	//	  List<String> arrTag = new ArrayList<String>();
	//	  arrTag.add("@nick5"); //in 조건에 넣을 정보
	//	  param.put("code_list", arrTag); //map에 list를 넣는다.
		  
		return session.selectList("selectAllSearchList",dto);
	}
}
