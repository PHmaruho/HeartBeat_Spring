package com.zero.heartbeat.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zero.heartbeat.model.Code;
import com.zero.heartbeat.model.Tag;
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
		HashMap<String, Object> map = new HashMap<String, Object>();
		map = activityService.selectMusicDetail(sq);
		
		model.addAttribute("music", map);
		return "activity/others/music";
	}

}
