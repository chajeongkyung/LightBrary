package com.lightbrary.book.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lightbrary.book.model.BookDto;
import com.lightbrary.book.service.BookService;
import com.lightbrary.util.Paging;

@Controller
public class BookController {

	private static final Logger log = 
		LoggerFactory.getLogger(BookController.class);
	
	@Autowired
	private BookService bookService;
	
	@RequestMapping(value = "/book/list.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String BookList(@RequestParam(defaultValue = "1") int curPage
			, @RequestParam(defaultValue = "all") String searchOption
			, @RequestParam(defaultValue = "") String keyword
			, Model model) {
		
		log.info("Called BookList [" + curPage + " : " 
				+ searchOption + " : " + keyword + "]");
		
		int totalCount = bookService.totalCountBook();
		Paging pagingInfo = new Paging(totalCount, curPage);
		int start = pagingInfo.getPageBegin();
		int end = pagingInfo.getPageEnd();
		
		Map<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("start", start);
		paramMap.put("end", end);
		
		List<BookDto> bookDtoList = bookService.selectBook(paramMap);
		
		model.addAttribute("bookDtoList", bookDtoList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "book/BookListView";
	}
}
