package com.lightbrary.bookStatus.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lightbrary.bookStatus.model.BookStatusDto;

@Repository
public class BookStatusDaoImpl implements BookStatusDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.lightbrary.bookStatus.";
	
	@Override
	public List<BookStatusDto> selectBookStatus() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "selectBookStatus");
	}

}
