package com.lightbrary.rent.service;

import java.util.List;

import com.lightbrary.rent.model.RentDto;

public interface RentService {
	
	// 대출
	public List<RentDto> rentSelectList(String searchOption, 
			String keyword, int start, int end);
	public int rentSelectTotalCount(String searchOption
			, String keyword);
	public int rentSelectCurPage(String searchOption, String keyword, int no);
	
	// 예약
	public List<RentDto> reserveSelectList(String searchOption, 
			String keyword, int start, int end);
	public int reserveSelectTotalCount(String searchOption
			, String keyword);
	public int reserveSelectCurPage(String searchOption, String keyword, int no);
}
