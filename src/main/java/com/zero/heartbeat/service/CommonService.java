package com.zero.heartbeat.service;

import java.util.HashMap;
import java.util.List;

import com.zero.heartbeat.model.Album;
import com.zero.heartbeat.model.MainList;
import com.zero.heartbeat.model.Music;
import com.zero.heartbeat.model.SearchList;

public interface CommonService {

	// JSY
	List<MainList> selectAlbumMainListLike(int startNum);
	List<MainList> selectAlbumMainListNew(int startNum);
	
	// JAN
	List<Album> selectAlbumArriveList(Album album);
	List<SearchList> mainList();

	// 최우일
	List<Music> selectPlaylistFoot(int sessionSq);
}
