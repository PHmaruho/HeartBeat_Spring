package com.zero.heartbeat.dao;

import java.util.List;

import com.zero.heartbeat.model.Album;

import com.zero.heartbeat.model.MainList;
import com.zero.heartbeat.model.Music;
public interface CommonDao {

	List<Album> selectAlbumArriveList(Album album);
	List<Album> mainList();

	// JSY
	List<MainList> selectAlbumMainList(int startNum);
	
	
	List<Music> selectPlaylistFoot(int sessionSq);	// 최우일

}
