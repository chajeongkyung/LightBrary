package com.lightbrary.notice.dao;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lightbrary.bookCategory.model.BookCategoryDto;
import com.lightbrary.notice.model.NoticeCategoryDto;
import com.lightbrary.notice.model.NoticeDto;

public interface NoticeDao {

	public List<NoticeDto> selectMainNotice(String searchOption, 
			String keyword, int start, int end, int categoryCode);

	public List<NoticeDto> mainNotice();

	public NoticeCategoryDto nextWriteNotice(String searchOption, 
			String keyword, int categoryCode, int rnum);
	
	public NoticeCategoryDto previousWriteNotice(String searchOption, 
			String keyword, int categoryCode, int rnum);
	
	public int deleteNotice(int no);
	
	public NoticeCategoryDto selectOneNotice(int no);
	
	public void insertOneNotice(NoticeDto noticeDto);
	
	public List<NoticeCategoryDto> selectNoticeCategory();
	
	public void updateOneNotice(NoticeCategoryDto noticeDto);
	
	public int selectTotalCountNotice(String searchOption
			, String keyword, int categoryCode);
	
	public int selectCurPageNotice(String searchOption
			, String keyword, int no, int categoryCode);
	
}

