package com.lightbrary.book.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lightbrary.book.model.BookDto;
import com.lightbrary.book.model.BookImageDto;
import com.lightbrary.book.model.BookListParamDto;

public interface BookService {
	public List<BookDto> selectBook(BookListParamDto bookListParamDto);
	public int totalCountBook(BookListParamDto bookListParamDto);
	public BookDto selectOneBook(int no);
	public BookImageDto selectOneImage(int no);
	public void insertOneBook(BookDto bookDto, MultipartHttpServletRequest request);
	public int deleteOneBook(int no);
	public int updateOneBook(BookDto bookDto, MultipartHttpServletRequest request, int imageStatus);
	public void insertBookBatch(BookDto bookDto, MultipartHttpServletRequest request, int seriesStart, int seriesEnd);
	public List<BookDto> selectRankFiveBook();
}
