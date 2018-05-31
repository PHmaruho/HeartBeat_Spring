package com.zero.heartbeat.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl implements MemberDao {
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// SqlSession
	@Autowired private SqlSession session;

	//JSY
	public void insertAlarmShareMusic(String id,String music_sq) {
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("id", id);
		map.put("music_sq", music_sq);
		session.insert("insertAlarmShareMusic", map);
	}
}
