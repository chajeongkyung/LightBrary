package com.lightbrary.rent.service;

import java.util.List;

import com.lightbrary.rent.model.RentDto;

public interface RentService {
	
	/*******************
			대출
	*******************/
	
	// 대출 목록
	public List<RentDto> selectRent(String searchOption, 
			String keyword, int start, int end);
	public int totalCountRent(String searchOption
			, String keyword);
	public int selectRentCurPage(String searchOption, String keyword, int no);
	// 예약 상세
	public RentDto selectOneRent(int no);
	
	/*******************
			예약
	*******************/
	
	// 예약 목록
	public List<RentDto> selectReserve(String searchOption, 
			String keyword, int start, int end);
	public int totalCountReserve(String searchOption
			, String keyword);
	public int selectReserveCurPage(String searchOption, String keyword, int no);
	// 예약 상세
	public RentDto selectOneReserve(int no);
	public int updateOneReserveStatus(RentDto rentDto); //상태변경
	
}
