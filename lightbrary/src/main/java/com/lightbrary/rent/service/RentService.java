package com.lightbrary.rent.service;

import java.util.List;

import com.lightbrary.rent.model.RentDto;

public interface RentService {

	
	/** 사용자 대출 예약
	 * @param memberNo
	 * @param bookNo
	 */
	public void insertReserve(int memberNo, int bookNo);
	public int updateOneStatusToReserve(int bookNo);
	
	
	/** 사용자 나의 예약
	 * @param searchOption
	 * @param keyword
	 * @param start
	 * @param end
	 * @param myNo
	 * @return
	 */
	public List<RentDto> selectMyReserve(String searchOption, String keyword, int start, int end, int myNo);
	public int totalCountMyReserve(String searchOption, String keyword, int myNo);
	public int selectMyReserveCurPage(String searchOption, String keyword, int no, int myNo);
	// 나의 예약 상세
	public RentDto selectOneMyReserve(int no);
	
	/** 사용자 예약 취소
	 * @param no
	 * @return
	 */
	public int updateOneStatusToKeep(int bookNo);
	public int deleteOneFromRent(int no);
	
	
	/** 사용자 나의 대출
	 * @param searchOption
	 * @param keyword
	 * @param start
	 * @param end
	 * @param myNo
	 * @return
	 */
	public List<RentDto> selectMyRent(String searchOption, String keyword, int start, int end, int myNo);
	public int totalCountMyRent(String searchOption, String keyword, int myNo);
	public int selectMyRentCurPage(String searchOption, String keyword, int no, int myNo);
	// 나의 대출 상세
	public RentDto selectOneMyRent(int no);
	// 반납일 연장
	public int extendReturnDate(int no);
	

	/** 관리자 예약 관리
	 * @param searchOption
	 * @param keyword
	 * @param start
	 * @param end
	 * @return
	 */
	public List<RentDto> selectReserve(String searchOption, String keyword, int start, int end);
	public int totalCountReserve(String searchOption, String keyword);
	public int selectReserveCurPage(String searchOption, String keyword, int no);
	// 예약 상세
	public RentDto selectOneReserve(int no);
	public int updateOneStatusToRent(RentDto rentDto); //대출 중으로 도서 상태변경
	public int updateOneStatusToRentFromRent(RentDto rentDto); //대출 중으로 대출 상태 변경
	public int updateOneRentDate(RentDto rentDto); //대출 날짜 오늘 날짜로 변경
	public int updateOneExpireDate(RentDto rentDto); //반납일 수정
	
	
	/** 관리자 대출 관리
	 * @param searchOption
	 * @param keyword
	 * @param start
	 * @param end
	 * @param status
	 * @return
	 */
	public List<RentDto> selectRent(String searchOption, String keyword, int start, int end, String status);
	public int totalCountRent(String searchOption, String keyword, String status);
	public int selectRentCurPage(String searchOption, String keyword, int no, String status);
	// 대출 상세
	public RentDto selectOneRent(int no);
	public int updateOneStatusToKeep(RentDto rentDto); //보관중으로 상태변경
	public int updateOneReturnDate(RentDto rentDto); //반납처리 반납일 수정
	
	public int updateSend(int no); //반납 이메일 상태 변경
	
	
	/** 관리자 연체 관리
	 * @param searchOption
	 * @param keyword
	 * @param start
	 * @param end
	 * @return
	 */
	public List<RentDto> selectOverdue(String searchOption, String keyword, int start, int end);
	public int totalCountOverdue(String searchOption, String keyword);
	public int selectOverdueCurPage(String searchOption, String keyword, int no);
	// 상세
	public RentDto selectOneOverdue(int no);
	public List<RentDto> selectReservebyStatus(String statusName);
	
	public List<RentDto> selectRentAll(); // 상태 대출 목록
	public int updateOneStatusToOverdue(RentDto rentDto);
	
	public int updateOverdueSend(int no); //연체 이메일 상태 변경
	
	
	
	//
	public int updateOneStatusToKeepFromRent(RentDto rentDto);
	public int updateOneStatusToOverdueFromRent(RentDto rentDto);
	
}
