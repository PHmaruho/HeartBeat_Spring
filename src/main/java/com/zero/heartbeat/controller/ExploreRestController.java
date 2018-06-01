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
import com.zero.heartbeat.model.Tag;
import com.zero.heartbeat.service.ActivityService;
import com.zero.heartbeat.service.CommonService;
import com.zero.heartbeat.service.ExploreService;
import com.zero.heartbeat.service.MemberService;

import scala.util.parsing.json.JSONArray;
import scala.util.parsing.json.JSONObject;

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
		String tag= ""; 
		String artist=""; 
		String title= ""; 
		
		logger.info("tag: "+tag);
		logger.info("title: "+title);
		logger.info("artist: "+artist);
		
		ModelAndView model= new ModelAndView();
		
		SearchKeyword dto=new SearchKeyword();
		String[] arr1=val.split(" ");

		for(String s:arr1) {
			if(s.contains("#")) {
				String[] splitTag=s.split("#");
				tag+=splitTag[1]+" ";
				logger.info("#ArrTag:"+tag);
			}
			else if(s.contains("@")) {
				String[] splitArtist=s.split("@");
				artist+=splitArtist[1]+" ";
				logger.info("@ArrArtist:"+artist);
			}
			else if(s.contains("*")) {
				String[] splitTitle=s.split("\\*");
				title+=splitTitle[1]+" ";
				logger.info("*ArrTitle:"+title);
			}
		}
		
		if(tag.isEmpty()|| tag.length()==0||tag.equals(" ")) tag="all";
		if(artist.isEmpty()|| artist.length()==0|| artist.equals(" ")) artist="all";
		if(title.isEmpty()|| title.length()==0|| title.equals(" ")) title="all";
		
		artist=artist.trim().replace(" ","|");
		title=title.trim().replace(" ","|");
		tag=tag.trim().replace(" ","|");

		dto.setArrArtist(artist);
		dto.setArrTag(tag);
		dto.setArrTitle(title);
		
		List<SearchList> discoverList= new ArrayList<SearchList>();
		discoverList= exploreService.selectAllSearchList(dto);
		
		String word_art=artist.replace("|", ", ");
		String word_tag=tag.replace("|", ", ");
		String word_title=title.replace("|", ", ");

		model.addObject("word_art", word_art);
		model.addObject("word_tag", word_tag);
		model.addObject("word_title", word_title);
		
		model.addObject("discoverList", discoverList);
		model.setViewName("explore/discoverList");
		logger.info("ExploreRestController selectAllSearchList working");
		return model;
	}
	
	// JSY
	@RequestMapping("/getKeyword/tag")
	public ModelAndView getKeywordTag(String searchWord) {
		ModelAndView mv=new ModelAndView();
		List<String> tagList=new ArrayList<String>();
		tagList= exploreService.getKeywordTag(searchWord);
		mv.addObject("tagList",tagList);
		//mv.setViewName("explore/getKeywordTag");
		logger.info("ExploreRestController getKeywordTag working");
		return mv;
	}
	
}
