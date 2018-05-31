package com.zero.heartbeat.service;

import java.util.ArrayList;

import com.zero.heartbeat.model.SearchKeyword;
import com.zero.heartbeat.model.SearchList;

public interface ExploreService {

	// JSY
	ArrayList<SearchList> selectAllSearchList(SearchKeyword dto);

}
