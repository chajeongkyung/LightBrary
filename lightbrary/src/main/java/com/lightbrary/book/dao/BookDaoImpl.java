package com.lightbrary.book.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lightbrary.book.model.BookDto;


@Repository
public class BookDaoImpl implements BookDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.lightbrary.book.";
	
	@Override
	public BookDto selectOneBook(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "selectBook", no); 
	}

	@Override
	public List<BookDto> selectBook(Map<String, Integer> paramMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "selectBook", paramMap);
	}

	@Override
	public int insertOneBook(BookDto bookDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int[] insertBookBatch(List<BookDto> bookDtoList) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateOneBook(BookDto bookDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int[] updateBookBatch(List<BookDto> bookDtoList) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteOneBook(BookDto bookDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int[] deleteBookBatch(List<BookDto> bookDtoList) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int totalCountBook() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "totalCountBook");
	}

}
