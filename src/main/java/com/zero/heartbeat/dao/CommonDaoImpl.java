package com.zero.heartbeat.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
	public List<MainList> selectAlbumArriveList(int startNum) {
		// TODO Auto-generated method stub
		return session.selectList("arriveList", startNum);
	}

	//JAN
	@Override
	public List<MainList> mainListLike(int startNum) {
		logger.info("CommonDaoImpl mainList before");
		return session.selectList("mainListLike",startNum);
	}
	public List<MainList> mainListNew(int startNum) {
		return session.selectList("mainListNew",startNum);
	}

	// 최우일
	@Override
	public List<Music> selectPlaylistFoot(int sessionSq) {
		logger.info("CommonDaoImpl selectPlaylistFoot");
		return session.selectList("selectPlaylistFoot", sessionSq);
	}
	
}
