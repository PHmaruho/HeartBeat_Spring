package com.zero.heartbeat.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		return "test3";
	}
	
	@RequestMapping("/head")
	public String head(Model model) {
		return "common/head";
	}
	
	@RequestMapping("/foot")
	public String foot(Model model) {
		return "common/foot";
	}
}
