package com.zero.heartbeat.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zero.heartbeat.model.Code;
import com.zero.heartbeat.model.Member;
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
		
		model.addAttribute("album_type", type);
		
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

}
