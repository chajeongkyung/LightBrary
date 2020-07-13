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
	
	
	/** 사용자 대출 예약
	 *
	 */
	@Override
	public void insertReserve(int memberNo, int bookNo) {
		// TODO Auto-generated method stub
		rentDao.insertReserve(memberNo, bookNo);
	}
	@Override
	public int updateOneStatusToReserve(int bookNo) {
		// TODO Auto-generated method stub
		return rentDao.updateOneStatusToReserve(bookNo);
	}
	
	
	/** 사용자 나의 예약
	 *
	 */
	@Override
	public List<RentDto> selectMyReserve(String searchOption, String keyword, int start, int end, int myNo) {
		// TODO Auto-generated method stub
		List<RentDto> myReserveList = rentDao.selectMyReserve(searchOption, keyword, start, end, myNo);
		
		return myReserveList;
	}
	
	// 나의 예약 목록 총 갯수
	@Override
	public int totalCountMyReserve(String searchOption, String keyword, int myNo) {
		// TODO Auto-generated method stub
		return rentDao.totalCountMyReserve(searchOption, keyword, myNo);
	}
	
	// 나의 예약 목록 현재 페이지
	@Override
	public int selectMyReserveCurPage(String searchOption, String keyword, int no, int myNo) {
		// TODO Auto-generated method stub
		return rentDao.selectMyReserveCurPage(searchOption, keyword, no, myNo);
	}
	
	// 나의 예약 상세
	@Override
	public RentDto selectOneMyReserve(int no) {
		// TODO Auto-generated method stub
		
		return rentDao.selectOneMyReserve(no);
	}
	
	/** 사용자 예약 취소
	 *
	 */
	@Override
	public int updateOneStatusToKeep(int bookNo) {
		// TODO Auto-generated method stub
		return rentDao.updateOneStatusToKeep(bookNo);
	}
	@Override
	public int deleteOneFromRent(int no) {
		// TODO Auto-generated method stub
		return rentDao.deleteOneFromRent(no);
	}
	
	
	/** 사용자 나의 대출
	 *
	 */
	@Override
	public List<RentDto> selectMyRent(String searchOption, String keyword, int start, int end, int myNo) {
		// TODO Auto-generated method stub
		List<RentDto> myRentList = rentDao.selectMyRent(searchOption, keyword, start, end, myNo);
		
		return myRentList;
	}
	
	// 나의 대출 목록 총 갯수
	@Override
	public int totalCountMyRent(String searchOption, String keyword, int myNo) {
		// TODO Auto-generated method stub
		return rentDao.totalCountMyRent(searchOption, keyword, myNo);
	}
	
	// 나의 대출 목록 현재 페이지
	@Override
	public int selectMyRentCurPage(String searchOption, String keyword, int no, int myNo) {
		// TODO Auto-generated method stub
		return rentDao.selectMyRentCurPage(searchOption, keyword, no, myNo);
	}
	
	// 나의 대출 상세
	@Override
	public RentDto selectOneMyRent(int no) {
		// TODO Auto-generated method stub
		
		return rentDao.selectOneMyRent(no);
	}
	
	// 반납일 연장
	@Override
	public int extendReturnDate(int no) {
		// TODO Auto-generated method stub
		return rentDao.extendReturnDate(no);
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
	public int updateOneStatusToRent(RentDto rentDto) {
		// TODO Auto-generated method stub
		return rentDao.updateOneStatusToRent(rentDto);
	}
	
	// 대출 날짜 오늘 날짜로 변경
	@Override
	public int updateOneRentDate(RentDto rentDto) {
		// TODO Auto-generated method stub
		return rentDao.updateOneRentDate(rentDto);
	}
	
	// 반납일 수정
	@Override
	public int updateOneExpireDate(RentDto rentDto) {
		// TODO Auto-generated method stub
		return rentDao.updateOneExpireDate(rentDto);
	}

	
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
	
	// 대출 상세에서 보관중으로 상태 변경
	@Override
	public int updateOneStatusToKeep(RentDto rentDto) {
		// TODO Auto-generated method stub
		return rentDao.updateOneStatusToKeep(rentDto);
	}
	
	// 반납처리 반납일 수정
	@Override
	public int updateOneReturnDate(RentDto rentDto) {
		// TODO Auto-generated method stub
		return rentDao.updateOneReturnDate(rentDto);
	}
	
	// 대출 이메일 상태 변경
	@Override
	public int updateSend(int no) {
		// TODO Auto-generated method stub
		return rentDao.updateSend(no);
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
}
