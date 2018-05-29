package com.zero.heartbeat.controller;

import java.util.Locale;

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
	
	@RequestMapping("/")
	public String main(Locale locale, Model model, String url) {
		url = url == null ? "/home" : url;
		model.addAttribute("url", url);
		System.out.println("/");
		
		return "main";
	}
	
	@RequestMapping("/home")
	public String home(Locale locale, Model model) {
		
		return "common/home";
	}
	
	@RequestMapping("/test2")
	public String test2(Locale locale, Model model, String r) {
		System.out.println(r);
		if(r.equals("1")) {
			System.out.println("2");
			model.addAttribute("url", "/test2");
			return "forward:/";
		}
		System.out.println("f");
		return "test2";
	}
	
	@RequestMapping("/test3")
	public String test3(Locale locale, Model model) {
		
		return "test3";
	}
}
