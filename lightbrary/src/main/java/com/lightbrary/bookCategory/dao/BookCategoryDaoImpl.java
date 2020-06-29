package com.lightbrary.bookCategory.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lightbrary.bookCategory.model.BookCategoryDto;

@Repository
public class BookCategoryDaoImpl implements BookCategoryDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.lightbrary.bookCategory.";

	@Override
	public List<BookCategoryDto> selectBookCategory() {
		
		return sqlSession.selectList(namespace + "selectBookCategory");
	}

}
