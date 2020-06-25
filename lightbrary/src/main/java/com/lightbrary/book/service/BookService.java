package com.lightbrary.book.service;

import java.util.List;
import java.util.Map;

import com.lightbrary.book.model.BookDto;

public interface BookService {
	public List<BookDto> selectBook(Map<String, Integer> paramMap);
	public int totalCountBook();
}
