package com.zero.heartbeat.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zero.heartbeat.dao.ActivityDao;
import com.zero.heartbeat.dao.CommonDao;
import com.zero.heartbeat.dao.ExploreDao;
import com.zero.heartbeat.dao.MemberDao;
import com.zero.heartbeat.model.MusicLike;
import com.zero.heartbeat.model.SearchList;
import com.zero.heartbeat.model.Tag;
import com.zero.heartbeat.model.AllLikeList;
import com.zero.heartbeat.model.Code;
import com.zero.heartbeat.model.Member;
import com.zero.heartbeat.model.Music;

@Service
public class ActivityServiceImpl implements ActivityService {
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	// Autowired
	@Autowired private ActivityDao activityDao;
	@Autowired private CommonDao commonDao;
	@Autowired private ExploreDao exploreDao;
	@Autowired private MemberDao memberDao;
	
	
	//JAN
	@Override
	public int likeCount(int music_like_sq, int member_sq) {
		// TODO Auto-generated method stub
		return activityDao.likeCount(music_like_sq,member_sq);
	}

	
	//JAN 이미 좋아요 목록에 있는 시퀀스의 캔슬메소드
	@Override
	public void likeCancel(int music_like_sq) {
		// TODO Auto-generated method stub
		activityDao.likeCancel(music_like_sq);
	}

	//JAN
	@Override
	public void insertLike(MusicLike like) {
		// TODO Auto-generated method stub
		activityDao.insertLike(like);
	}

	//JAN
	@Override
	public List<MusicLike> likeList(int member_sq) {
		// TODO Auto-generated method stub
		return activityDao.likeList(member_sq);
	}
	//JAN
	@Override
	public List<AllLikeList> selectAllLikeList(int id) {
		// TODO Auto-generated method stub
		logger.info("selectAllLikeList ServiceImpl ");
		return activityDao.selectAllLikeList(id);
	}
	//JAN
	@Override
	public void clickUnlikeMusic(int unLike) {
		// TODO Auto-generated method stub
		activityDao.clickUnlikeMusic(unLike);
	}

	//JAN
	@Override
	public void clickUnlikeAlbum(int unLike) {
		// TODO Auto-generated method stub
		activityDao.clickUnlikeAlbum(unLike);
	}
	//JAN
	@Override
	public List<AllLikeList> selectUnLikeList(int id) {
		// TODO Auto-generated method stub
		return activityDao.selectUnLikeList(id);
	}
	//JAN
	@Override
	public void clickLikeAlbum(int likeAlbum, int id) {
		// TODO Auto-generated method stub
		activityDao.clickLikeAlbum(likeAlbum,id);
	}
	
	//JAN
	@Override
	public void clickLikeMusic(int likeMusic, int id) {
		// TODO Auto-generated method stub
		activityDao.clickLikeMusic(likeMusic,id);
	}
	
	//JAN
	@Override
	public void unLikeCancel(int unLikeCancel, String music_like_type) {
		// TODO Auto-generated method stub
		activityDao.unLikeCancel(unLikeCancel,music_like_type);
	}
	
	//JAN
	@Override
	public List<Member> selectFollowing(int id) {
		// TODO Auto-generated method stub
		return activityDao.selectFollowing(id);
	}

	//JAN
	@Override
	public List<Member> selectFollower(int id) {
		// TODO Auto-generated method stub
		return activityDao.selectFollower(id);
	}
	
	//JAN
	@Override
	public void follow(int mbsq, int ss) {
		// TODO Auto-generated method stub
		activityDao.follow(mbsq,ss);
	}
	
	//JAN
	@Override
	public int followCheck(int mbsq, int ss) {
		// TODO Auto-generated method stub
		return activityDao.followCheck(mbsq,ss);
	}
	
	//JAN
	@Override
	public void unfollow(int memberSq, int targetSq) {
		// TODO Auto-generated method stub
		activityDao.unfollow(memberSq, targetSq);
	}

	
	
	
	// PHmaruho
	@Override
	public List<Code> selectAlbumType() {
		// TODO Auto-generated method stub
		return activityDao.selectAlbumType();
	}
	
	@Override
	public List<Tag> searchTag() {
		// TODO Auto-generated method stub
		return activityDao.searchTag();
	}
	
	@Override
	public void uploadAlbumPro(MultipartHttpServletRequest mhsr, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		String realPath = "/resources/music";
		//String savePath = request.getSession().getServletContext().getRealPath(realPath);
		
		// album
		MultipartFile album_img = mhsr.getFile("album_img");
		String album_nm = mhsr.getParameter("album_nm");
		String album_comment = mhsr.getParameter("album_comment");
		String title_music = mhsr.getParameter("title_music_sq");
		String album_type = mhsr.getParameter("album_type");
		String album_open_yn = mhsr.getParameter("album_open_yn");
		
		// music
		String[] music_no = mhsr.getParameterValues("music_no");
		String[] artist = mhsr.getParameterValues("artist");
		String[] play_time = mhsr.getParameterValues("play_time");
		String[] music_tag = mhsr.getParameterValues("music_tag");
		String[] music_comment = mhsr.getParameterValues("music_comment");
		String[] music_open_yn = mhsr.getParameterValues("music_open_yn");
		List<MultipartFile> file_list = mhsr.getFiles("file");
		for(int i=0 ; i<file_list.size() ; i++) {
			logger.debug("@FIle Name = " + file_list.get(i).getOriginalFilename());
			logger.debug(music_no[i] + "/" + artist[i] + " / " + play_time[i] + " / " + music_tag[i] + " / " + music_comment[i] + " / " + music_open_yn[i]);
		}
		
		logger.debug(album_nm + " / " + album_comment + " / " + title_music + " / " + album_type
				+ " / " + album_open_yn);
		
	}
	
	// 최우일
	@Override
	public Music selectMusicDetail(int sq) {
		return activityDao.selectMusicDetail(sq);
	}

	// 최우일
	@Override
	public List<Member> selectMusicArtists(int sq) {
		return activityDao.selectMusicArtists(sq);
	}

	// 최우일
	@Override
	public Map<Integer, HashMap<String, Object>> selectReplyAtMusic(int sq) {
		return activityDao.selectReplyAtMusic(sq);
	}

	// 최우일
	@Override
	public List<Music> selectMusicByArtist(int sq) {
		return activityDao.selectMusicByArtist(sq);
	}

	// 최우일
	@Override
	public Member selectMemberArtist(int sq) {
		return activityDao.selectMemberArtist(sq);
	}
}
