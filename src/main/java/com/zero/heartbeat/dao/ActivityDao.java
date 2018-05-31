package com.zero.heartbeat.dao;

import java.util.HashMap;

import com.zero.heartbeat.model.Music;

public interface ActivityDao {

	HashMap<String, Object> selectMusicDetail(int sq);

}
