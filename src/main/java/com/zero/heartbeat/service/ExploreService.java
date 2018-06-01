package com.zero.heartbeat.service;

import java.util.ArrayList;

import java.util.List;

import com.zero.heartbeat.model.SearchKeyword;
import com.zero.heartbeat.model.SearchList;
import com.zero.heartbeat.model.Tag;

public interface ExploreService {

	// JSY
	List<SearchList> selectAllSearchList(SearchKeyword dto);
	List<String> getKeywordTag(String searchWord);

}
