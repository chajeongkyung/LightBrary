package com.lightbrary.bookCategory.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lightbrary.book.controller.BookController;
import com.lightbrary.bookCategory.service.BookCategoryService;

@Controller
public class BookCategoryController {
	private static final Logger log = 
			LoggerFactory.getLogger(BookController.class);
	
	@Autowired
	private BookCategoryService bookCategoryService;
	
	@RequestMapping(value="/book/category.do", method = RequestMethod.POST, 
			produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String bookCategoryJson() {
		log.info("Called bookCategoryJson");
		return bookCategoryService.mkJson().toJSONString();
	}
}
