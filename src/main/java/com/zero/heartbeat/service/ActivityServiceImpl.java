package com.zero.heartbeat.service;

import java.util.List;
import java.util.Map;

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
import com.zero.heartbeat.model.MusicTag;
import com.zero.heartbeat.model.Reply;
import com.zero.heartbeat.model.Tag;

import scala.collection.generic.BitOperations.Int;

import com.zero.heartbeat.model.Album;
import com.zero.heartbeat.model.Artist;
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
	public Boolean uploadAlbumPro(MultipartHttpServletRequest mhsr, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		String realMusicPath = "/resources/music/";
		String realImgPath = "/resources/img/album/";
		String savePath = null;
		
		HttpSession session = request.getSession();
		int member_sq = 717;
		
		// album
		MultipartFile album_img = mhsr.getFile("album_img");
		String album_nm = mhsr.getParameter("album_nm");
		String album_comment = mhsr.getParameter("album_comment") == null ? "" : mhsr.getParameter("album_comment"); 
		String title_music = mhsr.getParameter("title_music_sq");
		String album_type = mhsr.getParameter("album_type");
		String album_open_yn = mhsr.getParameter("album_open_yn");
		
		Album albumDto = new Album();
		albumDto.setAlbum_nm(album_nm);
		albumDto.setAlbum_comment(album_comment);
		albumDto.setMusic_sq(Integer.parseInt(title_music));
		albumDto.setAlbum_type(album_type);
		albumDto.setOpen_yn(album_open_yn);
		albumDto.setMember_sq(member_sq);
		
		// album 등록작업
		int result_album = activityDao.uploadAlbumPro_album(albumDto);
		
		if(result_album == 1) {
			// img 파일 명을 바꾸기 위한 작업
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
				logger.debug("img 경로가 없습니다 " + savePath);
				e.printStackTrace();
				return false;
			}
			
			// music
			String[] music_no = mhsr.getParameterValues("music_no");
			String[] music_nm = mhsr.getParameterValues("music_nm");
			String[] artist = mhsr.getParameterValues("artist");
			String[] play_time = mhsr.getParameterValues("play_time");
			String[] music_tag = mhsr.getParameterValues("music_tag");
			String[] music_comment = mhsr.getParameterValues("music_comment");
			String[] music_open_yn = mhsr.getParameterValues("music_open_yn");
			
			for (int p = 0; p < music_no.length; p++) {
				if(music_comment[p] == null || music_comment[p].length() == 0) {
					music_comment[p] = null;
				}
			}
			
			List<MultipartFile> file_list = mhsr.getFiles("file");
			
			Music musicDto = null;
			
			for(int i=0 ; i<music_no.length ; i++) {
				
				musicDto = new Music();
				musicDto.setAlbum_sq(img_seq);
				musicDto.setMusic_no(Integer.parseInt(music_no[i]));
				musicDto.setMusic_nm(music_nm[i]);
				musicDto.setPlay_time(Integer.parseInt(play_time[i]));
				musicDto.setMusic_comment(music_comment[i]);
				musicDto.setOpen_yn(music_open_yn[i]);
				
				Boolean judge1 = activityDao.uploadMusicPro(musicDto);
				if(!judge1) {
					return false;
				}
			}
			
			// artist 등록을 위한 등록 된 music_sq를 가져온다.
			List<Integer> music_seq = activityDao.selectMusicSeq(img_seq);
			
			for (int j = 0; j < music_no.length; j++) {
				// artist 분리하기
				String[] temp_member = artist[j].split(",");
				Artist artistDto = null;
				
				for (int m = 0; m < temp_member.length; m++) {
					artistDto = new Artist();
					artistDto.setMember_sq(Integer.parseInt(temp_member[m]));
					artistDto.setMusic_sq(music_seq.get(j));
					Boolean judge2 = activityDao.insertArtistList(artistDto);
					if(!judge2) {
						return false;
					}
				}
				
				// tag 분리하기
				String[] temp_music_tag = music_tag[j].split(",");
				MusicTag musicTagDto = null;
				for (int k = 0; k < temp_music_tag.length; k++) {
					musicTagDto = new MusicTag();
					musicTagDto.setMusic_sq(music_seq.get(j));
					musicTagDto.setTag_cd(temp_music_tag[k]);
					Boolean judge3 = activityDao.insertMusicTagList(musicTagDto);
					if(!judge3) {
						return false;
					}
				}
			}
			
			int n = 0;
			for (MultipartFile file : file_list) {
				// album img 등록
				savePath = request.getSession().getServletContext().getRealPath(realMusicPath);
				
				File dir1 = new File(savePath);
				if(!dir1.isDirectory()) {
					dir1.mkdir();
				}
				
				try {
					File music_file = new File(savePath + music_seq.get(n++) + ".mp3");
					file.transferTo(music_file);
				} catch (Exception e) {
					// TODO: handle exception
					logger.debug("없다규!@@@@@@ " + savePath);
					return false;
				}
			}
			
			// title_music_sq 설정 update
			activityDao.updateAlbumTitleMusic(music_seq.get(Integer.parseInt(title_music)), img_seq);
		} else {
			return false;
		}
		
		return true;
	}
	
	@Override
	public Boolean uploadMusicPro(MultipartHttpServletRequest mhsr, HttpServletRequest request) {
		// TODO Auto-generated method stub
		String realMusicPath = "/resources/music/";
		String realImgPath = "/resources/img/album/";
		String savePath = null;
		
		HttpSession session = request.getSession();
		int member_sq = Integer.parseInt(String.valueOf(session.getAttribute("loginSession")));
		
		MultipartFile album_img = mhsr.getFile("album_img");
		Album albumDto = new Album();
		albumDto.setAlbum_nm("unAlbum_nm");
		albumDto.setAlbum_comment("unAlbum_comment");
		albumDto.setMusic_sq(0);
		albumDto.setAlbum_type(request.getParameter("album_type"));
		albumDto.setOpen_yn("Y");
		albumDto.setMember_sq(member_sq);
		
		// album 등록작업
		int result_album = activityDao.uploadAlbumPro_album(albumDto);
		
		// Album_img File 등록
		try {
			savePath = request.getSession().getServletContext().getRealPath(realImgPath);
			
			// img 경로 확인 및 생성
			File dir1 = new File(savePath);
			if(!dir1.isDirectory()) {
				dir1.mkdir();
			}
			
			// album img 등록
			File img_file = new File(savePath + result_album + ".png");
			album_img.transferTo(img_file);
			
		} catch (Exception e) {
			// TODO: handle exception
			logger.debug("img 경로가 없습니다 " + savePath);
			e.printStackTrace();
			return false;
		}
		
		if(result_album == 1) {
			// img 파일 명을 바꾸기 위한 작업
			int img_seq = activityDao.selectAlbumSeq(member_sq);
			
			// music
			String music_no = mhsr.getParameter("music_no");
			String music_nm = mhsr.getParameter("music_nm");
			String artist = mhsr.getParameter("artist");
			String play_time = mhsr.getParameter("play_time");
			String music_tag = mhsr.getParameter("music_tag");
			String music_comment = mhsr.getParameter("music_comment") == null ? "" : mhsr.getParameter("music_comment");
			String music_open_yn = mhsr.getParameter("music_open_yn");
			
			MultipartFile music_file_multi = mhsr.getFile("file");
			
			Music musicDto = null;
			musicDto = new Music();
			musicDto.setAlbum_sq(img_seq);
			musicDto.setMusic_no(Integer.parseInt(music_no));
			musicDto.setMusic_nm(music_nm);
			musicDto.setPlay_time(Integer.parseInt(play_time));
			musicDto.setMusic_comment(music_comment);
			musicDto.setOpen_yn(music_open_yn);
			
			Boolean judge1 = activityDao.uploadMusicPro(musicDto);
			if(!judge1) {
				return false;
			}
			
			// artist 등록을 위한 등록 된 music_sq를 가져온다.
			int music_seq = activityDao.selectOneMusicSeq(img_seq);
			
			// artist 분리하기
			String[] temp_member = artist.split(",");
			Artist artistDto = null;
			
			for (int m = 0; m < temp_member.length; m++) {
				artistDto = new Artist();
				artistDto.setMember_sq(Integer.parseInt(temp_member[m]));
				artistDto.setMusic_sq(music_seq);
				Boolean judge2 = activityDao.insertArtistList(artistDto);
				if(!judge2) {
					return false;
				}
			}
			
			// tag 분리하기
			String[] temp_music_tag = music_tag.split(",");
			MusicTag musicTagDto = null;
			for (int k = 0; k < temp_music_tag.length; k++) {
				musicTagDto = new MusicTag();
				musicTagDto.setMusic_sq(music_seq);
				musicTagDto.setTag_cd(temp_music_tag[k]);
				Boolean judge3 = activityDao.insertMusicTagList(musicTagDto);
				if(!judge3) {
					return false;
				}
			}
			
			int n = 0;
			// album img 등록
			savePath = request.getSession().getServletContext().getRealPath(realMusicPath);
			
			File dir1 = new File(savePath);
			if(!dir1.isDirectory()) {
				dir1.mkdir();
			}
			
			try {
				File music_file = new File(savePath + music_seq + ".mp3");
				music_file_multi.transferTo(music_file);
			} catch (Exception e) {
				// TODO: handle exception
				logger.debug("없다규!@@@@@@ " + savePath);
				return false;
			}
			
			// title_music_sq 설정 update
			activityDao.updateAlbumTitleMusic(music_seq, img_seq);
		}
		return true;
	}
	
	// PHmaruho
	@Override
	public int insertReplyMusic(HttpServletRequest request) {
		String reply_sq = request.getParameter("reply_sq") == null ? "" : request.getParameter("reply_sq");
		int music_sq = Integer.parseInt(request.getParameter("music_sq"));
		int time_stamp = Integer.parseInt(request.getParameter("time_stamp"));
		String reply_comment = request.getParameter("reply_comment");
		
		HttpSession session = request.getSession();
		String member_sq = (String) session.getAttribute("loginSession");
		
		int result1 = 0, result2 = 0;
		
		logger.debug("^^^^^^^^^^^ -> " + " / " + reply_sq + " / " + music_sq + " / " + time_stamp + " / " + reply_comment  + " / " + member_sq);
		
		Reply replyDto = new Reply();
		// target reply
		if(reply_sq.length() != 0) {
			logger.debug("member_sq -> " + member_sq);
			logger.debug("@@@@@@@@@@@@@@target");
			replyDto = activityDao.selectTargetReply(reply_sq);
			
			logger.debug("member_sq -> " + replyDto.getMember_sq());
			
			// 등록자의 member_sq로 바꿔준다.
			replyDto.setMember_sq(Integer.parseInt(member_sq));
			replyDto.setTime_stamp(time_stamp);
			replyDto.setReply_comment(reply_comment);
			
			result1 = activityDao.insertTargetReply(replyDto);
			
			logger.debug("@@Target => " + replyDto.getReply_order());
			
		} else { // normal reply
			logger.debug("member_sq -> " + replyDto.getMember_sq());
			
			logger.debug("@@@@@@@@@@@@@@normal");
			replyDto = new Reply();
			replyDto.setMember_sq(Integer.parseInt(member_sq));
			replyDto.setTime_stamp(time_stamp);
			replyDto.setMusic_sq(music_sq);
			replyDto.setReply_comment(reply_comment);
			
			logger.debug("member_sq -> " + replyDto.getMember_sq());
			
			int reply_order_normal = activityDao.selectSameTimeStamp(replyDto);
			
			logger.debug("reply_order_normal => " + reply_order_normal);
			
			if(reply_order_normal != -1) {
				replyDto.setReply_order(reply_order_normal+1);
			}
			
			logger.debug("reply_order_normal => " + replyDto.getReply_order());
			
			result2 = activityDao.insertNormalReply(replyDto);
		}
		// 하위 목록이 있다면 업데이트 처리를 진행한다.
		if(result1 == 1 || result2 == 1) {
			Reply replyDto_update = activityDao.selectLastReplyByMe(member_sq);
			
			int result3 = activityDao.updateLowerReply(replyDto_update);
		}
		return result1+result2;
	}
	
	// PHmaruho
	@Override
	public List<Reply> selectReplyList(HttpServletRequest request) {
		// TODO Auto-generated method stub
//		int music_sq = Integer.parseInt(request.getParameter("music_sq"));
//		String pageNum = request.getParameter("page");
//		
//		int totCnt  = activityDao.selectTotalReply(music_sq);
//		if (pageNum==null || pageNum.equals("")) {	pageNum = "1";	}
//		int currentPage = Integer.parseInt(pageNum);	
//		int pageSize  = 10, blockSize = 5;
//		int startRow = (currentPage - 1) * pageSize + 1;
//		int endRow   = startRow + pageSize - 1;
//		int startNum = totCnt - startRow + 1;
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("music_sq", music_sq);
//		map.put("startRow", startRow);
//		map.put("endRow", endRow);
//		List<Reply> list = activityDao.selectReplyList(map);
//		int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
//		int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;
//		int endPage = startPage + blockSize -1;	
//		if (endPage > pageCnt) endPage = pageCnt;
		return null;
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
