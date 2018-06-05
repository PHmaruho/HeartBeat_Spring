package com.zero.heartbeat.service;

import java.util.List;

import com.zero.heartbeat.model.Album;

public interface CommonService {

	List<Album> selectAlbumArriveList(Album album);

	List<Album> mainList();


}
