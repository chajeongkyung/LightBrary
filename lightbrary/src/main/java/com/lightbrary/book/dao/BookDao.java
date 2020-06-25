package com.lightbrary.book.dao;

import java.util.List;
import java.util.Map;

import com.lightbrary.book.model.BookDto;

public interface BookDao {

	public BookDto selectOneBook(int no);
	public List<BookDto> selectBook(Map<String, Integer> paramMap);
	
	public int insertOneBook(BookDto bookDto);
	public int[] insertBookBatch(List<BookDto> bookDtoList);
	
	public int updateOneBook(BookDto bookDto);
	public int[] updateBookBatch(List<BookDto> bookDtoList);
	
	public int deleteOneBook(BookDto bookDto);
	public int[] deleteBookBatch(List<BookDto> bookDtoList);
	
	public int totalCountBook();
	
}

