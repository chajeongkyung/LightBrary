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
	
	
	/**
	 * 사용자 예약
	 */
	@Override
	public void insertReserve(int memberNo, int bookNo) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<>();
		map.put("memberNo", memberNo);
		map.put("bookNo", bookNo);
		
		sqlSession.insert(namespace + "insertReserve", map);
	}
	@Override
	public int updateOneStatusToReserve(int bookNo) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "updateOneStatusToReserve", bookNo);
	}
	
	
	/**
	 * 사용자 나의 예약
	 */
	@Override
	public List<RentDto> selectMyReserve(String searchOption, String keyword, int start, int end, int myNo) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		map.put("myNo", myNo);
		
		List<RentDto> myReserveList = sqlSession.selectList(namespace + "selectMyReserve", map);
		
		return myReserveList;
	}
	
	// 나의 예약 목록 총 갯수
	@Override
	public int totalCountMyReserve(String searchOption, String keyword, int myNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		paramMap.put("myNo", myNo);
		
		return sqlSession.selectOne(namespace + "totalCountMyReserve", paramMap);
	}
	
	// 나의 예약 목록 현재 페이지
	@Override
	public int selectMyReserveCurPage(String searchOption, String keyword, int no, int myNo) {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		paramMap.put("no", no);
		paramMap.put("myNo", myNo);
		
		return sqlSession.selectOne(namespace + "selectMyReserveCurPage", paramMap);
	}
	
	// 나의 예약 상세
	@Override
	public RentDto selectOneMyReserve(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "selectOneMyReserve", no);
	}
	
	/**
	 * 예약 취소
	 */
	@Override
	public int updateOneStatusToKeep(int bookNo) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "updateOneStatusToKeep", bookNo);
	}
	// 예약 일 삭제
	@Override
	public int deleteOneFromRent(int no) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "deleteOneFromRent", no);
	}
	
	
	/**
	 * 사용자 나의 대출
	 */
	@Override
	public List<RentDto> selectMyRent(String searchOption, String keyword, int start, int end, int myNo) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		map.put("myNo", myNo);
		
		List<RentDto> myRentList = sqlSession.selectList(namespace + "selectMyRent", map);
		
		return myRentList;
	}
	
	// 나의 대출 목록 총 갯수
	@Override
	public int totalCountMyRent(String searchOption, String keyword, int myNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		paramMap.put("myNo", myNo);
		
		return sqlSession.selectOne(namespace + "totalCountMyRent", paramMap);
	}
	
	// 나의 대출 목록 현재 페이지
	@Override
	public int selectMyRentCurPage(String searchOption, String keyword, int no, int myNo) {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		paramMap.put("no", no);
		paramMap.put("myNo", myNo);
		
		return sqlSession.selectOne(namespace + "selectMyRentCurPage", paramMap);
	}
	
	// 나의 대출 상세
	@Override
	public RentDto selectOneMyRent(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "selectOneMyRent", no);
	}
	
	// 반납일 연장
	@Override
	public int extendReturnDate(int no) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "extendReturnDate", no);
	}
	
	
	
	/**
	 * 관리자 예약 관리
	 */
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

	
	/**
	 * 대출 처리
	 */
	// 도서 상태 대출 처리
	@Override
	public int updateOneStatusToRent(RentDto rentDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "updateOneStatusToRent", rentDto);
	}
	// 도서 상태 대출 처리
	@Override
	public int updateOneStatusToRentFromRent(RentDto rentDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "updateOneStatusToRentFromRent", rentDto);
	}
	// 대출 날짜 오늘 날짜로 
	@Override
	public int updateOneRentDate(RentDto rentDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "updateOneRentDate", rentDto);
	}
	// 반납일 수정
	@Override
	public int updateOneExpireDate(RentDto rentDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "updateOneExpireDate", rentDto);
	}
	
	
	/**
	 * 관리자 대출 관리
	 */
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
	
	// 대출 상세에서 보관중으로 상태 변경
	@Override
	public int updateOneStatusToKeep(RentDto rentDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "updateOneStatusToKeep", rentDto);
	}
	
	// 반납처리 반납일 수정
	@Override
	public int updateOneReturnDate(RentDto rentDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "updateOneReturnDate", rentDto);
	}
	
	// 대출 이메일 상태 변경
	@Override
	public int updateSend(int no) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "updateSend", no);
	}

	
	
	/**
	 * 관리자 연체 관리
	 */
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
	
	
	
	
	//
	@Override
	public int updateOneStatusToKeepFromRent(RentDto rentDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "updateOneStatusToKeepFromRent", rentDto);
	}
	
	@Override
	public int updateOneStatusToOverdueFromRent(RentDto rentDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "updateOneStatusToOverdueFromRent", rentDto);
	}

	
}
