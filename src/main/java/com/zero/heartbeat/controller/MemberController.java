package com.zero.heartbeat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zero.heartbeat.model.AlarmList;
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
	
	//JSY
	@RequestMapping(value="/memberAlarmList",method=RequestMethod.GET)
	public String selectAlarmMemberList(Model model) {
		int id2=708;
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("member_sq", id2);
		memberService.selectAlarmMemberList(map);
		
		List<AlarmList> list=new ArrayList<AlarmList>();
		
		list= (ArrayList<AlarmList>) map.get("alarmList");
		logger.info("list.size:"+list.size());
		model.addAttribute("list", list);
		logger.info("MemberController selectAlarmMemberList working");
		return "member/memberAlarmList";
	}
	
	@RequestMapping("/loginForm")
	public String loginForm(Model model, Locale locale) {
		
		return "member/loginForm";
	}
	
	@RequestMapping("/emailCertify")
	public String emailCertify(Model model,Member member) {
		logger.info(member.getEmail());
		return "member/emailCertify";
	}
	
	@RequestMapping("/loginPro")
	public String loginPro(Model model,String email,String pw,HttpSession session) {
		String returnString = "";
		model.addAttribute("email",email);
		model.addAttribute("pw",pw);
		Member member = new Member();
		member.setEmail(email);
		member.setPw(pw);
		System.out.println(member.getEmail());
		System.out.println(member.getPw());
		int loginSession =  memberService.login(member);
		if(loginSession != 0) {
			session.setAttribute("loginSession", loginSession);
			returnString =  "member/loginPro";
		}else {
			returnString = "member/loginForm";
		}
		return returnString;
	}	
	
	@RequestMapping("/joinForm")
	public String joinForm(Model model) {
		return "member/joinForm";
	}
	
	@RequestMapping("/joinPro")
	public String joinPro(Model model,String email, String pw, String nick) {
		Member member = new Member();
		member.setEmail(email);
		member.setPw(pw);
		member.setNick(nick);
		memberService.join(member);
		return "member/joinPro";
	}
}