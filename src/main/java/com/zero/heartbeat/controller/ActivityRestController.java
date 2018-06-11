package com.zero.heartbeat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.zero.heartbeat.model.Member;
import com.zero.heartbeat.model.MusicLike;
import com.zero.heartbeat.service.ActivityService;
import com.zero.heartbeat.service.CommonService;
import com.zero.heartbeat.service.ExploreService;
import com.zero.heartbeat.service.MemberService;

@RestController
@RequestMapping(value="/do")
public class ActivityRestController {
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// Autowired
	@Autowired private ActivityService activityService;
	@Autowired private CommonService commonService;
	@Autowired private ExploreService exploreService;
	@Autowired private MemberService memberService;
	
	//JAN
	@RequestMapping("/do/like")
	public String selectMusicLikeCheck (@ModelAttribute Member member, MusicLike like, HttpSession session , @RequestParam int music_like_sq ) {
		int member_sq = (Integer) session.getAttribute("member_sq");
		like.setMember_sq(member_sq);
		//동일 라이크가 있는지 검사
		int count = activityService.likeCount(like.getTarget_sq(),member_sq);
//		 count == 0  ?activityService.likeCancel(music_like_sq) : activityService.insertLike(like);
		if(count == 0) {
			//없으면 insert
			activityService.insertLike(like);
		} else {
			activityService.likeCancel(music_like_sq);
		}
		return "/activity/do/like";

	}
	/* //JAN
	@RequestMapping("/do/follow")
	public String selectFollowCheck(Model model) {
		List<Follow> follower = activityService.selectFollowerCount();
		model.addAttribute("follower",follower);
		
		//int count = activityService.followerCount(Follow.getTarget_sq(),member_sq);
		return "activity/";
		
	}
	*/
	
//	// 최우일
//	@RequestMapping("/getDetailComments/{sq}")
//	public List<HashMap<String, Object>> getDetailComments(@PathVariable int sq) {
//		List<HashMap<String, Object>> list = null;
//		list = activityService.selectReplyAtMusic(sq);
//		
//		return list;
//	}
	
	// 최우일
	@RequestMapping("/getDetailComments/{sq}")
	public Map<Integer, HashMap<String, Object>> getDetailComments(@PathVariable int sq) {
		Map<Integer, HashMap<String, Object>> map = null;
		map = activityService.selectReplyAtMusic(sq);
		System.out.println("at controller : " + map);
		
		return map;
	}
}
