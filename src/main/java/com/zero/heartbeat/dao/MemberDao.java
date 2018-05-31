package com.zero.heartbeat.dao;

import com.zero.heartbeat.model.Member;

public interface MemberDao {

	int login(Member member);

	int loginRest(Member member);

	

}
