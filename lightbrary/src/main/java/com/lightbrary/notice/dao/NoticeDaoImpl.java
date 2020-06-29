package com.lightbrary.notice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lightbrary.notice.model.NoticeCategoryDto;
import com.lightbrary.notice.model.NoticeDto;


@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.lightbrary.notice.";
	
	@Override
	public List<NoticeCategoryDto> noticeSelectList() {
		// TODO Auto-generated method stub
		
//		Map<String, Object> map = new HashMap<>();
//		map.put("start", start);
//		map.put("end", end);
		
		List<NoticeCategoryDto> noticeList = 
				sqlSession.selectList(namespace + "noticeSelectList");
		System.out.println("확인2");
		return noticeList;
	
	}
	

}
