package com.lightbrary.book.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lightbrary.book.dao.BookDao;
import com.lightbrary.book.model.BookDto;
import com.lightbrary.book.model.BookImageDto;
import com.lightbrary.book.model.BookListParamDto;

@Service
public class BookServiceImpl implements BookService{

	private static final Logger log = 
			LoggerFactory.getLogger(BookServiceImpl.class);

	@Autowired
	public BookDao bookDao;
	
	@Override
	public List<BookDto> selectBook(BookListParamDto bookListParamDto) {
		// TODO Auto-generated method stub
		return bookDao.selectBook(bookListParamDto);
	}

	@Override
	public int totalCountBook(BookListParamDto bookListParamDto) {
		// TODO Auto-generated method stub
		return bookDao.totalCountBook(bookListParamDto);
	}

	@Override
	public BookDto selectOneBook(int no) {
		// TODO Auto-generated method stub
		return bookDao.selectOneBook(no);
	}

	@Override
	public BookImageDto selectOneImage(int no) {
		// TODO Auto-generated method stub
		return bookDao.selectOneImage(no);
	}
	

}
