package com.zero.heartbeat.dao;

import java.util.HashMap;
import java.util.List;

import com.zero.heartbeat.model.Album;
import com.zero.heartbeat.model.MainList;

public interface CommonDao {

	// JSY
	List<MainList> selectAlbumMainList(int startNum);

}
