package com.zero.heartbeat.service;

import com.zero.heartbeat.model.Member;

public interface MemberService {

	Member login(Member member);

	void addSession(String email);

}
