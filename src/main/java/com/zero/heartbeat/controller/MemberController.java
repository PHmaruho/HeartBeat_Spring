package com.zero.heartbeat.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zero.heartbeat.model.Member;
import com.zero.heartbeat.service.ActivityService;
import com.zero.heartbeat.service.CommonService;
import com.zero.heartbeat.service.ExploreService;
import com.zero.heartbeat.service.MemberService;

@Controller
public class MemberController {
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// Autowired
	@Autowired private ActivityService activityService;
	@Autowired private CommonService commonService;
	@Autowired private ExploreService exploreService;
	@Autowired private MemberService memberService;
	
	@RequestMapping("/loginForm")
	public String loginForm(Model model, Locale locale) {
		
		return "member/loginForm";
	}
	
	@RequestMapping("/loginPro")
	public String loginPro(Model model,String id,String pw) {
		model.addAttribute("id",id);
		model.addAttribute("pw",pw);
		Member member = new Member();
		member.setEmail(id);
		member.setPw(pw);
		Member member1 =  memberService.login(member);
		if(member1.getEmail().length() == 0) {
			model.addAttribute("email",member1.getEmail());
			memberService.addSession(member1.getEmail());
		}
		return "member/loginPro";
	}
}
