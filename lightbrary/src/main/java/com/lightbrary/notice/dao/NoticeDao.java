package com.lightbrary.notice.dao;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lightbrary.bookCategory.model.BookCategoryDto;
import com.lightbrary.notice.model.NoticeCategoryDto;

public interface NoticeDao {

	public List<NoticeCategoryDto> selectMainNotice(String searchOption, 
			String keyword, int start, int end);
	
	public List<NoticeCategoryDto> selectAllNotice();
	
	public List<NoticeCategoryDto> selectNotice();
	
	public List<NoticeCategoryDto> selectClosedNotice();
	
	public List<NoticeCategoryDto> selectEventNotice();
	
	public int deleteNotice(int no);
	
	public NoticeCategoryDto selectOneNotice(int no);
	
	public void insertOneNotice(NoticeCategoryDto noticeDto);
	
	public List<NoticeCategoryDto> selectNoticeCategory();
	
	public void updateOneNotice(NoticeCategoryDto noticeDto);
	
	public int selectTotalCountNotice(String searchOption
			, String keyword);
	
	public int selectCurPageNotice(String searchOption
			, String keyword, int no);
	
	public NoticeCategoryDto selectNextNotice(int no);
	
}

