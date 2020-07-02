package com.lightbrary.book.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lightbrary.book.dao.BookDao;
import com.lightbrary.book.model.BookDto;
import com.lightbrary.book.model.BookImageDto;
import com.lightbrary.book.model.BookListParamDto;
import com.lightbrary.util.FileUtils;

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

	@Override
	public void insertOneBook(BookDto bookDto, MultipartHttpServletRequest request) {
		// TODO Auto-generated method stub
		
		FileUtils fileUtils = new FileUtils();
		
		try {
			BookImageDto bookImageDto = new BookImageDto();
			List<Map<String,Object>> bookImageDtoList = fileUtils.parseInsertFileInfo(request);
			for (Map<String, Object> map : bookImageDtoList) {
				bookImageDto.setOriginalFileName((String) map.get("ORIGINAL_FILE_NAME"));
				bookImageDto.setStoredFileName((String) map.get("STORED_FILE_NAME"));
				bookImageDto.setFileSize((long) map.get("FILE_SIZE"));
				bookImageDto.setCreatedDate((Date) map.get("CREATED_DATE"));
				
				bookDao.insertOneImage(bookImageDto);
				bookDto.setImageNo(bookImageDto.getNo());
				bookDao.insertOneBook(bookDto);
			}
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
