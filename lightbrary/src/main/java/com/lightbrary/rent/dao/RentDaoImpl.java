package com.lightbrary.rent.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lightbrary.rent.model.RentDto;


@Repository
public class RentDaoImpl implements RentDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.lightbrary.rent.";
	
	
	/*******************
			대출
	*******************/

	// 대출 목록 출력
	@Override
	public List<RentDto> selectRent(String searchOption, String keyword, int start, int end, String status) {
		// TODO Auto-generated method stub

		Map<String, Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		map.put("status", status);
		
		List<RentDto> rentList = sqlSession.selectList(namespace + "selectRent", map);
		
		return rentList;
	}

	// 대출 목록 총 갯수
	@Override
	public int totalCountRent(String searchOption, String keyword, String status) {
		// TODO Auto-generated method stub
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		paramMap.put("status", status);
		
		return sqlSession.selectOne(namespace + "totalCountRent", paramMap);
	}

	// 대출 목록 현재 페이지
	@Override
	public int selectRentCurPage(String searchOption, String keyword, int no, String status) {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		paramMap.put("no", no);
		paramMap.put("status", status);
		
		return sqlSession.selectOne(namespace + "selectRentCurPage", paramMap);
	}
	
	// 대출 상세
	@Override
	public RentDto selectOneRent(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "selectOneRent", no);
	}
	
	// 대출 상세에서 상태 변경
	@Override
	public int updateOneRentStatus(RentDto rentDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "updateOneRentStatus", rentDto);
	}
	
	// 대출 이메일 상태 변경
	@Override
	public int updateSend(int no) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "updateSend", no);
	}
	
	
	/*******************
			예약
	*******************/
	
	// 예약 목록 출력
	@Override
	public List<RentDto> selectReserve(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub

		Map<String, Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		List<RentDto> reserveList = sqlSession.selectList(namespace + "selectReserve", map);
		
		return reserveList;
	}

	// 예약 목록 총 갯수
	@Override
	public int totalCountReserve(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		
		return sqlSession.selectOne(namespace + "totalCountReserve", paramMap);
	}

	// 예약 목록 현재 페이지
	@Override
	public int selectReserveCurPage(String searchOption, String keyword, int no) {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		paramMap.put("no", no);
		
		return sqlSession.selectOne(namespace + "selectReserveCurPage", paramMap);
	}

	// 예약 상세
	@Override
	public RentDto selectOneReserve(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "selectOneReserve", no);
	}

	// 예약 상세에서 상태 변경
	@Override
	public int updateOneReserveStatus(RentDto rentDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "updateOneReserveStatus", rentDto);
	}
	
	
	/*******************
			연체
	*******************/
	
	// 연체 목록 출력
	@Override
	public List<RentDto> selectOverdue(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
	
		Map<String, Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		List<RentDto> reserveList = sqlSession.selectList(namespace + "selectOverdue", map);
		
		return reserveList;
	}
	
	// 연체 목록 총 갯수
	@Override
	public int totalCountOverdue(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		
		return sqlSession.selectOne(namespace + "totalCountOverdue", paramMap);
	}
	
	// 연체 목록 현재 페이지
	@Override
	public int selectOverdueCurPage(String searchOption, String keyword, int no) {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		paramMap.put("no", no);
		
		return sqlSession.selectOne(namespace + "selectOverdueCurPage", paramMap);
	}

	// 연체 상세
	@Override
	public RentDto selectOneOverdue(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "selectOneOverdue", no);
	}

	// 연체 상세에서 상태 변경
	@Override
	public int updateOneOverdueStatus(RentDto rentDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "updateOneOverdueStatus", rentDto);
	}

	@Override
	public List<RentDto> selectReservebyStatus(String statusName) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "selectReservebyStatus", statusName);
	}
	

	@Override
	public List<RentDto> selectRentAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "selectRentAll");
	}

	@Override
	public int updateOneStatusToOverdue(RentDto rentDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "updateOneStatusToOverdue", rentDto);
	}
	
	// 연체 이메일 상태 변경
	@Override
	public int updateOverdueSend(int no) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "updateOverdueSend", no);
	}
	
	
	
	@Override
	public void insertReserve(RentDto rentDto) {
		// TODO Auto-generated method stub
		
		sqlSession.insert(namespace + "insertReserve", rentDto);
	}
	
}
