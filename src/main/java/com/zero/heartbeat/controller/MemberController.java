package com.zero.heartbeat.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zero.heartbeat.model.Alarm;
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
	@RequestMapping("/memberAlarmList")
	public String selectAlarmMemberList(Model model) {
		int id2=709;
		Member dto=new Member();
		dto.setMember_sq(id2);
		List<Alarm> list=new ArrayList<Alarm>();
		list=memberService.selectAlarmMemberList(dto);
		for(int i=0;i<list.size();i++) {
			logger.info(i+"번째 변수: "+"alarm_sq["+list.get(i).getAlarm_sq()+"]");
		}
		
		model.addAttribute("list", list);
		logger.info("MemberController selectAlarmMemberList working");
		return "member/memberAlarmList";
	}
}
