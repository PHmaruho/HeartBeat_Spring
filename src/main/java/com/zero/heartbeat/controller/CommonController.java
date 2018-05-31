package com.zero.heartbeat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zero.heartbeat.model.Album;
import com.zero.heartbeat.model.MainList;
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
	
	@RequestMapping("/")
	public String main(Model model, HttpServletRequest request) {
		String url = request.getAttribute("url") == null ? "/home" : request.getAttribute("url").toString();
		String c = request.getAttribute("c") == null ? "" : request.getAttribute("c").toString();
		c = url.equals("/home") ? "1" : c;
		model.addAttribute("url", url);
		model.addAttribute("c", c);
		
		return "main";
	}
	
	@RequestMapping("/home")
	public String home(Model model) {
		return "common/home";
	}
	
	@RequestMapping("/test2")
	public String test2(Model model) {
		return "test2";
	}
	
	@RequestMapping("/test3")
	public String test3(Model model, String txt, String pw) {
		logger.info(txt);
		logger.info(pw);
		
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
		return "common/list";
	}
}
