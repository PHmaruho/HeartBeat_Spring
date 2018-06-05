package com.zero.heartbeat.dao;

import java.util.List;

import com.zero.heartbeat.model.Member;

public interface MemberDao {
	// PHmaruho
	public List<Member> searchArtist(String keyword);
}
