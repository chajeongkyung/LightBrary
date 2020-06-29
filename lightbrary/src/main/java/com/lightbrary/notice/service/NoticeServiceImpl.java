package com.lightbrary.notice.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lightbrary.notice.dao.NoticeDao;
import com.lightbrary.notice.model.NoticeCategoryDto;
import com.lightbrary.notice.model.NoticeDto;

@Service
public class NoticeServiceImpl implements NoticeService{

	private static final Logger log = 
			LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	@Autowired
	public NoticeDao noticeDao;
	
	
	@Override
	public List<NoticeCategoryDto> noticeSelectList() {
		// TODO Auto-generated method stub
		
		List<NoticeCategoryDto> noticeList = noticeDao.noticeSelectList();
		System.out.println("확인 3");
		return noticeList;
	
	}
	
}
