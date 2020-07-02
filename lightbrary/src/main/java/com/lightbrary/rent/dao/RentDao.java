package com.lightbrary.rent.dao;

import java.util.List;

import com.lightbrary.rent.model.RentDto;

public interface RentDao {
	
	/*******************
			대출
	*******************/
	
	// 대출 목록
	List<RentDto> rentSelectList(String searchOption, String keyword, int start, int end);
	int rentSelectTotalCount(String searchOption, String keyword);
	int rentSelectCurPage(String searchOption, String keyword, int no);
	
	
	/*******************
			예약
	*******************/
	
	// 예약 목록
	List<RentDto> selectReserve(String searchOption, String keyword, int start, int end);
	int totalCountReserve(String searchOption, String keyword);
	int selectReserveCurPage(String searchOption, String keyword, int no);
	// 예약 상세
	public RentDto selectOneReserve(int no);

}

