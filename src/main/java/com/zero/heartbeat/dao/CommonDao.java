package com.zero.heartbeat.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.zero.heartbeat.model.Album;

import com.zero.heartbeat.model.MainList;
import com.zero.heartbeat.model.Music;
import com.zero.heartbeat.model.SearchList;
public interface CommonDao {

	// JAN
	List<Album> selectAlbumArriveList(Album album);
	List<SearchList> mainList();

	// JSY
	List<MainList> selectAlbumMainListLike(int startNum);
	List<MainList> selectAlbumMainListNew(int startNum);
	
	List<Music> selectPlaylistFoot(int sessionSq);	// 최우일
	Music selectMusicFootLoad(int sq);	// 최우일
	Map<String, Music> selectMusicCookieList(Map<String, Object> paramMap);	// 최우일

}
