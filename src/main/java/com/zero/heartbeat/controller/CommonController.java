package com.zero.heartbeat.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zero.heartbeat.model.Album;
import com.zero.heartbeat.model.MainList;
import com.zero.heartbeat.model.Music;
import com.zero.heartbeat.model.SearchList;
import com.zero.heartbeat.service.ActivityService;
import com.zero.heartbeat.service.CommonService;
import com.zero.heartbeat.service.ExploreService;
import com.zero.heartbeat.service.MemberService;

@Controller
public class CommonController {
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// Autowired
	@Autowired private ActivityService activityService;
	@Autowired private CommonService commonService;
	@Autowired private ExploreService exploreService;
	@Autowired private MemberService memberService;
	 
	// 최우일
	@RequestMapping("/")	
	public String main(Model model, HttpServletRequest request) {
		String url = request.getAttribute("url") == null ? "/home" : request.getAttribute("url").toString();
		String c = request.getAttribute("c") == null ? "" : request.getAttribute("c").toString();
		c = url.equals("/home") ? "1" : c;
		
		String str[] = this.getClass().getPackage().toString().split("\\.");
		
		model.addAttribute("url", url);
		model.addAttribute("c", c);
		model.addAttribute("packageName", str[2]);
		
		return "main";
	}
	
	//JAN
	@RequestMapping("/home")
	public String MainList(Model model) {
		logger.info("home start");
		List<MainList> list= new ArrayList<MainList>();
		int startNum=0;
		list = commonService.mainList(startNum);
		logger.info("home mainList size ->"+list.size());
		model.addAttribute("list",list);
		//model.addAttribute("kkk","100.png");
		logger.info("home start mainList after");
		return "common/home";
	}
	
	//JAN
		@RequestMapping("/arrive")
		public String arriveList(Album album, Model model) throws Exception {
			List<Album> arriveList = commonService.selectAlbumArriveList(album);
			model.addAttribute("arriveList", arriveList);
			logger.debug("인터셉터 테스트");
			return "common/arrive";
	}
	
	// JSY
	@RequestMapping("/mainList")
	public String selectAlbumMainList(Model model) {
		List<MainList> likeList= new ArrayList<MainList>();
		List<MainList> newList= new ArrayList<MainList>();
		int startNum=0;
		likeList= commonService.selectAlbumMainListLike(startNum);
		newList=commonService.selectAlbumMainListNew(startNum);
		model.addAttribute("likeList", likeList);
		model.addAttribute("newList", newList);
		logger.info("CommonController selectAlbumMainList working");
		return "common/mainList";
	}
	
	// JAN
	@RequestMapping("/head")
	public String head(Model model) {
		return "common/head";
	}
	
	// 최우일
	@RequestMapping("/foot")
	public String foot(Model model, HttpServletRequest requset) {
		int sessionSq = 703;
		
		List<Music> list = commonService.selectPlaylistFoot(sessionSq);
		model.addAttribute("playlist", list);
		
		return "common/foot";
	}
}
