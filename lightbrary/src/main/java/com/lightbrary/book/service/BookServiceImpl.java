package com.lightbrary.book.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lightbrary.book.dao.BookDao;
import com.lightbrary.book.model.BookDto;

@Service
public class BookServiceImpl implements BookService{

	private static final Logger log = 
			LoggerFactory.getLogger(BookServiceImpl.class);

	@Autowired
	public BookDao bookDao;
	
	@Override
	public List<BookDto> selectBook(Map<String, Integer> paramMap) {
		// TODO Auto-generated method stub
		return bookDao.selectBook(paramMap);
	}

	@Override
	public int totalCountBook() {
		// TODO Auto-generated method stub
		return bookDao.totalCountBook();
	}
	

}
