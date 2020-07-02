package com.lightbrary.book.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lightbrary.book.model.BookDto;
import com.lightbrary.book.model.BookListParamDto;
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
			, BookListParamDto bookListParamDto
			, Model model) {
		
		log.info(bookListParamDto.getName() + "-------------------------------------");
		
		log.info("Called BookList [curPage: " + curPage
//				+ ", name: " + name
				+ "]");
		
		bookListParamDto.initBookListParamDto();
		
		int totalCount = bookService.totalCountBook(bookListParamDto);
		Paging pagingInfo = new Paging(totalCount, curPage);
		
		bookListParamDto.setCurPage(curPage);
		bookListParamDto.setStartPage(pagingInfo.getPageBegin());
		bookListParamDto.setEndPage(pagingInfo.getPageEnd());
		
//		Map<String, Integer> pagingParamMap = new HashMap<String, Integer>();
//		pagingParamMap.put("start", start);
//		pagingParamMap.put("end", end);
		
		List<BookDto> bookDtoList = bookService.selectBook(bookListParamDto);
		
		model.addAttribute("bookDtoList", bookDtoList);
		model.addAttribute("bookListParamDto", bookListParamDto);
		model.addAttribute("pagingInfo", pagingInfo);
		return "book/BookListView";
	}
	
	@RequestMapping(value = "/book/detail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String BookDetail(int no, BookListParamDto bookListParamDto
			, Model model) {
		
		BookDto bookDto = bookService.selectOneBook(no);
		
		model.addAttribute("bookDto", bookDto);
		model.addAttribute("bookListParamDto", bookListParamDto);
		
		return "book/BookDetailView";
	}
	
	@RequestMapping(value = "/book/insert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String BookInsertOne() {
		
		return "book/BookInsertView";
	}
	
	@RequestMapping(value = "/book/insertCtr.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String BookInsertOne(BookDto bookDto, MultipartHttpServletRequest request
			, String bookCategory1, String bookCategory2, String bookCategory3) {
		
		String categoryCode = "";
		
		if(bookCategory3 != null) {
			categoryCode = bookCategory3;
		}else if(bookCategory2 != null) {
			categoryCode = bookCategory2;
		}else {
			categoryCode = bookCategory1;
		}
		
		bookDto.setCategoryCode(categoryCode);
		System.out.println(bookDto);
		bookService.insertOneBook(bookDto, request);
		
		return "book/BookInsertView";
	}
}
