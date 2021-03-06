package com.zero.heartbeat.service;

import java.util.HashMap;
import java.util.List;

import com.zero.heartbeat.model.Alarm;
import com.zero.heartbeat.model.AlarmList;
import com.zero.heartbeat.model.Member;

public interface MemberService {

	// JSY
	void insertAlarmShareMusic(String id,String music_sq);
	void selectAlarmMemberList(HashMap<String, Object> map);
	void updateAlarmStatus(int alarm_sq);

	// PHmaruho
	public List<Member> searchArtist(String keyword);
	int login(Member member);

	// KKH
	void addSession(String email);
	Member loginRest(Member member);
	int emailCheck(String email);
	void join(Member member);
	void turnMemberActivity(String email);
	Member getMemberInfo(String string);
	
	String getMemberSq(Member member);
	
}
