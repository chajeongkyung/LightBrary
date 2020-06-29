package com.lightbrary.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lightbrary.member.model.MemberDto;
import com.lightbrary.member.service.MemberService;

@Controller
public class MemberController {

	private static final Logger log = 
		LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/member/add.do")
	public String memberAdd(Model model) {
		
		log.info("회원가입 폼으로");
		
		return "member/MemberForm";
	}

	@RequestMapping(value = "/member/addCtr.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String memberAdd(MemberDto memberDto, Model model) {
		
		log.info("회원가입 컨트롤러입니다", memberDto);
		
		memberService.insertOneMember(memberDto);
		
		return "redirect:/login.do";
		} 
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) {
		
		log.info("로그인 폼으로");
		
		return "auth/LoginForm";
	}
	
	@RequestMapping(value = "/loginCtr.do", method = RequestMethod.POST)
	public String loginCtr(String email, String password,
			HttpSession session) {
		
		log.info("로그인 컨트롤러입니다" + "이메일:" + email + "비번" + password);
		
		String viewUrl = "";
		
		MemberDto memberDto = memberService.existMember(email, password);		
		
		if(memberDto != null) {
			session.setAttribute("member", memberDto);
			
			//list로 추후 수정하기
			viewUrl = "redirect:/member/add.do";
		}else {
			viewUrl = "/auth/LoginFail";
		}
		
		return viewUrl;
		
	}
	
	@RequestMapping(value = "/member/checkEmail.do", method = RequestMethod.POST)
	@ResponseBody
	public int emailCheck(@RequestParam("email") String email) {

		log.info("이메일 중복체크 {}", email);
		
		return memberService.checkEmail(email);
	}

}
