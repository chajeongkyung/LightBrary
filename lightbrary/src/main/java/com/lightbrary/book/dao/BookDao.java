package com.lightbrary.book.dao;

import java.util.List;
import java.util.Map;

import com.lightbrary.book.model.BookDto;
import com.lightbrary.book.model.BookImageDto;
import com.lightbrary.book.model.BookListParamDto;

public interface BookDao {

	public BookDto selectOneBook(int no);
	public List<BookDto> selectBook(BookListParamDto bookListParamDto);
	
	public int insertOneBook(BookDto bookDto);
	public int[] insertBookBatch(List<BookDto> bookDtoList);
	
	public int updateOneBook(BookDto bookDto);
	public int[] updateBookBatch(List<BookDto> bookDtoList);
	
	public int deleteOneBook(int no);
	public int[] deleteBookBatch(List<BookDto> bookDtoList);
	
	public int totalCountBook(BookListParamDto bookListParamDto);
	public BookImageDto selectOneImage(int no);
	public int insertOneImage(BookImageDto bookImageDto);
	
}

