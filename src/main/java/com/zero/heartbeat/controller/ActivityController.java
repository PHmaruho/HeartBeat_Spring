package com.zero.heartbeat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.zero.heartbeat.annotation.CheckSession;
import com.zero.heartbeat.model.AllLikeList;
import com.zero.heartbeat.model.Code;
import com.zero.heartbeat.model.Tag;
import com.zero.heartbeat.model.Member;
import com.zero.heartbeat.model.Music;
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
		
		model.addAttribute("album_type", type);
		model.addAttribute("music_tag", tag);
		
		return "activity/my/uploadAlbum";
	}
	
	@RequestMapping(value="/upload/album/pro")
	public String uploadAlbumPro(Model model, HttpServletRequest request,
									MultipartHttpServletRequest mhsr) {
		Boolean judge = activityService.uploadAlbumPro(mhsr, request);
		if(!judge) {
			
		}
		return "forward:/upload/album";
	}

	// uploadMusic
	@RequestMapping(value="/upload/music")
	public String uploadMusic(Model model) {
		
		return "activity/my/uploadMusic";
	}
	public String uploadMusicPro(Model model, HttpServletRequest request,
									MultipartHttpServletRequest mhsr) {
		Boolean judge = activityService.uploadMusicPro(mhsr, request);
		if(!judge) {
			
		}
		
		return "forward:/upload/music";
	}
	
	// 최우일
	@RequestMapping("/others/music/{sq}")
	public String othersMusic(Model model, @PathVariable int sq, HttpSession session) {
		Object obj = session.getAttribute("loginSession");
		int member_sq = obj == null ? 0 : Integer.parseInt(obj.toString());
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("member_sq", member_sq);
		map.put("music_sq", sq);
		
		Music music = activityService.selectMusicDetail(map);
		if (music == null) {
			return "common/noResult";
		}
		
		model.addAttribute("music", music);
		return "activity/others/music";
	}
	
	// 최우일
	@RequestMapping("/others/artist/{sq}")
	public String othersArtist(Model model, @PathVariable int sq, HttpSession session) {
		Object obj = session.getAttribute("loginSession");
		int member_sq = obj == null ? 0 : Integer.parseInt(obj.toString());
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("member_sq", member_sq);
		map.put("target_sq", sq);
		
		List<Music> list = activityService.selectMusicByArtist(map);
		Member member = activityService.selectMemberArtist(map);
		if (member == null) {
			return "common/noResult";
		}
		
		model.addAttribute("member", member);
		model.addAttribute("list", list);
		return "activity/others/artist";
	}
	
	// 최우일
	@RequestMapping("/my/music")
	public String myMusic(Model model, HttpSession session) {
		Object obj = session.getAttribute("loginSession");
		int member_sq = obj == null ? 0 : Integer.parseInt(obj.toString());
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("member_sq", member_sq);
		map.put("target_sq", member_sq);
		
		List<Music> list = activityService.selectMusicByArtist(map);
		Member member = activityService.selectMemberArtist(map);
		
		model.addAttribute("member", member);
		model.addAttribute("list", list);
		return "activity/my/music";
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
	
	@RequestMapping("/my/like")
	public ModelAndView selectAllLikeList(HttpSession session) {
		String id = (String) session.getAttribute("loginSession");
		int member_sq = Integer.parseInt(id);
		
		ModelAndView mav = new ModelAndView();
		
		List<AllLikeList> list = new ArrayList<AllLikeList>();
		List<AllLikeList> unList = new ArrayList<AllLikeList>();
		list = activityService.selectAllLikeList(member_sq);
		unList = activityService.selectUnLikeList(member_sq);
		logger.info("selectAllLikeList Controller ");
		logger.info("list size: "+ list.size());
		logger.info("unList size: "+ unList.size());
		
		mav.addObject("list",list);
		mav.addObject("unList",unList);
		mav.setViewName("activity/my/like");
		return mav;
	}
	

	//JAN
	@RequestMapping("/my/follow")
	public String followList(Model model, HttpSession httpSession) {
		List<Member> following = new ArrayList<Member>();
		List<Member> follower = new ArrayList<Member>();
		

		int id = Integer.parseInt((String) httpSession.getAttribute("loginSession"));
		logger.info("id ~ : " + id);
		
	
		following = activityService.selectFollowing(id);
		follower = activityService.selectFollower(id);
		
		logger.info("cntFollow 나오니?" + following.size());
		
		model.addAttribute("following",following);
		model.addAttribute("follower",follower);
		
		return "activity/my/follow";
	}

}
