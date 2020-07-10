package com.lightbrary.notice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
	public List<NoticeCategoryDto> selectMainNotice(String searchOption, 
			String keyword, int start, int end, int categoryCode) {
		// TODO Auto-generated method stub
		List<NoticeCategoryDto> noticeList = noticeDao.selectMainNotice(searchOption,
				keyword, start, end, categoryCode);
		
		return noticeList;
	}

	@Override
	public List<NoticeCategoryDto> selectAllNotice() {
		// TODO Auto-generated method stub
		List<NoticeCategoryDto> noticeList = noticeDao.selectAllNotice();
		return noticeList;
	}

	@Override
	public List<NoticeCategoryDto> selectNotice() {
		// TODO Auto-generated method stub
		List<NoticeCategoryDto> noticeList = noticeDao.selectNotice();
		return noticeList;
	}

	@Override
	public List<NoticeCategoryDto> selectClosedNotice() {
		// TODO Auto-generated method stub
		List<NoticeCategoryDto> noticeList = noticeDao.selectClosedNotice();
		return noticeList;
	}

	@Override
	public List<NoticeCategoryDto> selectEventNotice() {
		// TODO Auto-generated method stub
		List<NoticeCategoryDto> noticeList = noticeDao.selectEventNotice();
		return noticeList;
	}

	@Override
	public int deleteNotice(int no) {
		// TODO Auto-generated method stub
		return noticeDao.deleteNotice(no);
	}

	@Override
	public NoticeCategoryDto selectOneNotice(int no) {
		// TODO Auto-generated method stub
		return noticeDao.selectOneNotice(no);
	}

	@Override
	public void insertOneNotice(NoticeDto noticeDto) {
		// TODO Auto-generated method stub
		noticeDao.insertOneNotice(noticeDto);
	}

	@Override
	public JSONArray mkJson() {
		// TODO Auto-generated method stub
		List<NoticeCategoryDto> noticeCategoryDtoList = noticeDao.selectNoticeCategory();
		
		//map형식
		JSONObject inner = null;
		JSONArray outer = new JSONArray();
								//inner
		for (NoticeCategoryDto noticeDto : noticeCategoryDtoList) {
			inner = new JSONObject();
			
			inner.put("code", noticeDto.getCode());
			inner.put("name", noticeDto.getName());
			inner.put("scheduleFlag", noticeDto.getScheduleFlag());
			
			outer.add(inner);
		}
		
		return outer;
	}

	@Override
	public void updateOneNotice(NoticeCategoryDto noticeDto) {
		// TODO Auto-generated method stub
		noticeDao.updateOneNotice(noticeDto);
	}

	@Override
	public int selectTotalCountNotice(String searchOption
			, String keyword, int categoryCode) {
		// TODO Auto-generated method stub
		return noticeDao.selectTotalCountNotice(searchOption, keyword, categoryCode);
	}

	@Override
	public int selectCurPageNotice(String searchOption, String keyword, int no, int categoryCode) {
		// TODO Auto-generated method stub
		return noticeDao.selectCurPageNotice(searchOption, keyword, no, categoryCode);
	}

	@Override
	public NoticeCategoryDto selectNextNotice(int no) {
		// TODO Auto-generated method stub
		return noticeDao.selectNextNotice(no);
	}

	@Override
	public int selectTotalNo(int no) {
		// TODO Auto-generated method stub
		return noticeDao.selectTotalNo(no);
	}

	

//	@Override
//	public Map<String, Object> selectOneNotice(int no) {
//		// TODO Auto-generated method stub
//		
//		Map<String, Object> resultMap = new HashMap<String, Object>();
//		
//		NoticeDao noticeDto = (NoticeDao) noticeDao.selectOneNotice(no);
//		
//		resultMap.put("noticeDto", noticeDto);
//		
//		return resultMap;
//	}
		

	

}

		
		
	
	
	
	

