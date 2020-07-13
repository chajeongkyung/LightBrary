package com.lightbrary.main;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lightbrary.book.model.BookDto;
import com.lightbrary.book.service.BookService;
import com.lightbrary.notice.model.NoticeCategoryDto;
import com.lightbrary.notice.model.NoticeDto;
import com.lightbrary.notice.service.NoticeService;

@Controller
public class MainController {

	private static final Logger log = LoggerFactory.getLogger(MainController.class);

	@Autowired
	private BookService bookService;
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value="/main.do")
	public String Main(Model model) {
		
		List<BookDto> bookDtoList = bookService.selectRankTenBook();
		List<NoticeDto> noticeDtoList = noticeService.mainNotice();
		
		model.addAttribute("bookDtoList", bookDtoList);
		model.addAttribute("noticeDtoList", noticeDtoList);
		
		return "MainView";
	}
}
