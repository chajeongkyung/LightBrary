package com.lightbrary.rent.dao;

import java.util.List;

import com.lightbrary.rent.model.RentDto;

public interface RentDao {

	List<RentDto> rentSelectList(String searchOption, String keyword, int start, int end);

	int rentSelectTotalCount(String searchOption, String keyword);

	int rentSelectCurPage(String searchOption, String keyword, int no);

}

