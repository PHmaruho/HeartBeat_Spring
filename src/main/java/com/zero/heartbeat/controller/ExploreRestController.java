package com.zero.heartbeat.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zero.heartbeat.model.SearchKeyword;
import com.zero.heartbeat.model.SearchList;
import com.zero.heartbeat.service.ActivityService;
import com.zero.heartbeat.service.CommonService;
import com.zero.heartbeat.service.ExploreService;
import com.zero.heartbeat.service.MemberService;

@RestController
@RequestMapping(value="/do")
public class ExploreRestController {
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// Autowired
	@Autowired private ActivityService activityService;
	@Autowired private CommonService commonService;
	@Autowired private ExploreService exploreService;
	@Autowired private MemberService memberService;
	
	//JSY
	@RequestMapping("/discover/list")
	public void selectAllSearchList(Model model,String val) {
		ArrayList<Object> tag= new ArrayList<Object>(); 
		ArrayList<Object> artist= new ArrayList<Object>(); 
		ArrayList<Object> title= new ArrayList<Object>(); 

		SearchKeyword dto=new SearchKeyword();
		String[] arr1=val.split(" ");

		for(String s:arr1) {
			if(s.contains("#")) {
				tag.add(s);
				logger.info("#Tag: "+s);
			}
			else if(s.contains("@")) {
				artist.add(s);
				logger.info("@Artist: "+s);
			}
			else if(s.contains("*")) {
				title.add(s);
				logger.info("*Title: "+s);
			}
			dto.setArrTag(tag);
			dto.setArrArtist(artist);
			dto.setArrTitle(title);
		}
		ArrayList<SearchList> discoverList= exploreService.selectAllSearchList(dto);
		model.addAttribute("discoverList", discoverList);
		logger.info("ExploreRestController searchKeywordList working");
		return "explore/discover";
	}
	
}
