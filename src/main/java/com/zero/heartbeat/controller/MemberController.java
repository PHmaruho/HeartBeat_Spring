package com.zero.heartbeat.controller;

import java.io.File;
import java.util.Iterator;
import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zero.heartbeat.annotation.CheckSession;
import com.zero.heartbeat.model.Member;
import com.zero.heartbeat.service.ActivityService;
import com.zero.heartbeat.service.CommonService;
import com.zero.heartbeat.service.ExploreService;
import com.zero.heartbeat.service.MailService;
import com.zero.heartbeat.service.MemberService;

@Controller
public class MemberController {
	// Logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	// Autowired
	@Autowired private MailService mailService;
	@Autowired private ActivityService activityService;
	@Autowired private CommonService commonService;
	@Autowired private ExploreService exploreService;
	@Autowired private MemberService memberService;

	// JSY
	@RequestMapping("/alarmTest")
	public String alarmTest(Model model, Locale locale) {
		return "member/alarmTest";
	}

	@RequestMapping("/loginForm")
	public String loginForm(Model model, Locale locale) {

		return "member/loginForm";
	}

	@RequestMapping("/emailCertify")
	public String emailCertify(Model model, Member member, HttpSession session) {
		String returnString = "";
		logger.info("여기에요 여기" + member.getEmail());
		boolean check = false;
		int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
		String joinCode = String.valueOf(ran);
		session.setAttribute("joinCode", joinCode);
		String subject = "회원가입 인증 코드 발급 안내 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증 코드는 " + joinCode + " 입니다.");
		check = mailService.send(subject, sb.toString(), "kimmuradin@gmail.com", member.getEmail(), null);
		if (check == true) {
			model.addAttribute("joinCode", joinCode);
			returnString = "member/emailCertify";
		} else {
			// 이메일 보내기 실패시
		}
		return returnString;
	}

	@RequestMapping("/emailServiceSuccess")
	public String emailServiceSuccess(Model model, Member member) {
		logger.info("emailServiceSuccess" + member.getEmail());
		try {
			memberService.turnMemberActivity(member.getEmail());
			return "member/emailServiceSuccess";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/loginPro")
	public String loginPro(Model model, String email, String pw, String loginUrl, HttpSession session) {
		String returnString = "";
		Member member = new Member();
		member.setEmail(email);
		member.setPw(pw);
		int loginSession = memberService.login(member);
		if (loginSession != 0) {
			String member_sq = memberService.getMemberSq(member);
			session.setAttribute("loginSession", member_sq);
			returnString = "redirect:" + loginUrl;
		} else {
			returnString = "forward:/loginForm";
		}
		return returnString;
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "forward:/home";
	}

	@CheckSession
	@RequestMapping("/memberInfoChangeForm")
	public String memberInfoChangeForm(Model model, HttpSession session) {
		Member member = new Member();
		member = memberService.getMemberInfo(session.getAttribute("loginSession") + "");
		model.addAttribute("member", member);
		return "member/memberInfoChangeForm";
	}

	@CheckSession
	@RequestMapping("/memberInfoChangePro")
	public String memberInfoChangePro(Member member, Model model) {
		model.addAttribute("member", member);
		return "member/memberInfoChangePro";
	}

	@CheckSession
	@RequestMapping("/memberInfoChangePro2")
	public String memberInfoChangePro2(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		String path = "c://aaa";
		try {
			MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req;
			Iterator<String> iter = mhsr.getFileNames();
			MultipartFile mfile = null;
			String fieldName = "";
			
			File dir = new File(path);
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}
			
			while (iter.hasNext()) {
				fieldName = iter.next();
				mfile = mhsr.getFile(fieldName);
				String origName;
				origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8");
				
				if ("".equals(origName)) {
					continue;
				}
				
				String ext = ".png";
				String saveFileName = session.getAttribute("loginSession") + ext;
				File serverFile = new File(path + File.separator + saveFileName);
				mfile.transferTo(serverFile);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:/home";
	}

	@RequestMapping("/joinForm")
	public String joinForm(Model model) {
		return "member/joinForm";
	}

	@RequestMapping("/joinPro")
	public String joinPro(Model model, String email, String pw, String nick) {
		Member member = new Member();
		member.setEmail(email);
		member.setPw(pw);
		member.setNick(nick);
		memberService.join(member);
		return "redirect:/home";
	}
}