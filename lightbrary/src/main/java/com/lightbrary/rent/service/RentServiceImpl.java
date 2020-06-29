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

	@Override
	public List<RentDto> rentSelectList(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		List<RentDto> rentList = 
				rentDao.rentSelectList(searchOption, keyword
					, start, end);
		
		return rentList;
	}

	@Override
	public int rentSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return rentDao.rentSelectTotalCount(searchOption
				, keyword);
	}

	@Override
	public int rentSelectCurPage(String searchOption, String keyword, int no) {
		// TODO Auto-generated method stub
		return rentDao.rentSelectCurPage(searchOption, keyword, no);
	}
	
}
