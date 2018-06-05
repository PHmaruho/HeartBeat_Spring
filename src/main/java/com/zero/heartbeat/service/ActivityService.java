package com.zero.heartbeat.service;

import java.util.List;

import com.zero.heartbeat.model.MusicLike;

public interface ActivityService {

	int likeCount(int music_like_sq, int member_sq);

	void likeCancel(int music_like_sq);

	void insertLike(MusicLike like);

	List<MusicLike> likeList(int member_sq);

}
