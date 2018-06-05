package com.zero.heartbeat.service;

import java.util.HashMap;
import java.util.List;

import com.zero.heartbeat.model.Album;
import com.zero.heartbeat.model.MainList;

public interface CommonService {

	// JSY
	List<MainList> selectAlbumMainList(int startNum);
	

	List<Album> selectAlbumArriveList(Album album);
	List<Album> mainList();
}
