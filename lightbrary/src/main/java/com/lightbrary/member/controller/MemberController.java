package com.lightbrary.member.controller;

import java.util.List;

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
import com.lightbrary.member.model.MemberListParamDto;
import com.lightbrary.member.service.MemberService;
import com.lightbrary.util.CommonUtils;
import com.lightbrary.util.Paging;
import com.lightbrary.util.interceptor.Auth;
import com.lightbrary.util.interceptor.Auth.Role;

/**
 * @author 차정경
 *
 */

@Controller
public class MemberController {

	private static final Logger log = 
		LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/member/add.do")
	public String memberAdd() {
		
		log.info("회원가입 폼으로");
		
		return "member/MemberJoinForm";
	}

	@RequestMapping(value = "/member/addCtr.do", method = RequestMethod.POST)
	public String memberAdd(MemberDto memberDto) {
		
		log.info("회원가입 컨트롤러", memberDto);
		
		memberService.insertOneMember(memberDto);
		
		return "redirect:/login.do";
	}
	
	@RequestMapping(value = "/login.do", method =  {RequestMethod.POST, RequestMethod.GET})
	public String login(String email, Model model) {
		
		log.info("로그인 폼으로");
		
		model.addAttribute("findEmail", email);
		
		return "auth/LoginForm";
	}
	
	@RequestMapping(value = "/loginCtr.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String loginCtr(String email, String password,
			HttpSession session) {
		
		log.info("성공적으로 로그인되었습니다");
		
		MemberDto memberDto = memberService.memberExist(email, password);		
		
		session.setAttribute("member", memberDto);

		return "redirect:/main.do";
		
	}
	
	// 로그아웃
	@Auth(role=Role.USER)
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		log.info("로그아웃되었습니다");

		session.invalidate();
		
		return "redirect:/login.do";
	}
	
	//회원 목록
	@Auth(role=Role.ADMIN)
	@RequestMapping(value = "/auth/list.do"
			, method = {RequestMethod.GET, RequestMethod.POST})
	public String rentList(@RequestParam(defaultValue = "1") int curPage
			, MemberListParamDto memberListParamDto
			, Model model) {
		
		log.info("----------회원목록-----------");
		log.info("curPage: " + curPage);
		log.info("" + memberListParamDto);
		log.info("---------------------------");
		
		int totalCount = memberService.totalCountMember(memberListParamDto);
		Paging pagingInfo = new Paging(totalCount, curPage);
		
		memberListParamDto.setCurPage(curPage);
		memberListParamDto.setStartPage(pagingInfo.getPageBegin());
		memberListParamDto.setEndPage(pagingInfo.getPageEnd());

		List<MemberDto> memberDtoList = memberService.selectMember(memberListParamDto);
		
		model.addAttribute("memberDtoList", memberDtoList);
		model.addAttribute("memberListParamDto", memberListParamDto);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "member/MemberListView";
	}
	
	//회원상세
	@Auth(role=Role.ADMIN)
	@RequestMapping(value = "/auth/detail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String memberListOneView(int no, MemberListParamDto memberListParamDto
			, Model model) {
		
		log.info("-----------회원상세------------");
		log.info("no: " + no);
		log.info(memberListParamDto.toString());
		log.info("-----------------------------");
		
		MemberDto memberDto = memberService.selectOneMember(no);
		
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("memberListParamDto", memberListParamDto);
		
		return "member/MemberListOneView";
	}
	
	//회원정보수정
	@Auth(role=Role.ADMIN)
	@RequestMapping(value = "/auth/update.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String updateMemberListOne(int no, MemberListParamDto memberListParamDto, Model model) {

		log.info("----------회원정보수정----------");
		log.info("no: " + no);
		log.info(memberListParamDto.toString());
		log.info("-----------------------------");
		
		MemberDto memberDto = memberService.selectOneMember(no);
		
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("memberListParamDto", memberListParamDto);
		
		return "member/UpdateMemberListOneForm";
	}
	
	//내정보상세
	@Auth(role=Role.USER)
	@RequestMapping(value = "/member/detail.do", method = RequestMethod.GET)
	public String memberDetailView() {
		
		log.info("내 정보 상세 페이지폼으로");
		
		return "member/MemberDetailView";
	}
	
	@Auth(role=Role.USER)
	@RequestMapping(value = "/member/checkPassword.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String checkPasswordForm() {
		
		log.info("정보 수정 전 비밀번호 확인 폼으로");
		
		return "member/CheckPasswordForm";
	}

	@Auth(role=Role.USER)
	@RequestMapping(value = "/member/update.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String updateMemberDetail() {
		
		log.info("내 정보 수정 페이지폼으로");
		
		return "member/UpdateMemberDetailForm";
	}
	
	@Auth(role=Role.USER)
	@RequestMapping(value = "/member/updateCtr.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String updateMemberDetailCtr(HttpSession session, MemberDto memberDto) {
		
		log.info("내 정보 수정 컨트롤러 {}", memberDto);
		
		int resultNum = 0;
		
		try {
			resultNum = memberService.updateOneMember(memberDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if(resultNum != 0) {
			MemberDto sessionMemberDto 
				= (MemberDto)session.getAttribute("member");
			
			if(sessionMemberDto != null) {
				
				if(sessionMemberDto.getNo() == memberDto.getNo()) {

					//String password = memberService.findPassword(memberDto.getEmail());
					String password = memberDto.getPassword();
					MemberDto newMemberDto = memberService.memberExist(memberDto.getEmail(), password);
					
					session.removeAttribute("member");
					
					session.setAttribute("member", newMemberDto);
				}
				
			}
		}

		return "redirect:./detail.do";
	}
	
	@Auth(role=Role.USER)
	@RequestMapping(value = "/member/deleteCtr.do", method = RequestMethod.GET)
	public String deleteMember(int no, HttpSession session) {
		
		log.info("탈퇴되었습니다");
		
		memberService.deleteOneMember(no);
		
		String url = "";
		
		MemberDto sessionMemberDto 
			= (MemberDto)session.getAttribute("member");
		
		if (sessionMemberDto.getGradeCode() == 0) {
			url = "redirect:/auth/list.do";
		} else {
			url = "redirect:/logout.do";
		}
		
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/checkEmail.do", method = RequestMethod.POST)
	public int checkEmail(@RequestParam("email") String email) {

		log.info("이메일 중복체크 {}", email);
		
		return memberService.checkEmail(email);
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/checkPhone.do", method = RequestMethod.POST)
	public int checkPhone(@RequestParam("phone") String phone) {

		log.info("폰번호 중복체크 {}", phone);
		
		return memberService.checkPhone(phone);
	}

	//로그인할때 디비에 아이디와 비번확인
	@ResponseBody
	@RequestMapping(value = "/member/checkAccount.do", method = RequestMethod.POST)
	public MemberDto checkAccount(@RequestParam("email") String email
			, @RequestParam("password") String password) {

		log.info("계정 등록여부 {} {}", email, password);
		
		MemberDto memberDto = memberService.memberExist(email, password);	
		
		return memberDto;
	}
	
	@RequestMapping(value = "/findEmail.do", method = RequestMethod.GET)
	public String findEmail() {
		
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
	
	@Auth(role=Role.ADMIN)
	@RequestMapping(value="/auth/deleteBatch.do", method = RequestMethod.POST, 
			produces="text/plain;charset=UTF-8")
	@ResponseBody
	public void memberDeleteBatch(int[] noArr) {
		log.info("선택된 회원 삭제 {}", noArr);

		for (int no : noArr) {
			log.info("{}", no);
			memberService.deleteOneMember(no);
		}
	}
	
	@RequestMapping(value = "/findPassword.do", method = RequestMethod.GET)
	public String findPassword() {
		
		log.info("비밀번호 찾기 폼으로");
		
		return "auth/FindPasswordForm";
	}
	
	@Autowired
    private JavaMailSender mailSender;
	
	@Auth(role=Role.USER)
	@RequestMapping("/sendEmail.do")
    public String sendEmail(@RequestParam("email") String email, HttpSession session)
    		throws Exception {
        
      log.info("이메일전송 해보자");
      
      String password = CommonUtils.getRandomPassword();
      System.out.println("초기화된 비밀번호:" + password);
      
      memberService.resetPassword(email, password);
    
      try {
    	  
          MimeMessage message = mailSender.createMimeMessage();
          
          MimeMessageHelper messageHelper = 
                new MimeMessageHelper(message, true, "UTF-8");
          
          messageHelper.setFrom("Lightbrary");		//보내는 사람, 생략시 오류발생
          messageHelper.setTo(email);			//받는 사람
          messageHelper.setSubject("요청하신 비밀번호입니다."); //제목
          messageHelper.setText("회원님의 비밀번호는 " + password + "입니다.");
          
          mailSender.send(message);
        
      } catch (Exception e) {
         // TODO: handle exception
         System.out.println(e);
      }
      
      MemberDto sessionMemberDto 
		= (MemberDto)session.getAttribute("member");
      
      if (sessionMemberDto == null) {
    	  return "redirect:/login.do";
      } else {
    	  int no = memberService.findMemberNo(email);
    	  
    	  return "redirect:/auth/update.do?no="+no;	
		}

    }




}
