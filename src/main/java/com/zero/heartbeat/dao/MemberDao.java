package com.zero.heartbeat.dao;

import com.zero.heartbeat.model.Member;

public interface MemberDao {

	int login(Member member);

	Member loginRest(Member member);

	int emailCheck(String email);

	/*void join(Member member);*/

	

}
