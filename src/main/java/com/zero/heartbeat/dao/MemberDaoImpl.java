package com.zero.heartbeat.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zero.heartbeat.model.Alarm;
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
		session.insert("insertAlarmShareMusic", map);
	}
	public List<Alarm> selectAlarmMemberList(Member dto) {
		logger.info("MemberDaoImpl selectAlarmMemberList working");
		logger.info("dto id: "+dto.getMember_sq());
		return session.selectList("selectAlarmMemberList",dto);
	}

	// PHmaruho
	@Override
	public List<Member> searchArtist(String keyword) {
		// TODO Auto-generated method stub
		return session.selectList("selectMemberArtist", keyword);
	}

	@Override
	public int login(Member member) {
		// TODO Auto-generated method stub
		return session.selectOne("login",member);
	}

	@Override
	public Member loginRest(Member member) {
		// TODO Auto-generated method stub
		return session.selectOne("loginRest",member);
	}

	@Override
	public int emailCheck(String email) {
		// TODO Auto-generated method stub
		return session.selectOne("emailCheck",email);
	}

	@Override
	public void join(Member member) {
		// TODO Auto-generated method stub
		session.insert("join",member);
	}

}
