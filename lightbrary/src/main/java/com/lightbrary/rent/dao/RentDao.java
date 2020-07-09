package com.lightbrary.rent.dao;

import java.util.List;

import com.lightbrary.rent.model.RentDto;

public interface RentDao {
	
	/*******************
	             대출 예약
	*******************/
	public void insertReserve(int memberNo, int bookNo);
	public int updateOneStatusToReserve(int bookNo);
	
	/*******************
			예약
	*******************/
	
	// 예약 목록
	public List<RentDto> selectReserve(String searchOption, String keyword, int start, int end);
	public int totalCountReserve(String searchOption, String keyword);
	public int selectReserveCurPage(String searchOption, String keyword, int no);
	// 예약 상세
	public RentDto selectOneReserve(int no);
	public int updateOneReserveStatus(RentDto rentDto); //대출 중으로 상태변경
	public int updateOneRentDate(RentDto rentDto); //대출 날짜 오늘 날짜로
	public int updateOneExpireDate(RentDto rentDto); //반납일 수정
	
	
	/*******************
			대출
	*******************/
	
	// 대출 목록
	public List<RentDto> selectRent(String searchOption, String keyword, int start, int end, String status);
	public int totalCountRent(String searchOption, String keyword, String status);
	public int selectRentCurPage(String searchOption, String keyword, int no, String status);
	// 대출 상세
	public RentDto selectOneRent(int no);
	public int updateOneStatusToKeep(RentDto rentDto); //보관중으로 상태변경
	public int updateOneReturnDate(RentDto rentDto); //반납처리 반납일 수정
	public int updateSend(int no); //대출 이메일 상태 변경

	
	/*******************
			연체
	*******************/
	
	// 연체 목록
	public List<RentDto> selectOverdue(String searchOption, String keyword, int start, int end);
	public int totalCountOverdue(String searchOption, String keyword);
	public int selectOverdueCurPage(String searchOption, String keyword, int no);
	// 연체 상세
	public RentDto selectOneOverdue(int no);
	public List<RentDto> selectReservebyStatus(String statusName);
	public List<RentDto> selectRentAll();
	public int updateOneStatusToOverdue(RentDto rentDto);
	
	public int updateOverdueSend(int no); //연체 이메일 상태 변경
	
	
	/*******************
		나의 예약 현황
	*******************/
	
	// 나의 예약 목록
	public List<RentDto> selectMyReserve(String searchOption, String keyword, int start, int end, int myNo);
	public int totalCountMyReserve(String searchOption, String keyword, int myNo);
	public int selectMyReserveCurPage(String searchOption, String keyword, int no, int myNo);
	// 나의 예약 상세
	public RentDto selectOneMyReserve(int no);
	
}

