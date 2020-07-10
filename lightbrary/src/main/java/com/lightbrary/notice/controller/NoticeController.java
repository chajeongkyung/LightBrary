package com.lightbrary.notice.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lightbrary.notice.model.NoticeCategoryDto;
import com.lightbrary.notice.model.NoticeDto;
import com.lightbrary.notice.service.NoticeService;
import com.lightbrary.util.Paging;

@Controller
public class NoticeController {

	private static final Logger log = 
		LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	//종류 선택박스
	@RequestMapping(value="/notice/category.do", method = RequestMethod.POST, 
			produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String noticeCategoryJson() {
		log.info("Called noticeCategoryJson");
		return noticeService.mkJson().toJSONString();
	}
	
	
	@RequestMapping(value="/notice/deleteBatch.do", method = RequestMethod.POST, 
			produces="text/plain;charset=UTF-8")
	@ResponseBody
	public void noticeDeleteBatch(int[] noArr) {
		log.info("Called noticeDeleteBatch");

		for (int no : noArr) {
			noticeService.deleteNotice(no);
		}
	}
	
	@RequestMapping(value = "/NoticeBoard.do", method = RequestMethod.GET)
	public String common() {
		log.info("기본 템플릿");
		
		System.out.println("공지컨트롤러");
		return "notice/NoticeBoard";
	}

	@RequestMapping(value = "/notice/list.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String NoticeBoardList(@RequestParam(defaultValue = "1") 
			int curPage
			, @RequestParam(defaultValue = "0") int no
			, @RequestParam(defaultValue = "all") String searchOption
			, @RequestParam(defaultValue = "") String keyword
			, @RequestParam(defaultValue = "-1") int categoryCode 
			, Model model) { 
		System.out.println("---------------------------------");
		System.out.println("---------------------------------");
		System.out.println(categoryCode);
		System.out.println("---------------------------------");
		System.out.println("---------------------------------");
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy/MM/dd HH:mm");
				
		Date time = new Date();
				
		String formattedDate = format.format(time);
		
		int totalCount = noticeService.selectTotalCountNotice(searchOption, keyword, categoryCode);
		
		if(no != 0) {
			curPage 
				= noticeService.selectCurPageNotice(searchOption, keyword, no, categoryCode);
		}
		
		HashMap<String, Object> searchMap 
		= new HashMap<String, Object>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);		
		searchMap.put("categoryCode", categoryCode);		
		
		Paging pagingInfo = new Paging(totalCount, curPage);
		
		int start = pagingInfo .getPageBegin();
		int end = pagingInfo .getPageEnd();
		
		List<NoticeCategoryDto> noticeList = noticeService.selectMainNotice(searchOption, keyword, start, end, categoryCode);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("searchMap", searchMap);
		
		System.out.println(pagingInfo);
		
		return "notice/NoticeBoardMain";
	}
	
	@RequestMapping(value = "/notice/add.do", method = RequestMethod.GET)
	public String NoticeAdd() {
		
		log.info("call NoticeAdd!");
		
		return "notice/NoticeForm";
	}
	
	@RequestMapping(value = "/notice/addCtr.do"
			, method = RequestMethod.POST)
		public String NoticeAdd2(NoticeDto noticeDto) {
			log.info("call memberAdd_ctr! {}", noticeDto);
			System.out.println("add");
			noticeService.insertOneNotice(noticeDto);
			
			return "redirect:/notice/list.do";
		}
	
//	@RequestMapping(value = "/notice/MainList.do", method = RequestMethod.GET)
//	public String NoticeBoardAll(Locale locale, Model model) {
//		
//		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy.MM.dd HH:mm");
//				
//		Date time = new Date();
//				
//		String formattedDate = format1.format(time);
//		
//		List<NoticeCategoryDto> noticeList = noticeService.selectMainNotice();
//		
//		model.addAttribute("serverTime", formattedDate);
//		model.addAttribute("noticeList", noticeList);
//		
//		System.out.println("확인1");
//		
//		return "notice/NoticeBoardTest";
//	}
	
	//공지만 조회
	@RequestMapping(value = "/notice/noticeList.do", method = RequestMethod.GET)
	public String NoticeBoardNotice(Model model) {
		
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy/MM/dd HH:mm");
				
		Date time = new Date();
				
		String formattedDate = format.format(time);
		
		List<NoticeCategoryDto> noticeList = noticeService.selectNotice();
		
		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("noticeList", noticeList);
		
		System.out.println("확인1");
		
		return "notice/NoticeBoardMain";
	}
	
	//휴관만 조회
	@RequestMapping(value = "/notice/closedList.do", method = RequestMethod.GET)
	public String NoticeBoardClosed(Model model) {
		
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy/MM/dd HH:mm");
				
		Date time = new Date();
				
		String formattedDate = format.format(time);
		
		List<NoticeCategoryDto> noticeList = noticeService.selectClosedNotice();
		
		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("noticeList", noticeList);
		
		System.out.println("확인1");
		
		return "notice/NoticeBoardMain";
	}
	
	@RequestMapping(value = "/notice/eventList.do", method = RequestMethod.GET)
	public String NoticeBoardEvent(Model model) {
		
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy/MM/dd HH:mm");
				
		Date time = new Date();
				
		String formattedDate = format.format(time);
		
		List<NoticeCategoryDto> noticeList = noticeService.selectEventNotice();
		
		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("noticeList", noticeList);
		
		System.out.println("확인1");
		
		return "notice/NoticeBoardMain";
	}
	
	@RequestMapping(value = "/notice/deleteCtr.do", method = RequestMethod.GET)
	public String NoticeBoardDelete(int no) {
		
		noticeService.deleteNotice(no);
		
		return "redirect:/notice/list.do";
	}
							 
	@RequestMapping(value = "/notice/detailList.do", method = RequestMethod.GET)
	public String NoticeBoardDetail(String keyword, String searchOption, Locale locale, Model model, int no) {
		
		System.out.println(keyword);
		System.out.println(searchOption);
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy/MM/dd HH:mm");
		
		Date time = new Date();
				
		String formattedDate = format1.format(time);
		
//		int totalCount = noticeService.selectTotalCountNotice(searchOption, keyword);
		
		int totalNo = noticeService.selectTotalNo(no);
		
		NoticeCategoryDto noticeDto = noticeService.selectOneNotice(no);
		
		model.addAttribute("noticeDto", noticeDto);
		
		model.addAttribute("serverTime", formattedDate);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("totalNo", totalNo);
//		model.addAttribute("totalCount", totalCount);
		
		return "/notice/NoticeBoardDetail";
		
//		MemberDto memberDto = memberService.memberSelectOne(no);
//		
//		model.addAttribute("memberDto", memberDto);
//		
//		return "member/MemberUpdateForm";
		
		//글 자세히 보기 요청 처리
//		@RequestMapping("/cafe/detail")
//		public String detail(HttpServletRequest request){
//			service.getDetail(request);
//			//view page 로 forward 이동해서 글 자세히 보기 
//			return "cafe/detail";
//		}
		
	}
	
	
	@RequestMapping(value = "/notice/update.do", method = RequestMethod.GET)
	public String NoticeUpdate(int no, Model model, NoticeCategoryDto noticeDto ) {
		log.info("call memberUpdate! {}");
		
		noticeDto = noticeService.selectOneNotice(no);
		
		model.addAttribute("noticeDto", noticeDto);
		
		return "/notice/NoticeUpdateForm";
	}
	
	
	@RequestMapping(value = "/notice/updateCtr.do", method = RequestMethod.POST)
	public String NoticeUpdateOne(Model model, NoticeCategoryDto noticeDto ) {
		log.info("call noticeUpdate! {}");
		System.out.println("컨트롤러");
		System.out.println(noticeDto);
		
		noticeService.updateOneNotice(noticeDto);
		
		return "redirect:/notice/list.do";
	}
	

//	@RequestMapping(value = "/preNextDoc")
//	public @ResponseBody Map preNextDoc(HttpServletRequest req, DataEntity param) { 
//		// TODO //파라미터 체크 생략
//		Map result = new HashMap(); 
//		//권한처리 생략 
//		result = noticeService.preNextDoc(param);
//		return result; 
//		
//	}
	
	
	@RequestMapping(value = "/notice/nextBorad.do", method = RequestMethod.GET)
	public String NoticeNextBoard(int no, Model model, NoticeCategoryDto noticeDto ) {
		log.info("call memberUpdate! {}");
		
		noticeDto = noticeService.selectOneNotice(no);
		
		model.addAttribute("noticeDto", noticeDto);
		
		return "/notice/NoticeUpdateForm";
	}
	
		
	
}
