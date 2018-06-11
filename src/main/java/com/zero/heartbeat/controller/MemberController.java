package com.zero.heartbeat.controller;

import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

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
	
	//JSY
	@RequestMapping("/alarmTest")
	public String alarmTest(Model model,Locale locale) {
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

	@RequestMapping("/loginPro")
	public String loginPro(Model model, String email, String pw, HttpSession session) {
		String returnString = "";
		model.addAttribute("email", email);
		model.addAttribute("pw", pw);
		Member member = new Member();
		member.setEmail(email);
		member.setPw(pw);
		System.out.println(member.getEmail());
		System.out.println(member.getPw());
		int loginSession = memberService.login(member);
		if (loginSession != 0) {
			session.setAttribute("loginSession", email);
			returnString = "common/home";
		} else {
			returnString = "member/loginForm";
		}
		return returnString;
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/common/home";
	}

	@RequestMapping("/memberInfoChangeForm")
	public String memberInfoChangeForm(Model model, HttpSession session) {
		Member member = new Member();
		member = memberService.getMemberInfo(session.getAttribute("loginSession") + "");
		model.addAttribute("member", member);
		return "member/memberInfoChangeForm";
	}

	@RequestMapping("/memberInfoChangePro")
	public String memberInfoChangePro(Member member, Model model) {
		model.addAttribute("member", member);
		return "member/memberInfoChangePro";
	}

	@RequestMapping("/memberInfoChangePro2")
	public String memberInfoChangePro2(MultipartFile file) {
		logger.info("하 쉬운게 하나 없네");
		logger.info(file.getOriginalFilename());
		logger.info(file.getSize()+"");
		return "member/loginPro";
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
		return "member/joinPro";
	}
}