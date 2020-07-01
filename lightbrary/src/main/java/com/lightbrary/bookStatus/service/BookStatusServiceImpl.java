package com.lightbrary.bookStatus.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lightbrary.bookCategory.model.BookCategoryDto;
import com.lightbrary.bookStatus.dao.BookStatusDao;
import com.lightbrary.bookStatus.model.BookStatusDto;

@Service
public class BookStatusServiceImpl implements BookStatusService {

	@Autowired
	public BookStatusDao bookStatusDao;
	
	@Override
	public JSONArray mkJson() {
		// TODO Auto-generated method stub
		List<BookStatusDto> bookStatusDtoList = bookStatusDao.selectBookStatus();
		
		JSONObject inner = null;
		JSONArray outer = new JSONArray();
		
		for (BookStatusDto bookStatusDto : bookStatusDtoList) {
			inner = new JSONObject();
			
			inner.put("code", bookStatusDto.getCode());
			inner.put("name", bookStatusDto.getName());
			
			outer.add(inner);
		}
		
		return outer;
	}

}
