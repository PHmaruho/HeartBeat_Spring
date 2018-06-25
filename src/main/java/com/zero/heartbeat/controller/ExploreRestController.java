package com.zero.heartbeat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ModelAndView selectAllSearchList(String kArtist,String kTitle,String kTag) {
		List<String> tag= new ArrayList<String>(); 
		List<String> artist=new ArrayList<String>();
		List<String> title= new ArrayList<String>(); 
		
		List<SearchList> discoverList= new ArrayList<SearchList>();
		List<SearchList> resultList= new ArrayList<SearchList>();
		ModelAndView model= new ModelAndView();
		SearchKeyword dto=new SearchKeyword();
		String[] arrArt=kArtist.split(",");
		String[] arrTitle=kTitle.split(",");
		String[] arrTag=kTag.split(",");
		
		for(String s:arrArt) {
			if(s.contains("all")) artist.add("전체");
			else artist.add(s);
			logger.info("arrArt: "+s);
		}
		for(String s:arrTitle) {
			if(s.contains("all")) title.add("전체");
			else title.add(s);
			logger.info("arrTitle: "+s);
		}
		for(String s:arrTag) {
			if(s.contains("all")) tag.add("전체");
			else tag.add(s);
			logger.info("arrTag: "+s);
		}
		
		/*for(String s:arr1) {
			if(s.contains("#")&&!s.equals("#")) {
				String[] splitTag=s.split("#");
						tag.add(splitTag[1]);
						logger.info("#ArrTag:"+tag);
			}
			else if(s.contains("@")&&!s.equals("@")) {
				String[] splitArtist=s.split("@");
				artist.add(splitArtist[1]);
				logger.info("@ArrArtist:"+artist);
			}
			else if(s.contains("*")&&!s.equals("*")) {
				String[] splitTitle=s.split("\\*");
						title.add(splitTitle[1]);
						logger.info("*ArrTitle:"+title);
			}
		}
		*/
		if(tag.isEmpty()|| tag.size()==0||tag.contains(" ")) tag.add("전체");
		if(artist.isEmpty()|| artist.size()==0|| artist.contains(" ")) artist.add("전체");
		if(title.isEmpty()|| title.size()==0|| title.contains(" ")) title.add("전체");
		
		logger.info("artist: "+artist.size());
		logger.info("title: "+title.size());
		logger.info("tag: "+tag.size());
		
		if(artist.contains("전체")&& title.contains("전체")&&tag.contains("전체")) {
			discoverList=null;
		}else {
			dto.setArrArtist(artist);
			dto.setArrTag(tag);
			dto.setArrTitle(title);
			discoverList= exploreService.selectAllSearchList(dto);
			for(int i=0;i<discoverList.size();i++) {
				int v=0;
				String nick=discoverList.get(i).getNick();
				for(int n=i+1;n<discoverList.size();n++) {
					String nick2=discoverList.get(n).getNick();
					if(discoverList.get(i).getAlbum_nm().equals(discoverList.get(n).getAlbum_nm())) {
						if(discoverList.get(i).getMusic_sq()==discoverList.get(n).getMusic_sq()) {
							nick+=", "+nick2;
							v=1;
							continue;
						}// music_sq
					}// album_nm
				}
				logger.info("nick:"+nick);
				logger.info("v:"+v);
				discoverList.get(i).setNick(nick);
				if(v==1) discoverList.remove(i+1);
				/*else resultList.add(discoverList.get(i));
				logger.info("resultList:"+resultList.get(0).getNick());*/
			}// for 전체
		}
		
		model.addObject("discoverList", discoverList);
		model.addObject("artist",dto.getArrArtist());
		model.addObject("tag",dto.getArrTag());
		model.addObject("title",dto.getArrTitle());
		
		model.setViewName("explore/discoverList");
		
		/*logger.info("Total tag:"+tag);
		logger.info("Total artist:"+artist);
		logger.info("Total title:"+title);*/
		/*
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
		model.setViewName("explore/discoverList");*/
		logger.info("ExploreRestController selectAllSearchList working");
		return model;
	}//JSY
	@RequestMapping("/getKeyword/tag")
	public Map<String,List<Tag>> getKeywordTag(String searchWord) {
		List<Tag> list=new ArrayList<Tag>();
		list= exploreService.getKeywordTag(searchWord);
		logger.info("exploreRestController keyword Tag: "+searchWord);
		Map<String,List<Tag>> map=new HashMap<String,List<Tag>>();
		map.put("list", list);
		logger.info("ExploreRestController getKeywordTag working");
		return map;
	}//JSY
	@RequestMapping("/getKeyword/artist")
	public Map<String,List<Member>> getKeywordArtist(String searchWord) {
		List<Member> list=new ArrayList<Member>();
		list= exploreService.getKeywordArtist(searchWord);
		Map<String,List<Member>> map=new HashMap<String,List<Member>>();
		map.put("list", list);
		logger.info("ExploreRestController getKeywordArtist working");
		return map;
	}//JSY
	@RequestMapping("/getKeyword/title")
	public Map<String,List<Music>> getKeywordTitle(String searchWord) {
		List<Music> list=new ArrayList<Music>();
		list= exploreService.getKeywordTitle(searchWord);
		Map<String,List<Music>> map=new HashMap<String,List<Music>>();
		map.put("list", list);
		logger.info("ExploreRestController getKeywordTitle working");
		return map;
	}
}
