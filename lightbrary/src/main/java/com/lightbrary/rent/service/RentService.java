package com.lightbrary.rent.service;

import java.util.List;

import com.lightbrary.rent.model.RentDto;

public interface RentService {
	
	/*******************
			대출
	*******************/
	
	// 대출 목록
	public List<RentDto> selectRent(String searchOption, String keyword, int start, int end, String status);
	public int totalCountRent(String searchOption, String keyword, String status);
	public int selectRentCurPage(String searchOption, String keyword, int no, String status);
	// 대출 상세
	public RentDto selectOneRent(int no);
	public int updateOneRentStatus(RentDto rentDto); //상태변경
	
	public int updateSend(int no); //반납 이메일 상태 변경

	
	/*******************
			예약
	*******************/
	
	// 예약 목록
	public List<RentDto> selectReserve(String searchOption, String keyword, int start, int end);
	public int totalCountReserve(String searchOption, String keyword);
	public int selectReserveCurPage(String searchOption, String keyword, int no);
	// 예약 상세
	public RentDto selectOneReserve(int no);
	public int updateOneReserveStatus(RentDto rentDto); //상태변경
	
	/*******************
			연체
	*******************/
	
	// 연체 목록
	public List<RentDto> selectOverdue(String searchOption, String keyword, int start, int end);
	public int totalCountOverdue(String searchOption, String keyword);
	public int selectOverdueCurPage(String searchOption, String keyword, int no);
	// 상세
	public RentDto selectOneOverdue(int no);
	public int updateOneOverdueStatus(RentDto rentDto); //상태변경
	public List<RentDto> selectReservebyStatus(String statusName);
	
	public List<RentDto> selectRentAll(); // 상태 대출 목록
	public int updateOneStatusToOverdue(RentDto rentDto);
	
	public int updateOverdueSend(int no); //연체 이메일 상태 변경
	
	/*******************
		    대출 예약
	*******************/
	public void insertReserve(RentDto rentDto);
	
}
