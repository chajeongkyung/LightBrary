package com.lightbrary.rent.service;

import java.util.List;

import com.lightbrary.rent.model.MemberFileDto;
import com.lightbrary.rent.model.RentDto;

public interface RentService {
	
	public List<RentDto> rentSelectList(String searchOption, 
			String keyword, int start, int end);
	
	public int rentSelectTotalCount(String searchOption
			, String keyword);
	
	public int rentSelectCurPage(String searchOption, String keyword, int no);
}
