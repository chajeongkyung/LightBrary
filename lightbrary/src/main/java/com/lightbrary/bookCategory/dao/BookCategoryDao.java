package com.lightbrary.bookCategory.dao;

import java.util.List;

import com.lightbrary.bookCategory.model.BookCategoryDto;

public interface BookCategoryDao {
	public List<BookCategoryDto> selectBookCategory();
}
