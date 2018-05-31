package com.zero.heartbeat.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String loginPro(Model model,String email,String pw,HttpSession session) {
		System.out.println("membercontroller loginPro");
		String returnString = "";
		model.addAttribute("email",email);
		model.addAttribute("pw",pw);
		Member member = new Member();
		member.setEmail(email);
		member.setPw(pw);
		Member loginSession =  memberService.login(member);
		if(loginSession !=null) {
			session.setAttribute("loginSession", loginSession);
			returnString =  "member/loginPro";
		}else {
			returnString = "member/loginForm";
		}
		return returnString;
	}
	
}
