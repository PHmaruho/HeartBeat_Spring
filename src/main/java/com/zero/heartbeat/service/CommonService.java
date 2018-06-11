package com.zero.heartbeat.service;

import java.util.HashMap;
import java.util.List;

import com.zero.heartbeat.model.Album;
import com.zero.heartbeat.model.MainList;
import com.zero.heartbeat.model.Music;

public interface CommonService {

	// JSY
	List<MainList> selectAlbumMainListLike(int startNum);
	List<MainList> selectAlbumMainListNew(int startNum);
	

	List<Album> selectAlbumArriveList(Album album);
	List<Album> mainList();

	List<Music> selectPlaylistFoot(int sessionSq);	// 최우일
}
