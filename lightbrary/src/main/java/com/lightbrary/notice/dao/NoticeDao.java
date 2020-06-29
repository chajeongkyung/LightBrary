package com.lightbrary.notice.dao;

import java.util.List;

import com.lightbrary.notice.model.NoticeCategoryDto;

public interface NoticeDao {

	public List<NoticeCategoryDto> noticeSelectList();
	
}

