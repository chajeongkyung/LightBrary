package com.lightbrary.notice.service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;

import com.lightbrary.notice.model.NoticeCategoryDto;

public interface NoticeService {

	public List<NoticeCategoryDto> selectMainNotice(String searchOption, 
			String keyword, int start, int end);
	
	public List<NoticeCategoryDto> selectAllNotice();
	
	public List<NoticeCategoryDto> selectNotice();
	
	public List<NoticeCategoryDto> selectClosedNotice();
	
	public List<NoticeCategoryDto> selectEventNotice();
	
	public int deleteNotice(int no);
	
	public NoticeCategoryDto selectOneNotice(int no);
	
	public void insertOneNotice(NoticeCategoryDto noticeDto);
	
	public JSONArray mkJson();
	
	public void updateOneNotice(NoticeCategoryDto noticeDto);
	
	public int selectTotalCountNotice(String searchOption
			, String keyword);
	
	public int selectCurPageNotice(String searchOption
			, String keyword, int no);
	
//	public Map preNextDoc(DataEntity param);
	
	public NoticeCategoryDto selectNextNotice(int no);
	
	
	
}
