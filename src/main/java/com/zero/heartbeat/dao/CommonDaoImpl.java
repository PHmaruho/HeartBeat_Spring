package com.zero.heartbeat.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zero.heartbeat.model.Album;
import com.zero.heartbeat.model.MainList;
import com.zero.heartbeat.model.Music;
import com.zero.heartbeat.model.SearchList;

@Repository
public class CommonDaoImpl implements CommonDao {
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// SqlSession
	@Autowired private SqlSession session;

	
	// JSY
	public List<MainList> selectAlbumMainListLike(int startNum) {
		logger.debug("CommonDaoImpl selectAlbumMainList working");
		return session.selectList("selectAlbumMainListLike",startNum);
	}
	public List<MainList> selectAlbumMainListNew(int startNum) {
		logger.debug("CommonDaoImpl selectAlbumMainList working");
		return session.selectList("selectAlbumMainListNew",startNum);
	}


	// JAN
	@Override
	public List<Album> selectAlbumArriveList(Album album) {
		// TODO Auto-generated method stub
		return session.selectList("arriveList", album);
	}

	//JAN
	@Override
	public List<SearchList> mainList() {
		logger.info("CommonDaoImpl mainList before");
		return session.selectList("mainList");
	}

	// 최우일
	@Override
	public List<Music> selectPlaylistFoot(int sessionSq) {
		return session.selectList("selectPlaylistFoot", sessionSq);
	}
	
	// 최우일
	@Override
	public Music selectMusicFootLoad(int sq) {
		return session.selectOne("selectMusicFootLoad", sq);
	}
	
	// 최우일
	@Override
	public Map<String, Music> selectMusicCookieList(Map<String, Object> paramMap) {
		int len = paramMap.size();
		List<Integer> list = new ArrayList<Integer>();
		for (int i = 1; i < len; i++) {
			list.add(Integer.valueOf((String) (paramMap.get("cookieOrder" + i))));
		}
		Map<String, Music> resultMap = new HashMap<String, Music>();
		Map<Integer, Music> tempMap = session.selectMap("selectMusicCookieList", list, "music_sq");
		
		for (int i = 1; i < len; i++) {
			int key = Integer.valueOf((String) paramMap.get("cookieOrder" + i));
			resultMap.put("cookieOrder" + i, tempMap.get(key));
		}
		
		return resultMap;
	}
}
