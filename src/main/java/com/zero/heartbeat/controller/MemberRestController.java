package com.zero.heartbeat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.zero.heartbeat.model.AlarmList;
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

	// PHmaruho
	// searchArtist
	@RequestMapping(value="/searchArtist")
	public List<Member> searchArtist(String keyword) {
		List<Member> list = memberService.searchArtist(keyword);
		
		if(list == null) {
			return null;
		}
		
		return list;
	}
	
	@RequestMapping("/loginRest")
	public Member loginRest(String email,String pw) {
		Member member = new Member();
		member.setEmail(email);
		member.setPw(pw);
		
		Member result = memberService.loginRest(member);
		if(result.getEmail() == null || result.getEmail() == "") {
			result.setEmail("");
		}
		return result;
	}
	
	@RequestMapping("/login")
	public int login(String email,String pw) {
		Member member = new Member();
		member.setEmail(email);
		member.setPw(pw);
		
		int result = memberService.login(member);
		return result;
	}
	
	@RequestMapping("/emailCheck")
	public int emailCheck(String email) {
		int result = memberService.emailCheck(email);
		return result;
	}
	
	// JSY
	@RequestMapping("/memberAlarmList")
	public ModelAndView selectAlarmMemberList(ModelAndView mv,HttpSession session) {
		String member_sq = (String) session.getAttribute("loginSession");
		int id=Integer.parseInt(member_sq);
		List<AlarmList> list=new ArrayList<AlarmList>();
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("member_sq", id);
		memberService.selectAlarmMemberList(map);
		list=(List<AlarmList>) map.get("resultList");
		logger.info("list.size:"+list.size());
		mv.addObject("list", list);
		mv.setViewName("member/memberAlarmList");
		logger.info("MemberRestController selectAlarmMemberList working");
		return mv;
	}//JSY
	@RequestMapping("/updateAlarmStatus")
	public void updateAlarmStatus(String alarmSq) {
		logger.info("alarmSq: "+alarmSq);
		int alarm_sq=Integer.parseInt(alarmSq);
		logger.info("alarm_sq: "+alarm_sq);
		logger.info("MemberRestController updateAlarmStatus working");
		memberService.updateAlarmStatus(alarm_sq);
	}
	
}
