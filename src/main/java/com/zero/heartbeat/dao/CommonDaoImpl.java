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

@Repository
public class CommonDaoImpl implements CommonDao {
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// SqlSession
	@Autowired private SqlSession session;

	
	// JSY
	public List<MainList> selectAlbumMainList(int startNum) {
		logger.debug("CommonDaoImpl selectAlbumMainList working");
		return session.selectList("selectAlbumMainList",startNum);
	}


	
	@Override
	public List<Album> selectAlbumArriveList(Album album) {
		// TODO Auto-generated method stub
		return session.selectList("arriveList", album);
	}


	@Override
	public List<Album> mainList() {
		logger.info("CommonDaoImpl mainList before");
		return session.selectList("mainList");
	}
}
