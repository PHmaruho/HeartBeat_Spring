package com.zero.heartbeat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.zero.heartbeat.model.AllLikeList;
import com.zero.heartbeat.model.Code;
import com.zero.heartbeat.model.Tag;
import com.zero.heartbeat.model.Member;
import com.zero.heartbeat.model.MusicLike;
import com.zero.heartbeat.model.SearchList;
import com.zero.heartbeat.service.ActivityService;
import com.zero.heartbeat.service.CommonService;
import com.zero.heartbeat.service.ExploreService;
import com.zero.heartbeat.service.MemberService;

@Controller
public class ActivityController {
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// Autowired
	@Autowired private ActivityService activityService;
	@Autowired private CommonService commonService;
	@Autowired private ExploreService exploreService;
	@Autowired private MemberService memberService;
	
	// PHmaruho
	// uploadForm
	@RequestMapping(value="/upload")
	public String upload(Model model) {
		
		return "activity/my/upload";
	}
	
	// uploadAlbum
	@RequestMapping(value="/upload/album")
	public String uploadAlbum(Model model) {
		List<Code> type = activityService.selectAlbumType();
		List<Tag> tag = activityService.searchTag();
		
		logger.info(tag + "");
		
		model.addAttribute("album_type", type);
		model.addAttribute("music_tag", tag);
		
		return "activity/my/uploadAlbum";
	}
	
	@RequestMapping(value="/upload/album/pro")
	public String uploadAlbumPro(Model model, HttpServletRequest request,
									MultipartHttpServletRequest mhsr) {
		
	
		activityService.uploadAlbumPro(mhsr, request);
		
		
//		try {
//			File dir = new File(savePath);
//			if(!dir.isDirectory()) {
//				dir.mkdir();
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//			logger.debug("없다규!@@@@@@ " + savePath);
//		}
		return "activity/my/uploadAlbum";
	}

	// uploadMusic
	@RequestMapping(value="/upload/music")
	public String uploadMusic(Model model) {
		
		return "activity/my/uploadMusic";
	}
	
	// 최우일
	@RequestMapping("/others/music/{sq}")
	public String othersMusic(Model model, @PathVariable int sq) {
		HashMap<String, Object> map = activityService.selectMusicDetail(sq);
		List<Member> list= activityService.selectMusicArtists(sq);
		
		model.addAttribute("music", map);
		model.addAttribute("artist", list);
		return "activity/others/music";
	}
	
	// 최우일
	@RequestMapping("/others/artist/{sq}")
	public String othersArtist(Model model, @PathVariable int sq) {
		int[] list = {302,303,304,305,306,307};
		
		model.addAttribute("list", list);
		return "activity/others/artist";
	}
	
	//JAN
	/*@RequestMapping(value="/my/like")
	public String selectMusicLikeList(Model model, HttpSession session) {
		int member_sq = (Integer) session.getAttribute("member_sq");
		List<MusicLike> list = activityService.likeList(member_sq);
		
		logger.info("likeList : " + list);
		model.addAttribute("likeList",list);
		return "activity/my/likeTest";
	}*/
	
	@RequestMapping("/my/likeTest")
	public ModelAndView selectAllLikeList(String id) {
		id = "709";
		int member_sq = Integer.parseInt(id);
		
		ModelAndView mav = new ModelAndView();
		
		List<AllLikeList> list = new ArrayList<AllLikeList>();
		list = activityService.selectAllLikeList(id);
		logger.info("selectAllLikeList Controller "+list.get(0).getAlbumLikeCount());
		logger.info("selectAllLikeList Controller "+list.get(0).getAlbumLikeCount());
		logger.info("selectAllLikeList Controller ");

		mav.addObject("list",list);
		mav.setViewName("activity/my/likeTest");
		return mav;
	}

}
