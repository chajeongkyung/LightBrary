package com.lightbrary.notice.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lightbrary.notice.model.NoticeCategoryDto;
import com.lightbrary.notice.model.NoticeDto;
import com.lightbrary.notice.service.NoticeService;
import com.lightbrary.util.Paging;
import com.lightbrary.util.interceptor.Auth;
import com.lightbrary.util.interceptor.Auth.Role;

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
	
	@Auth(role = Role.ADMIN)
	@RequestMapping(value="/notice/deleteBatch.do", method = RequestMethod.POST, 
			produces="text/plain;charset=UTF-8")
	@ResponseBody
	public void noticeDeleteBatch(int[] noArr) {
		log.info("Called noticeDeleteBatch");

		for (int no : noArr) {
			noticeService.deleteNotice(no);
		}
	}

	@Auth(role = Role.USER)
	@RequestMapping(value = "/notice/list.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String NoticeBoardList(@RequestParam(defaultValue = "1") 
			int curPage
			, @RequestParam(defaultValue = "0") int no
			, @RequestParam(defaultValue = "all") String searchOption
			, @RequestParam(defaultValue = "") String keyword
			, @RequestParam(defaultValue = "-1") int categoryCode 
			, Model model) { 
		
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
		
		int start = pagingInfo.getPageBegin();
		int end = pagingInfo.getPageEnd();
		
		List<NoticeDto> noticeList = noticeService.selectMainNotice(searchOption, keyword, start, end, categoryCode);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("searchMap", searchMap);
		
		return "notice/NoticeBoardMain";
		
		
	}
	
	@Auth(role = Role.ADMIN)
	@RequestMapping(value = "/notice/add.do", method = RequestMethod.GET)
	public String NoticeAdd() {
		
		log.info("call NoticeAdd!");
		
		return "notice/NoticeForm";
	}
	
	@Auth(role = Role.ADMIN)
	@RequestMapping(value = "/notice/addCtr.do"
			, method = RequestMethod.POST)
		public String NoticeAdd2(NoticeDto noticeDto) {
			log.info("call noticeAddCtr! {}", noticeDto);
			System.out.println("add");
			noticeService.insertOneNotice(noticeDto);
			
			return "redirect:/notice/list.do";
		}
	
	@Auth(role = Role.ADMIN)
	@RequestMapping(value = "/notice/deleteCtr.do", method = RequestMethod.GET)
	public String NoticeBoardDelete(int no) {
		
		noticeService.deleteNotice(no);
		
		return "redirect:/notice/list.do";
	}
	
	@Auth(role = Role.USER)
	@RequestMapping(value = "/notice/detailList.do", method = RequestMethod.GET)
	public String NoticeBoardDetail(Locale locale, Model model
			, @RequestParam(defaultValue = "all") String searchOption
			, @RequestParam(defaultValue = "") String keyword 
			, @RequestParam(defaultValue = "-1") int categoryCode
			, int rnum, int no) {
		
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy/MM/dd HH:mm");
		
		Date time = new Date();
				
		String formattedDate = format.format(time);
		
		NoticeCategoryDto noticeDto = noticeService.selectOneNotice(no);
		int totalCount = noticeService.selectTotalCountNotice(searchOption, keyword, categoryCode);
			
		model.addAttribute("noticeDto", noticeDto);
		model.addAttribute("serverTime", formattedDate);	
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("categoryCode", categoryCode);
		model.addAttribute("rnum", rnum);		
		model.addAttribute("maxRnum", totalCount);
		
		return "/notice/NoticeBoardDetail";

	}
	
	@Auth(role = Role.ADMIN)
	@RequestMapping(value = "/notice/update.do", method = RequestMethod.GET)
	public String NoticeUpdate(int no, Model model, NoticeCategoryDto noticeDto ) {
		log.info("call noticeUpdate! {}");
		
		noticeDto = noticeService.selectOneNotice(no);
		
		model.addAttribute("noticeDto", noticeDto);
		
		return "/notice/NoticeUpdateForm";
	}
	
	@Auth(role = Role.ADMIN)
	@RequestMapping(value = "/notice/updateCtr.do", method = RequestMethod.POST)
	public String NoticeUpdateOne(Model model, NoticeCategoryDto noticeDto ) {
		log.info("call noticeUpdateCtr! {}");
		System.out.println("컨트롤러");
		System.out.println(noticeDto);
		
		noticeService.updateOneNotice(noticeDto);
		
		return "redirect:/notice/list.do";
	}
	
	@Auth(role = Role.USER)
	@RequestMapping(value = "/notice/nextPage.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String NoticeNextBoard(Model model, String searchOption,
			String keyword, int categoryCode, int rnum) {
		
		log.info("call nextPage! {}");
		
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy/MM/dd HH:mm");
		
		Date time = new Date();
				
		String formattedDate = format.format(time);
		
		NoticeCategoryDto noticeDto = noticeService.nextWriteNotice(searchOption, keyword, categoryCode, rnum);
		int maxRnum = noticeService.selectTotalCountNotice(searchOption, keyword, categoryCode);
		
		model.addAttribute("noticeDto", noticeDto);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		model.addAttribute("categoryCode", categoryCode);
		model.addAttribute("rnum", noticeDto.getRnum());
		model.addAttribute("maxRnum", maxRnum);
		model.addAttribute("serverTime", formattedDate);
		
		return "/notice/NoticeBoardDetail";
	}
	
	@Auth(role = Role.USER)
	@RequestMapping(value = "/notice/previousPage.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String NoticePreviousBoard(Model model, String searchOption,
			String keyword, int categoryCode, int rnum) {
		
		log.info("call previousPage! {}");
		
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy/MM/dd HH:mm");
		
		Date time = new Date();
				
		String formattedDate = format.format(time);
		
		NoticeCategoryDto noticeDto = noticeService.previousWriteNotice(searchOption, keyword, categoryCode, rnum);
		int maxRnum = noticeService.selectTotalCountNotice(searchOption, keyword, categoryCode);
		
		model.addAttribute("noticeDto", noticeDto);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		model.addAttribute("categoryCode", categoryCode);
		model.addAttribute("rnum", noticeDto.getRnum());
		model.addAttribute("maxRnum", maxRnum);
		model.addAttribute("serverTime", formattedDate);
		
		return "/notice/NoticeBoardDetail";
	}
	
		
}
