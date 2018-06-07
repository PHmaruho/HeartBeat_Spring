package com.zero.heartbeat.dao;

import java.util.HashMap;
import java.util.List;

import com.zero.heartbeat.model.Alarm;
import com.zero.heartbeat.model.Member;

public interface MemberDao {
	
	// JSY
	void insertAlarmShareMusic(String id,String music_sq);
	void selectAlarmMemberList(HashMap<String, Object> map);

	// PHmaruho
	public List<Member> searchArtist(String keyword);
	int login(Member member);

	Member loginRest(Member member);

	int emailCheck(String email);

	void join(Member member);

	

}
