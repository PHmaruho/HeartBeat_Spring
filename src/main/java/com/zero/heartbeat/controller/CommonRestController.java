package com.zero.heartbeat.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.zero.heartbeat.model.Music;
import com.zero.heartbeat.service.ActivityService;
import com.zero.heartbeat.service.CommonService;
import com.zero.heartbeat.service.ExploreService;
import com.zero.heartbeat.service.MemberService;

@RestController
@RequestMapping(value="/do")
public class CommonRestController {
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// Autowired
	@Autowired private ActivityService activityService;
	@Autowired private CommonService commonService;
	@Autowired private ExploreService exploreService;
	@Autowired private MemberService memberService;
	
	//JSY
	@RequestMapping("/mainListShare")
	public void insertAlarmShareMusic(Model model,String music_sq,String id) {
		logger.info(music_sq);
		/*String id="708";*/
		memberService.insertAlarmShareMusic(id,music_sq);
		logger.info("CommonRestController mainListShare working");
		
	}
	
	// 최우일
	@RequestMapping("/footLoad/{sq}")
	public Music footLoad(@PathVariable int sq) {
		Music music = commonService.selectMusicFootLoad(sq);
		
		return music;
	}
	
	// 최우일
	@RequestMapping(value = "/cookieList", method=RequestMethod.POST)
	public Map<String, Music> cookieList(@RequestBody Map<String, Object> paramMap) {
		Map<String, Music> map = commonService.selectMusicCookieList(paramMap);
		
		return map;
	}
}
