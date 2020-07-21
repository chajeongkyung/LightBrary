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
	public List<NoticeDto> selectMainNotice(String searchOption, 
			String keyword, int start, int end, int categoryCode) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		map.put("categoryCode", categoryCode);
		
		List<NoticeDto> noticeList = 
				sqlSession.selectList(namespace + "selectMainNotice", map);
		
		return noticeList;
		
	}

	@Override
	public int deleteNotice(int no) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "deleteNotice", no);
	}

	@Override
	public NoticeCategoryDto selectOneNotice(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "selectOneNotice", no);
	}

	@Override
	public void insertOneNotice(NoticeDto noticeDto) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + "insertOneNotice", noticeDto);
	}

	@Override
	public List<NoticeCategoryDto> selectNoticeCategory() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "selectNoticeCategory");
	}

	@Override
	public void updateOneNotice(NoticeCategoryDto noticeDto) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + "updateOneNotice", noticeDto );
	}

	
	@Override
	public int selectTotalCountNotice(String searchOption, String keyword, int categoryCode) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		paramMap.put("categoryCode", categoryCode);
		
		return sqlSession.selectOne(namespace + "selectTotalCountNotice", paramMap);
	}

	@Override
	public int selectCurPageNotice(String searchOption, String keyword, int no, int categoryCode) {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		paramMap.put("no", no);
		paramMap.put("categoryCode", categoryCode);
			
		return sqlSession.selectOne(namespace 
				+ "selectCurPageNotice", paramMap);
	}

	@Override
	public List<NoticeDto> mainNotice() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "mainNotice");
	}

	@Override
	public NoticeCategoryDto nextWriteNotice(String searchOption, 
			String keyword, int categoryCode, int rnum) {

		Map<String, Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("categoryCode", categoryCode);
		map.put("rnum", rnum);
		
		return sqlSession.selectOne(namespace + "nextWriteNotice", map);
	}

	@Override
	public NoticeCategoryDto previousWriteNotice(String searchOption, String keyword,
				int categoryCode, int rnum) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("categoryCode", categoryCode);
		map.put("rnum", rnum);
		
		return sqlSession.selectOne(namespace + "previousWriteNotice", map);
	}

}
