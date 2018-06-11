package com.zero.heartbeat.dao;

import java.util.List;

import com.zero.heartbeat.model.Album;

import com.zero.heartbeat.model.MainList;
public interface CommonDao {

	//JAN
	List<Album> selectAlbumArriveList(Album album);
	List<MainList> mainList(int startNum);

	// JSY
	List<MainList> selectAlbumMainList(int startNum);

}
