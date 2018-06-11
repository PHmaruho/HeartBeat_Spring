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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zero.heartbeat.model.Album;
import com.zero.heartbeat.model.MainList;
import com.zero.heartbeat.model.Music;
import com.zero.heartbeat.service.ActivityService;
import com.zero.heartbeat.service.CommonService;
import com.zero.heartbeat.service.ExploreService;
import com.zero.heartbeat.service.MemberService;

import ch.qos.logback.core.net.SyslogOutputStream;

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
	
	@RequestMapping("/home")
	public String home(Model model) {
		logger.info("home start");
		List<Album> list = null;
		logger.info("home start");
		list = commonService.mainList();
		logger.info("home mainList size ->"+list.size());
		model.addAttribute("list",list);
		model.addAttribute("kkk","100.png");
		logger.info("home start mainList after");
		return "common/home";
	}
	
	@RequestMapping("/test2")
	public String test2(Model model) {
		return "test2";
	}
	
	@RequestMapping("/test3")
	public String test3(Model model, String txt, String pw) {
		return "test3";
	}
	
	
	// JSY
	@RequestMapping("/mainList")
	public String selectAlbumMainList(Model model) {
		List<MainList> list= new ArrayList<MainList>();
		int startNum=0;
		list= commonService.selectAlbumMainList(startNum);
		model.addAttribute("list", list);
		logger.info("CommonController selectAlbumMainList working");
		return "common/mainList";
	}
	
	
	
	@RequestMapping("/arrive")
	public String arriveList(Album album, Model model) throws Exception {
		List<Album> arriveList = commonService.selectAlbumArriveList(album);
		model.addAttribute("arriveList", arriveList);
		logger.debug("인터셉터 테스트");
		return "arrive";
	}
		
	
	
	
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
