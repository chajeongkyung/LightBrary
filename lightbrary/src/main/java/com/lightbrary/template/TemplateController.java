package com.lightbrary.template;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TemplateController {

	private static final Logger log = 
		LoggerFactory.getLogger(TemplateController.class);
	
	@RequestMapping(value = "/common.do", method = RequestMethod.GET)
	public String common(HttpSession session, Model model) {
		log.info("기본 템플릿");
		
		
		return "template/common";
	}
	
	@RequestMapping(value = "/pageLayout.do", method = RequestMethod.GET)
	public String pageLayout(HttpSession session, Model model) {
		log.info("도서 관련 목록");
		
		
		return "template/pageLayout";
	}
	
	@RequestMapping(value = "/bookList.do", method = RequestMethod.GET)
	public String bookList(HttpSession session, Model model) {
		log.info("도서 관련 목록");
		
		
		return "template/bookList";
	}
	
	@RequestMapping(value = "/tableList.do", method = RequestMethod.GET)
	public String tableList(HttpSession session, Model model) {
		log.info("테이블 목록");
		
		
		return "template/tableList";
	}
	
	@RequestMapping(value = "/viewPage.do", method = RequestMethod.GET)
	public String viewPage(HttpSession session, Model model) {
		log.info("도서 상세페이지");
		
		
		return "template/viewPage";
	}
	@RequestMapping(value = "/viewPageBoard.do", method = RequestMethod.GET)
	public String viewPageBoard(HttpSession session, Model model) {
		log.info("게시글 상세페이지");
		
		
		return "template/viewPageBoard";
	}
}
