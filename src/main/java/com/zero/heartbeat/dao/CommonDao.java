package com.zero.heartbeat.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.zero.heartbeat.model.Album;

import com.zero.heartbeat.model.MainList;
import com.zero.heartbeat.model.Music;
import com.zero.heartbeat.model.SearchList;
public interface CommonDao {

	//JAN
	List<MainList> mainListLike(int startNum);
	List<MainList> mainListNew(int startNum);
	List<MainList> selectAlbumArriveList(int startNum);


	// JSY
	List<MainList> selectAlbumMainListLike(int startNum);
	List<MainList> selectAlbumMainListNew(int startNum);
	
	List<Music> selectPlaylistFoot(int sessionSq);	// 최우일
	Music selectMusicFootLoad(HashMap<String, Object> map);	// 최우일
	Map<String, Music> selectMusicCookieList(Map<String, Object> paramMap);	// 최우일

}
