package com.lightbrary.notice.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lightbrary.notice.model.NoticeCategoryDto;
import com.lightbrary.notice.model.NoticeDto;
import com.lightbrary.notice.service.NoticeService;

@Controller
public class NoticeController {

	private static final Logger log = 
		LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	
	@RequestMapping(value = "/NoticeBoard.do", method = RequestMethod.GET)
	public String common(HttpSession session, Model model) {
		log.info("기본 템플릿");
		
		System.out.println("공지컨트롤러");
		return "notice/NoticeBoard";
	}
	
	
	@RequestMapping(value = "/notice/list.do", method = RequestMethod.GET)
	public String NoticeBoardMain(Locale locale, Model model) {
		
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy.MM.dd HH:mm");
				
		Date time = new Date();
				
		String formattedDate = format1.format(time);
		
//		Date date = new Date();
//		
//		DateFormat dateFormat = 
//			DateFormat.getDateTimeInstance(DateFormat.LONG
//					, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
		List<NoticeCategoryDto> noticeList = noticeService.noticeSelectList();
		
		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("noticeList", noticeList);
		
		System.out.println("확인1");
		
		return "notice/NoticeBoardTest";
	}
	
	
	
	
	
	
}
