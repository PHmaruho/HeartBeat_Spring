package com.zero.heartbeat.service;

import com.zero.heartbeat.model.Member;

public interface MemberService {

	int login(Member member);

	void addSession(String email);

	Member loginRest(Member member);

	int emailCheck(String email);

	/*void join(Member member);*/


}
