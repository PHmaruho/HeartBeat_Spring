package com.zero.heartbeat.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zero.heartbeat.model.Alarm;
import com.zero.heartbeat.model.AlarmList;
import com.zero.heartbeat.model.Member;

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
		logger.info("MemberDaoImpl insertAlarmShareMusic working");
		session.insert("insertAlarmShareMusic", map);
	}//JSY
	public void selectAlarmMemberList(HashMap<String, Object> map) {
		logger.info("MemberDaoImpl selectAlarmMemberList working");
		session.selectOne("selectAlarmMemberList",map);
	}//JSY
	public void updateAlarmStatus(int alarm_sq) {
		logger.info("MemberDaoImpl updateAlarmStatus working");
		session.update("updateAlarmStatus",alarm_sq);
		
	}
	

	// PHmaruho
	@Override
	public List<Member> searchArtist(String keyword) {
		// TODO Auto-generated method stub
		return session.selectList("selectMemberArtist", keyword);
	}

	// KKH
	@Override
	public int login(Member member) {
		// TODO Auto-generated method stub
		return session.selectOne("login",member);
	}

	// KKH
	@Override
	public Member loginRest(Member member) {
		// TODO Auto-generated method stub
		return session.selectOne("loginRest",member);
	}

	// KKH
	@Override
	public int emailCheck(String email) {
		// TODO Auto-generated method stub
		return session.selectOne("emailCheck",email);
	}

	// KKH
	@Override
	public void join(Member member) {
		// TODO Auto-generated method stub
		session.insert("join",member);
	}

	// KKH
	@Override
	public void turnMemberActivity(String email) {
		// TODO Auto-generated method stub
		session.update("turnMemberActivity",email);
	}
	
	// KKH
	@Override
	public Member getMemberInfo(String string) {
		// TODO Auto-generated method stub
		return session.selectOne("getMemberInfo",string);
	}
	@Override
	public String getMemberSq(Member member) {
		// TODO Auto-generated method stub
		return session.selectOne("getMemberSq",member);
	}
	
	// 최우일
	@Override
	public int selectAlarmCount(int member_sq) {
		return session.selectOne("selectAlarmCount", member_sq);
	}
}
