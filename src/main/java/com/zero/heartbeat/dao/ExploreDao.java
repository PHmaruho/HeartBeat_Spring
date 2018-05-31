package com.zero.heartbeat.dao;

import java.util.ArrayList;

import com.zero.heartbeat.model.SearchKeyword;
import com.zero.heartbeat.model.SearchList;

public interface ExploreDao {

	// JSY
	ArrayList<SearchList> selectAllSearchList(SearchKeyword dto);

}
