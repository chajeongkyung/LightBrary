package com.lightbrary.notice.service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;

import com.lightbrary.notice.model.NoticeCategoryDto;
import com.lightbrary.notice.model.NoticeDto;

public interface NoticeService {

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
	
	public JSONArray mkJson();
	
	public void updateOneNotice(NoticeCategoryDto noticeDto);
	
	public int selectTotalCountNotice(String searchOption
			, String keyword, int categoryCode);
	
	public int selectCurPageNotice(String searchOption
			, String keyword, int no, int categoryCode);
	
}
