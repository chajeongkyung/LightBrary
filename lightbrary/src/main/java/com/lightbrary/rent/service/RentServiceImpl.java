package com.lightbrary.rent.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lightbrary.rent.dao.RentDao;
import com.lightbrary.rent.model.RentDto;

@Service
public class RentServiceImpl implements RentService{
	
	@Autowired
	public RentDao rentDao;

	private static final Logger log = 
			LoggerFactory.getLogger(RentServiceImpl.class);
	
	/*******************
			대출
	*******************/

	// 대출
	@Override
	public List<RentDto> rentSelectList(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		List<RentDto> rentList = 
				rentDao.rentSelectList(searchOption, keyword
					, start, end);
		
		return rentList;
	}

	@Override
	public int rentSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return rentDao.rentSelectTotalCount(searchOption
				, keyword);
	}

	@Override
	public int rentSelectCurPage(String searchOption, String keyword, int no) {
		// TODO Auto-generated method stub
		return rentDao.rentSelectCurPage(searchOption, keyword, no);
	}
	
	
	/*******************
			예약
	*******************/
	
	// 예약 목록 출력
	@Override
	public List<RentDto> selectReserve(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		List<RentDto> reserveList = 
				rentDao.selectReserve(searchOption, keyword
					, start, end);
		
		return reserveList;
	}

	// 예약 목록 총 갯수
	@Override
	public int totalCountReserve(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return rentDao.totalCountReserve(searchOption
				, keyword);
	}

	// 예약 목록 현재 페이지
	@Override
	public int selectReserveCurPage(String searchOption, String keyword, int no) {
		// TODO Auto-generated method stub
		return rentDao.selectReserveCurPage(searchOption, keyword, no);
	}

	// 예약 상세
	@Override
	public RentDto selectOneReserve(int no) {
		// TODO Auto-generated method stub
		
		return rentDao.selectOneReserve(no);
	}
	
}
