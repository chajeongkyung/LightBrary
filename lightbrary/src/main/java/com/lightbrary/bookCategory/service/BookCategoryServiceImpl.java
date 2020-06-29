package com.lightbrary.bookCategory.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lightbrary.book.service.BookServiceImpl;
import com.lightbrary.bookCategory.dao.BookCategoryDao;
import com.lightbrary.bookCategory.model.BookCategoryDto;

@Service
public class BookCategoryServiceImpl implements BookCategoryService{
	
	private static final Logger log = 
			LoggerFactory.getLogger(BookServiceImpl.class);
	
	@Autowired
	public BookCategoryDao bookCategoryDao;
	
	@Override
	public JSONArray mkJson() {
		// TODO Auto-generated method stub
		List<BookCategoryDto> bookCategoryDtoList = bookCategoryDao.selectBookCategory();
		
		JSONObject inner = null;
		JSONArray outer = new JSONArray();
		
		for (BookCategoryDto bookCategoryDto : bookCategoryDtoList) {
			inner = new JSONObject();
			
			inner.put("code", bookCategoryDto.getCode());
			inner.put("depth", bookCategoryDto.getDepth());
			inner.put("name", bookCategoryDto.getName());
			
			outer.add(inner);
		}
		
		return outer;
	}

}
