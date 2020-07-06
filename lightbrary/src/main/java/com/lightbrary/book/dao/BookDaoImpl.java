package com.lightbrary.book.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lightbrary.book.model.BookDto;
import com.lightbrary.book.model.BookImageDto;
import com.lightbrary.book.model.BookListParamDto;


@Repository
public class BookDaoImpl implements BookDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.lightbrary.book.";
	
	@Override
	public BookDto selectOneBook(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "selectOneBook", no); 
	}

	@Override
	public List<BookDto> selectBook(BookListParamDto bookListParamDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "selectBook", bookListParamDto);
	}

	@Override
	public int insertOneBook(BookDto bookDto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + "insertOneBook", bookDto);
	}

	@Override
	public int[] insertBookBatch(List<BookDto> bookDtoList) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateOneBook(BookDto bookDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "updateOneBook", bookDto);
	}

	@Override
	public int[] updateBookBatch(List<BookDto> bookDtoList) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteOneBook(int no) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "deleteOneBook", no);
	}

	@Override
	public int[] deleteBookBatch(List<BookDto> bookDtoList) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int totalCountBook(BookListParamDto bookListParamDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "totalCountBook", bookListParamDto);
	}

	@Override
	public BookImageDto selectOneImage(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "selectOneImage", no);
	}

	@Override
	public int insertOneImage(BookImageDto bookImageDto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + "insertOneImage", bookImageDto);
	}

}
