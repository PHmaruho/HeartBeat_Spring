package com.zero.heartbeat.dao;

import java.util.ArrayList;
import java.util.List;

import com.zero.heartbeat.model.SearchKeyword;
import com.zero.heartbeat.model.SearchList;

public interface ExploreDao {

	// JSY
	List<SearchList> selectAllSearchList(SearchKeyword dto);

}
