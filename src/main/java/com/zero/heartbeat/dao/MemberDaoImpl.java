package com.zero.heartbeat.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zero.heartbeat.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// SqlSession
	@Autowired private SqlSession session;

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

/*	@Override
	public void join(Member member) {
		// TODO Auto-generated method stub
		session.insert("join",member);
	}*/

}
