package com.zero.heartbeat.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.util.ArrayList;
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
import com.zero.heartbeat.model.Tag;

import scala.collection.generic.BitOperations.Int;

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
		
		String realMusicPath = "/resources/music/";
		String realImgPath = "/resources/img/";
		//String savePath = request.getSession().getServletContext().getRealPath(realPath);
		String savePath = null;
		
		HttpSession session = request.getSession();
		int member_sq = Integer.parseInt((String) session.getAttribute("loginSession"));
		
		// album
		MultipartFile album_img = mhsr.getFile("album_img");
		String album_nm = mhsr.getParameter("album_nm");
		String album_comment = mhsr.getParameter("album_comment");
		String title_music = mhsr.getParameter("title_music_sq");
		String album_type = mhsr.getParameter("album_type");
		String album_open_yn = mhsr.getParameter("album_open_yn");
		
		HashMap<String, Object> album_map = new HashMap<String, Object>();
		album_map.put("album_nm", album_nm);
		album_map.put("album_comment", album_comment);
		album_map.put("title_music", title_music);
		album_map.put("album_type", album_type);
		album_map.put("album_open_yn", album_open_yn);
		album_map.put("member_sq", member_sq);
		
		// album 등록작업
		int result_album = activityDao.uploadAlbumPro_album(album_map);
		
		if(result_album == 1) {
			int img_seq = activityDao.selectAlbumSeq(member_sq);
			
			// Album_img File 등록
			try {
				savePath = request.getSession().getServletContext().getRealPath(realImgPath);
				
				// img 경로 확인 및 생성
				File dir1 = new File(savePath);
				if(!dir1.isDirectory()) {
					dir1.mkdir();
				}
				
				// album img 등록
				File img_file = new File(savePath + img_seq + ".png");
				album_img.transferTo(img_file);
				
			} catch (Exception e) {
				// TODO: handle exception
				logger.debug("없다규!@@@@@@ " + savePath);
			}
			
			// music
			String[] music_no = mhsr.getParameterValues("music_no");
			String[] artist = mhsr.getParameterValues("artist");
			String[] play_time = mhsr.getParameterValues("play_time");
			String[] music_tag = mhsr.getParameterValues("music_tag");
			String[] music_comment = mhsr.getParameterValues("music_comment");
			String[] music_open_yn = mhsr.getParameterValues("music_open_yn");
			
			List<MultipartFile> file_list = mhsr.getFiles("file");
			
			ArrayList<Object> music_item = new ArrayList<Object>();
			HashMap<String, Object> item = null;
			
			for(int i=0 ; i<music_no.length ; i++) {
				item = new HashMap<String, Object>();
				item.put("music_no", music_no[i]);
				item.put("play_time", play_time[i]);
				item.put("music_comment", music_comment[i]);
				item.put("music_open_yn", music_open_yn[i]);
				
				// artist 분리하기
				String[] temp_artist = artist[i].split(",");
				ArrayList<Object> attr1 = new ArrayList<Object>();
				for (int j = 0; j < temp_artist.length; j++) {
					attr1.add(Integer.parseInt(temp_artist[j]));
				}
				item.put("artist", attr1);
				
				// tag 분리하기
				String[] temp_music_tag = music_tag[i].split(",");
				ArrayList<Object> attr2 = new ArrayList<Object>();
				for (int k = 0; k < temp_music_tag.length; k++) {
					attr2.add(temp_music_tag[k]);
				}
				item.put("tag", attr2);
				
				music_item.add(item);
				
				logger.debug("@FIle Name = " + file_list.get(i).getOriginalFilename());
				logger.debug(music_no[i] + "/" + artist[i] + " / " + play_time[i] + " / " + music_tag[i] + " / " + music_comment[i] + " / " + music_open_yn[i]);
			}
		}
		
		
		
		logger.debug(album_nm + " / " + album_comment + " / " + title_music + " / " + album_type
				+ " / " + album_open_yn);
		
	}
	
	// 최우일
	@Override
	public HashMap<String, Object> selectMusicDetail(int sq) {
		return activityDao.selectMusicDetail(sq);
	}

	// 최우일
	@Override
	public List<Member> selectMusicArtists(int sq) {
		return activityDao.selectMusicArtists(sq);
	}
}
