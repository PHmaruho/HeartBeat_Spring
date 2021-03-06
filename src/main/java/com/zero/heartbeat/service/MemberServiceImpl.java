package com.zero.heartbeat.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.heartbeat.dao.ActivityDao;
import com.zero.heartbeat.dao.CommonDao;
import com.zero.heartbeat.dao.ExploreDao;
import com.zero.heartbeat.dao.MemberDao;
import com.zero.heartbeat.model.Alarm;
import com.zero.heartbeat.model.AlarmList;
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
	
	// JSY
	public void insertAlarmShareMusic(String id,String music_sq) {
		memberDao.insertAlarmShareMusic(id,music_sq);
		logger.info("MemberServiceImpl insertAlarmShareMusic working");
		
	}//JSY
	public void selectAlarmMemberList(HashMap<String, Object> map) {
		logger.info("MemberServiceImpl selectAlarmMemberList working");
		memberDao.selectAlarmMemberList(map);
	}//JSY
	public void updateAlarmStatus(int alarm_sq) {
		logger.info("MemberServiceImpl updateAlarmStatus working");
		memberDao.updateAlarmStatus(alarm_sq);
		
	}

	// PHmaruho
	@Override
	public List<Member> searchArtist(String keyword) {
		// TODO Auto-generated method stub
		return memberDao.searchArtist(keyword);
	}
	
	// KKH
	@Override
	public int login(Member member) {
		// TODO Auto-generated method stub
		return memberDao.login(member);
	}

	// KKH
	@Override
	public void addSession(String email) {
		// TODO Auto-generated method stub

	}

	// KKH
	@Override
	public Member loginRest(Member member) {
		// TODO Auto-generated method stub
		return memberDao.loginRest(member);
	}

	// KKH
	@Override
	public int emailCheck(String email) {
		// TODO Auto-generated method stub
		return memberDao.emailCheck(email);
	}

	// KKH
	@Override
	public void join(Member member) {
		// TODO Auto-generated method stub
		memberDao.join(member);
	}
	
	// KKH
	@Override
	public void turnMemberActivity(String email) {
		// TODO Auto-generated method stub
		memberDao.turnMemberActivity(email);
	}
	
	// KKH
	@Override
	public Member getMemberInfo(String string) {
		// TODO Auto-generated method stub
		return memberDao.getMemberInfo(string);
	}
	@Override
	public String getMemberSq(Member member) {
		// TODO Auto-generated method stub
		return memberDao.getMemberSq(member);
	}


}
