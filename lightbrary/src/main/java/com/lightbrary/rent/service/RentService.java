package com.lightbrary.rent.service;

import java.util.List;

import com.lightbrary.rent.model.RentDto;

public interface RentService {
	
	/*******************
			대출
	*******************/
	
	// 대출 목록
	public List<RentDto> selectRent(String searchOption, String keyword, int start, int end);
	public int totalCountRent(String searchOption, String keyword);
	public int selectRentCurPage(String searchOption, String keyword, int no);
	// 대출 상세
	public RentDto selectOneRent(int no);
	public int updateOneRentStatus(RentDto rentDto); //상태변경

	
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
	
	// 예약 목록
	public List<RentDto> selectOverdue(String searchOption, String keyword, int start, int end);
	public int totalCountOverdue(String searchOption, String keyword);
	public int selectOverdueCurPage(String searchOption, String keyword, int no);
	// 상세
	public RentDto selectOneOverdue(int no);
	public int updateOneOverdueStatus(RentDto rentDto); //상태변경
	
	
}
