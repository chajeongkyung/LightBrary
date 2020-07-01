package com.lightbrary.bookStatus.dao;

import java.util.List;

import com.lightbrary.bookStatus.model.BookStatusDto;

public interface BookStatusDao {
	public List<BookStatusDto> selectBookStatus();
}
