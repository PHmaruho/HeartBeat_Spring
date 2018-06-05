package com.zero.heartbeat.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
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
}
