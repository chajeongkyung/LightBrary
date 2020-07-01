package com.lightbrary.bookStatus.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lightbrary.book.controller.BookController;
import com.lightbrary.book.service.BookService;
import com.lightbrary.bookStatus.service.BookStatusService;

@Controller
public class BookStatusController {
	private static final Logger log = 
			LoggerFactory.getLogger(BookController.class);
	
	@Autowired
	private BookStatusService bookStatusService;
	
	@RequestMapping(value="/book/status.do", method = RequestMethod.POST, 
			produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String bookStatusJson() {
		log.info("Called bookStatusJson");
		return bookStatusService.mkJson().toJSONString();
	}
}
