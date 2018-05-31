package com.zero.heartbeat.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zero.heartbeat.model.Member;
import com.zero.heartbeat.service.ActivityService;
import com.zero.heartbeat.service.CommonService;
import com.zero.heartbeat.service.ExploreService;
import com.zero.heartbeat.service.MemberService;

@RestController
@RequestMapping(value="/do")
public class MemberRestController {
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// Autowired
	@Autowired private ActivityService activityService;
	@Autowired private CommonService commonService;
	@Autowired private ExploreService exploreService;
	@Autowired private MemberService memberService;
	
	@RequestMapping("/login1")
	public Member login(String email,String pw) {
		logger.info("들어옴");
		logger.info(email + " / " + pw);
		System.out.println("RestController login start");
		/*Member member = new Member();
		member.setEmail(email);
		member.setPw(pw);
		System.out.println("RestController login member 전");
		
		member = memberService.login(member);
		System.out.println("RestController login member 후");*/
		
		return null;
	}
}
