package com.zero.heartbeat.dao;

import java.util.ArrayList;
import java.util.List;

import com.zero.heartbeat.model.SearchKeyword;
import com.zero.heartbeat.model.SearchList;
import com.zero.heartbeat.model.Tag;

public interface ExploreDao {

	// JSY
	List<SearchList> selectAllSearchList(SearchKeyword dto);
	List<String> getKeywordTag(String searchWord);

}
