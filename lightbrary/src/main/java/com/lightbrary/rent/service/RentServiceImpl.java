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

	// 대출 목록 출력
	@Override
	public List<RentDto> selectRent(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		List<RentDto> reserveList = 
				rentDao.selectRent(searchOption, keyword
					, start, end);
		
		return reserveList;
	}

	// 대출 목록 총 갯수
	@Override
	public int totalCountRent(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return rentDao.totalCountRent(searchOption
				, keyword);
	}

	// 대출 목록 현재 페이지
	@Override
	public int selectRentCurPage(String searchOption, String keyword, int no) {
		// TODO Auto-generated method stub
		return rentDao.selectRentCurPage(searchOption, keyword, no);
	}
	
	// 대출 상세
	@Override
	public RentDto selectOneRent(int no) {
		// TODO Auto-generated method stub
		
		return rentDao.selectOneRent(no);
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

	// 예약 상세에서 상태 변경
	@Override
	public int updateOneReserveStatus(RentDto rentDto) {
		// TODO Auto-generated method stub
		return rentDao.updateOneReserveStatus(rentDto);
	}
	
}
