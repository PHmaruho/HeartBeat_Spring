package com.zero.heartbeat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.zero.heartbeat.model.Member;
import com.zero.heartbeat.model.Music;
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
		String[] tagCheck1
		= {"#@","#*","##","@@","@*","@#","**","*@","*#","!","$","%","^","&","#","@","*"};
		String[] tagCheck2= {"#","@","*"};
		
		List<SearchList> discoverList= new ArrayList<SearchList>();
		ModelAndView model= new ModelAndView();
		SearchKeyword dto=new SearchKeyword();
		String[] arr1=val.split(" ");
		/*ArrayList<String> arrList=new ArrayList<String>(); 
		
		for(int i=0;i<arr1.length;i++){
			for(int m=0;m<tagCheck1.length;m++){
				int v=arr1[i].lastIndexOf(tagCheck1[m]);
				logger.info("arr1["+i+"]:"+arr1[i]+"/tagCheck["+m+"]:"+tagCheck1[m]+"/lastIndexOf:"+v);
				if((v!=-1)&& (v==0)) {
					for(int n=0;n<tagCheck2.length;n++) {
						int len2=arr1[i].lastIndexOf(tagCheck2[n]);
						if((len2!=-1)&& (len2==0)) {
						logger.info("========arr1["+i+"]:"+arr1[i]+"/tagCheck["+m+"]:"+tagCheck1[m]+"=======");
						arrList.add(arr1[i]);
						}
					}
				}
			}
		}
		
		for(int i=0;i<arrList.size();i++) {
			logger.info("arrList: "+s);
		}*/
		for(String s:arr1) {
			if(s.contains("#")&&!s.equals("#")) {
				String[] splitTag=s.split("#");
						tag+=splitTag[1]+" ";
						logger.info("#ArrTag:"+tag);
			}
			else if(s.contains("@")&&!s.equals("@")) {
				String[] splitArtist=s.split("@");
				artist+=splitArtist[1]+" ";
				logger.info("@ArrArtist:"+artist);
			}
			else if(s.contains("*")&&!s.equals("*")) {
				String[] splitTitle=s.split("\\*");
						title+=splitTitle[1]+" ";
						logger.info("*ArrTitle:"+title);
			}
		}
		/*logger.info("Total tag:"+tag);
		logger.info("Total artist:"+artist);
		logger.info("Total title:"+title);*/
		
		if(tag.isEmpty()|| tag.length()==0||tag.equals(" ")) tag="all";
		if(artist.isEmpty()|| artist.length()==0|| artist.equals(" ")) artist="all";
		if(title.isEmpty()|| title.length()==0|| title.equals(" ")) title="all";
		
		artist=artist.trim().replace(" ","|");
		title=title.trim().replace(" ","|");
		tag=tag.trim().replace(" ","|");
		if(artist.equals("all")&& title.equals("all")&&tag.equals("all")) {
			discoverList=null;
		}else {
			dto.setArrArtist(artist);
			dto.setArrTag(tag);
			dto.setArrTitle(title);
			discoverList= exploreService.selectAllSearchList(dto);
		}
		
		if(artist.equals("all")) artist="전체";
		if(title.equals("all")) title="전체";
		if(tag.equals("all")) tag="전체";
		
		String word_art=artist.replace("|", ", ");
		String word_tag=tag.replace("|", ", ");
		String word_title=title.replace("|", ", ");
		logger.info("word_art:"+word_art);
		logger.info("word_tag:"+word_tag);
		logger.info("word_title:"+word_title);
		
		model.addObject("word_art", word_art);
		model.addObject("word_tag", word_tag);
		model.addObject("word_title", word_title);
		
		model.addObject("discoverList", discoverList);
		model.setViewName("explore/discoverList");
		logger.info("ExploreRestController selectAllSearchList working");
		return model;
	}
	@RequestMapping("/getKeyword/tag")
	public Map<String,List<Tag>> getKeywordTag(String searchWord) {
		List<Tag> list=new ArrayList<Tag>();
		list= exploreService.getKeywordTag(searchWord);
		Map<String,List<Tag>> map=new HashMap<String,List<Tag>>();
		map.put("list", list);
		logger.info("ExploreRestController getKeywordTag working");
		return map;
	}
	@RequestMapping("/getKeyword/artist")
	public Map<String,List<Member>> getKeywordArtist(String searchWord) {
		List<Member> list=new ArrayList<Member>();
		list= exploreService.getKeywordArtist(searchWord);
		Map<String,List<Member>> map=new HashMap<String,List<Member>>();
		map.put("list", list);
		logger.info("ExploreRestController getKeywordTag working");
		return map;
	}
	@RequestMapping("/getKeyword/title")
	public Map<String,List<Music>> getKeywordTitle(String searchWord) {
		List<Music> list=new ArrayList<Music>();
		list= exploreService.getKeywordTitle(searchWord);
		Map<String,List<Music>> map=new HashMap<String,List<Music>>();
		map.put("list", list);
		logger.info("ExploreRestController getKeywordTag working");
		return map;
	}
}
