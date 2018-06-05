package com.zero.heartbeat.dao;

import java.util.List;

import com.zero.heartbeat.model.Album;

public interface CommonDao {

	List<Album> selectAlbumArriveList(Album album);

	List<Album> mainList();

}
