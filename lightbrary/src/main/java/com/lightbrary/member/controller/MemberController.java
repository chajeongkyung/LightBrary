package com.lightbrary.member.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
			HttpSession session, Model model) {
		
		log.info("로그인!");
		
		MemberDto memberDto = memberService.memberExist(email, password);		
		
		session.setAttribute("memberDto", memberDto);

		return "member/MemberDetailView";
		
	}
	// 로그아웃
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		log.info("로그아웃~");

		session.invalidate();
		
		return "redirect:/login.do";
	}
		
	@RequestMapping(value = "/member/detail.do", method = RequestMethod.GET)
	public String memberListOneView(HttpSession session, Model model) {
		
		log.info("내 정보 상세 페이지폼으로");
		
		return "member/MemberDetailView";
	}
	
	@RequestMapping(value = "/member/checkPassword.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String checkPasswordForm(HttpSession session, Model model) {
		
		log.info("정보 수정 전 비밀번호 확인 폼");
		return "member/CheckPasswordForm";
	}
//	
//	@RequestMapping(value = "/member/checkPasswordCtr.do", method = RequestMethod.POST)
//	public String checkPassword(@RequestParam("password") String password
//			, HttpSession session) {
//		
//		log.info("정보 수정 전 비밀번호 확인 컨트롤러");
//		
//		// password = memberService.findPassword();
//		
//		return "member/UpdateMemberDetailForm";
//	}
//	
	@RequestMapping(value = "/member/update.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String updateMemberDetail(HttpSession session, Model model) {
		
		log.info("내 정보 수정 페이지폼으로");
		
		return "member/UpdateMemberDetailForm";
	}
	
	@RequestMapping(value = "/member/updateCtr.do", method = RequestMethod.GET)
	public String updateMemberDetailCtr(HttpSession session, Model model) {
		
		log.info("내 정보 수정 컨트롤러");
		
		return "member/MemberDetailUpdateForm";
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/checkEmail.do", method = RequestMethod.POST)
	public int checkEmail(@RequestParam("email") String email) {

		log.info("이메일 중복체크 {}", email);
		
		return memberService.checkEmail(email);
	}

	@ResponseBody
	@RequestMapping(value = "/member/checkAccount.do", method = RequestMethod.POST)
	public MemberDto checkAccount(@RequestParam("email") String email
			, @RequestParam("password") String password) {

		log.info("계정 등록여부 {} {}", email, password);
		
		MemberDto memberDto = memberService.memberExist(email, password);	
		
		return memberDto;
	}
	
	@RequestMapping(value = "/findEmail.do", method = RequestMethod.GET)
	public String findEmail(Model model) {
		
		log.info("이메일 찾기 폼으로");
		
		return "auth/FindEmailForm";
	}
	
	@ResponseBody
	@RequestMapping(value = "/findEmailCtr.do", method = RequestMethod.POST)
	public MemberDto findEmailCtr(String userName, String phone, Model model) {

		log.info("이메일을 찾아주자{} {}", userName, phone);
		
		MemberDto memberDto = memberService.findEmail(userName, phone);	
		
		return memberDto;
	}
	
	@RequestMapping(value = "/findPassword.do", method = RequestMethod.GET)
	public String findPassword(Model model) {
		
		log.info("비밀번호 찾기 폼으로");
		
		return "auth/FindPasswordForm";
	}
	
	@Autowired
    private JavaMailSender mailSender;
	
	@RequestMapping("/sendEmail.do")
    public String sendEmail(@RequestParam("email") String userEmail
          , Model model) throws Exception {
        
      log.info("이메일전송 해보자");
      
      String password = memberService.findPassword(userEmail);
      System.out.println("비밀번호를 잘 찾아왔니: " + password);
        
      try {
	       if(password!=null) {
	          MimeMessage message = mailSender.createMimeMessage();
	          
	          MimeMessageHelper messageHelper = 
	                new MimeMessageHelper(message, true, "UTF-8");
	          
	          messageHelper.setFrom("Lightbrary");		//보내는 사람, 생략시 오류발생
	          messageHelper.setTo(userEmail);			//받는 사람
	          messageHelper.setSubject("요청하신 비밀번호입니다."); //제목
	          messageHelper.setText("회원님의 비밀번호는 " + password + "입니다.");
	          
	          mailSender.send(message);
           }
         
      } catch (Exception e) {
         // TODO: handle exception
         System.out.println(e);
      }
        
        return "redirect:/login.do";
    }




}
