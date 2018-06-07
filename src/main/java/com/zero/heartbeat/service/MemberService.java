package com.zero.heartbeat.service;

import java.util.List;

import com.zero.heartbeat.model.Alarm;
import com.zero.heartbeat.model.Member;

public interface MemberService {

	// JSY
	void insertAlarmShareMusic(String id,String music_sq);
	List<Alarm> selectAlarmMemberList(Member dto);

	// PHmaruho
	public List<Member> searchArtist(String keyword);
	int login(Member member);

	void addSession(String email);

	Member loginRest(Member member);

	int emailCheck(String email);

	void join(Member member);

	void turnMemberActivity(String email);


}
