package com.zero.heartbeat.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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
	@RequestMapping("/discoverList")
	public ModelAndView selectAllSearchList(String val) {
		ArrayList<String> tag= new ArrayList<String>(); 
		ArrayList<String> artist= new ArrayList<String>(); 
		ArrayList<String> title= new ArrayList<String>(); 
		ModelAndView model= new ModelAndView();
		
		SearchKeyword dto=new SearchKeyword();
		String[] arr1=val.split(" ");

		for(String s:arr1) {
			if(s.contains("#")) {
				String[] splitTag=s.split("#");
				tag.add(splitTag[1]);
				logger.info("#Tag: "+splitTag[1]);
			}
			else if(s.contains("@")) {
				String[] splitArtist=s.split("@");
				artist.add(splitArtist[1]);
				logger.info("@Artist: "+splitArtist[1]);
			}
			else if(s.contains("*")) {
				String[] splitTitle=s.split("\\*");
				title.add(splitTitle[1]);
				logger.info("*Title: "+splitTitle[1]);
			}
			
			else if(tag.isEmpty()|| tag.size()==0){tag=null;}
			else if(artist.isEmpty()|| artist.size()==0){artist=null;}
			else if(title.isEmpty()|| title.size()==0){title=null;}
			dto.setArrTag(tag);
			dto.setArrArtist(artist);
			dto.setArrTitle(title);
		}
		List<SearchList> discoverList= new ArrayList<SearchList>();
		discoverList= exploreService.selectAllSearchList(dto);
		model.addObject("discoverList", discoverList);
		model.setViewName("explore/discoverList");
		logger.info("ExploreRestController selectAllSearchList working");
		return model;
	}
	
}
