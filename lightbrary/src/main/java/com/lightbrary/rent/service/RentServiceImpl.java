package com.lightbrary.rent.service;

import java.util.List;

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
	public List<RentDto> selectRent(String searchOption, String keyword, int start, int end, String status) {
		// TODO Auto-generated method stub
		List<RentDto> reserveList = rentDao.selectRent(searchOption, keyword, start, end, status);
		
		return reserveList;
	}

	// 대출 목록 총 갯수
	@Override
	public int totalCountRent(String searchOption, String keyword, String status) {
		// TODO Auto-generated method stub
		return rentDao.totalCountRent(searchOption, keyword, status);
	}

	// 대출 목록 현재 페이지
	@Override
	public int selectRentCurPage(String searchOption, String keyword, int no, String status) {
		// TODO Auto-generated method stub
		return rentDao.selectRentCurPage(searchOption, keyword, no, status);
	}
	
	// 대출 상세
	@Override
	public RentDto selectOneRent(int no) {
		// TODO Auto-generated method stub
		
		return rentDao.selectOneRent(no);
	}
	
	// 대출 상세에서 상태 변경
	@Override
	public int updateOneRentStatus(RentDto rentDto) {
		// TODO Auto-generated method stub
		return rentDao.updateOneRentStatus(rentDto);
	}
	
	// 대출 이메일 상태 변경
	@Override
	public int updateSend(int no) {
		// TODO Auto-generated method stub
		return rentDao.updateSend(no);
	}
	
	
	/*******************
			예약
	*******************/
	
	// 예약 목록 출력
	@Override
	public List<RentDto> selectReserve(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		List<RentDto> reserveList = rentDao.selectReserve(searchOption, keyword, start, end);
		
		return reserveList;
	}
	
	@Override
	public List<RentDto> selectReservebyStatus(String statusName) {
		// TODO Auto-generated method stub
		return rentDao.selectReservebyStatus(statusName);
	}

	// 예약 목록 총 갯수
	@Override
	public int totalCountReserve(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return rentDao.totalCountReserve(searchOption, keyword);
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

	
	/*******************
			연체
	*******************/
	
	// 연체 목록 출력
	@Override
	public List<RentDto> selectOverdue(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		List<RentDto> overdueList = rentDao.selectOverdue(searchOption, keyword, start, end);
		
		return overdueList;
	}

	// 연체 목록 총 갯수
	@Override
	public int totalCountOverdue(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return rentDao.totalCountOverdue(searchOption, keyword);
	}

	// 연체 목록 현재 페이지
	@Override
	public int selectOverdueCurPage(String searchOption, String keyword, int no) {
		// TODO Auto-generated method stub
		return rentDao.selectOverdueCurPage(searchOption, keyword, no);
	}
	
	// 연체 상세
	@Override
	public RentDto selectOneOverdue(int no) {
		// TODO Auto-generated method stub
		
		return rentDao.selectOneOverdue(no);
	}

	// 연체 상세에서 상태 변경
	@Override
	public int updateOneOverdueStatus(RentDto rentDto) {
		// TODO Auto-generated method stub
		return rentDao.updateOneOverdueStatus(rentDto);
	}

	@Override
	public List<RentDto> selectRentAll() {
		// TODO Auto-generated method stub
		return rentDao.selectRentAll();
	}

	@Override
	public int updateOneStatusToOverdue(RentDto rentDto) {
		// TODO Auto-generated method stub
		return rentDao.updateOneStatusToOverdue(rentDto);
	}
	
	// 대출 이메일 상태 변경
	@Override
	public int updateOverdueSend(int no) {
		// TODO Auto-generated method stub
		return rentDao.updateOverdueSend(no);
	}
	

	@Override
	public void insertReserve(RentDto rentDto) {

		rentDao.insertReserve(rentDto);

	}
}
