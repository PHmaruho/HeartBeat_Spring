package com.zero.heartbeat.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.heartbeat.dao.ActivityDao;
import com.zero.heartbeat.dao.CommonDao;
import com.zero.heartbeat.dao.ExploreDao;
import com.zero.heartbeat.dao.MemberDao;
import com.zero.heartbeat.model.Member;

@Service
public class MemberServiceImpl implements MemberService {
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	// Autowired
	@Autowired private ActivityDao activityDao;
	@Autowired private CommonDao commonDao;
	@Autowired private ExploreDao exploreDao;
	@Autowired private MemberDao memberDao;

	@Override
	public int login(Member member) {
		// TODO Auto-generated method stub
		return memberDao.login(member);
	}

	@Override
	public void addSession(String email) {
		// TODO Auto-generated method stub

	}

	@Override
	public Member loginRest(Member member) {
		// TODO Auto-generated method stub
		return memberDao.loginRest(member);
	}

	@Override
	public int emailCheck(String email) {
		// TODO Auto-generated method stub
		return memberDao.emailCheck(email);
	}

	@Override
	public void join(Member member) {
		// TODO Auto-generated method stub
		memberDao.join(member);
	}

	@Override
	public void turnMemberActivity(String email) {
		// TODO Auto-generated method stub
		memberDao.turnMemberActivity(email);
	}

}
