package com.lightbrary.notice.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	

}
