package com.lightbrary.rent.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lightbrary.book.model.BookListParamDto;
import com.lightbrary.member.model.MemberDto;
import com.lightbrary.rent.model.RentDto;
import com.lightbrary.rent.service.RentService;
import com.lightbrary.util.Paging;

/**
 * @author TJ
 *
 */
@Controller
public class RentController {

	private static final Logger log = LoggerFactory.getLogger(RentController.class);

	@Autowired
	private RentService rentService;
	
	
	/** 사용자 대출 예약 - 목록
	 * @param memberNo
	 * @param no
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/book/reserve.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String insertReserve(BookListParamDto bookListParamDto, HttpSession session, int no, Model model) {
	
		int memberNo = ((MemberDto) session.getAttribute("member")).getNo();
		log.info("도서 예약 :: 회원번호 = " + memberNo + " : 도서번호 = " + no);
		
		rentService.insertReserve(memberNo, no);
		rentService.updateOneStatusToReserve(no);
		
		model.addAttribute("bookListParamDto", bookListParamDto);
	
		return "forward:/book/list.do";
	}
	
	//다중 예약 처리
	@RequestMapping(value="/book/reserveBatch.do", method = RequestMethod.POST, 
			produces="text/plain;charset=UTF-8")
	@ResponseBody
	public void reserveBatch(int[] noArr, HttpSession session) {
		log.info("도서 목록 :: 다중 예약처리");
		
		int memberNo = ((MemberDto) session.getAttribute("member")).getNo();

		for (int no : noArr) {
			rentService.insertReserve(memberNo, no);
			rentService.updateOneStatusToReserve(no);
		}
	}
	
	/** 사용자 대출 예약 - 상세
	 * @param memberNo
	 * @param bookNo
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/book/detailReserve.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String insertReserveFromDetail(BookListParamDto bookListParamDto, HttpSession session, int no, Model model) {
		
		int memberNo = ((MemberDto) session.getAttribute("member")).getNo();
		log.info("도서 예약 :: 회원번호 = " + memberNo + " : 도서번호 = " + no);
	
		rentService.insertReserve(memberNo, no);
		rentService.updateOneStatusToReserve(no);
		
		model.addAttribute("no", no);
		model.addAttribute("bookListParamDto", bookListParamDto);
	
		return "forward:/book/detail.do";
	}
	
	/** 사용자 나의 예약
	 * @param curPage
	 * @param no
	 * @param searchOption
	 * @param keyword
	 * @param memberNo
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/rent/reserve/member/list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String myReserveList(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "0") int no,
		@RequestParam(defaultValue = "all") String searchOption, @RequestParam(defaultValue = "") String keyword,
		int myNo, Model model) {
	
		log.info("나의예약현황목록 :: 현재페이지 = " + curPage + " : searchOption = " + searchOption + " : keyword = " + keyword
				+ " : 회원 번호 = " + myNo);
		
		// 전체 예약 도서 갯수
		int totalCount = rentService.totalCountMyReserve(searchOption, keyword, myNo);
		
		if (no != 0) {
			curPage = rentService.selectMyReserveCurPage(searchOption, keyword, no, myNo);
		}
		
		Paging pagingInfo = new Paging(totalCount, curPage);
		
		System.out.println("-------------------");
		System.out.println(pagingInfo);
		System.out.println("-------------------");
		int start = pagingInfo.getPageBegin();
		int end = pagingInfo.getPageEnd();
		
		List<RentDto> myReserveList = rentService.selectMyReserve(searchOption, keyword, start, end, myNo);
		
		// 검색
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);
		
		// 페이징
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("pagingInfo", pagingInfo);
		
		model.addAttribute("myReserveList", myReserveList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("searchMap", searchMap);
		
		log.info("검색 문자 : " + keyword);
		log.info("검색 옵션 : " + searchOption);
		
		return "rent/reserve/member/MyReserveListView";
	}
	
	//다중 예약 취소 처리
	@RequestMapping(value="/rent/reserve/member/cancelBatch.do", method = RequestMethod.POST, 
			produces="text/plain;charset=UTF-8")
	@ResponseBody
	public void cancelBatch(int[] noArr) {
		log.info("예약 현황 목록 :: 다중 예약 취소 처리");
		
		for (int i = 0; i < noArr.length; i++) {
			System.out.println("===========NO=============" + noArr[i]);
		}

		for (int no : noArr) {
			RentDto rentDto = rentService.selectOneReserve(no);
			rentService.updateOneStatusToKeep(rentDto.getBookNo());
			rentService.deleteOneFromRent(no);
		}
	}
	
	// 나의 예약 상세
	@RequestMapping(value = "/rent/reserve/member/detail.do", method = RequestMethod.GET)
	public String myReserveView(int no, String searchOption, String keyword, Model model) {
		log.info("예약 도서 상세 - " + no + "\n" + "검색옵션 : " + searchOption + "\n" + "검색문장" + keyword);

		RentDto rentDto = rentService.selectOneMyReserve(no);

		model.addAttribute("rentDto", rentDto);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);

		return "rent/reserve/member/MyReserveDetailView";
	}
	
	/** 사용자 예약 취소
	 * @param rentDto
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/rent/reserve/member/statusUpdateCtr.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String reserveCancelUpdateCtr(int no, int myNo, int bookNo, String searchOption, String keyword, Model model) {
		log.info("예약 취소 :: RENT 번호 = " + no + " : 회원번호 = " + myNo + " : 책 번호 = " + bookNo);

		try {
			rentService.updateOneStatusToKeep(bookNo);
			rentService.deleteOneFromRent(no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("myNo", myNo);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		
		return "redirect:/rent/reserve/member/list.do";
	}
	
	/** 사용자 나의 대출
	 * @param curPage
	 * @param no
	 * @param searchOption
	 * @param keyword
	 * @param memberNo
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/rent/member/list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String myRentList(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "0") int no,
		@RequestParam(defaultValue = "all") String searchOption, @RequestParam(defaultValue = "") String keyword,
		int myNo, Model model) {
	
		log.info("나의대출현황목록 :: 현재페이지 = " + curPage + " : searchOption = " + searchOption + " : keyword = " + keyword
				+ " : 회원 번호 = " + myNo);
		
		// 나의 대출 도서 갯수
		int totalCount = rentService.totalCountMyRent(searchOption, keyword, myNo);
		
		if (no != 0) {
			curPage = rentService.selectMyRentCurPage(searchOption, keyword, no, myNo);
		}
		
		Paging pagingInfo = new Paging(totalCount, curPage);
		
		System.out.println("-------------------");
		System.out.println(pagingInfo);
		System.out.println("-------------------");
		int start = pagingInfo.getPageBegin();
		int end = pagingInfo.getPageEnd();
		
		List<RentDto> myRentList = rentService.selectMyRent(searchOption, keyword, start, end, myNo);
		
		// 검색
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);
		
		// 페이징
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("pagingInfo", pagingInfo);
		
		model.addAttribute("myRentList", myRentList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("searchMap", searchMap);
		
		log.info("검색 문자 : " + keyword);
		log.info("검색 옵션 : " + searchOption);
		
		return "rent/member/MyRentListView";
	}
	
	// 나의 대출 상세
	@RequestMapping(value = "/rent/member/detail.do", method = RequestMethod.GET)
	public String myRentView(int no, String searchOption, String keyword, Model model) {
		log.info("대출 도서 상세 - " + no + "\n" + "검색옵션 : " + searchOption + "\n" + "검색문장" + keyword);

		RentDto rentDto = rentService.selectOneMyRent(no);

		model.addAttribute("rentDto", rentDto);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);

		return "rent/member/MyRentDetailView";
	}
	
	// 목록에서 반납일 연장
	@RequestMapping(value = "/rent/member/statusUpdateCtr.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String returnDateUpdateCtr(int no, int myNo, String searchOption, String keyword, Model model) {
		log.info("목록 :: 반납일 연장된 도서 번호 ===================== " + no);

		try {
			rentService.extendReturnDate(no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("myNo", myNo);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);

		return "redirect:/rent/member/list.do";
	}
	
	//다중 반납일 연창 처리
	@RequestMapping(value="/rent/member/extendRentBatch.do", method = RequestMethod.POST, 
			produces="text/plain;charset=UTF-8")
	@ResponseBody
	public void extendRentBatch(int[] noArr) {
		log.info("나의 대출 목록 :: 다중 반납 연장 처리");

		for (int no : noArr) {
			rentService.extendReturnDate(no);
		}
	}
	
	// 상세에서 반납일 연장
	@RequestMapping(value = "/rent/member/detailStatusUpdateCtr.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String returnDateUpdateFromDetailCtr(int no, int myNo, String searchOption, String keyword, Model model) {
		log.info("상세 :: 반납일 연장된 도서 번호 ===================== " + no);

		try {
			rentService.extendReturnDate(no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("no", no);
		model.addAttribute("myNo", myNo);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);

		return "redirect:/rent/member/detail.do";
	}
	


	/** 관리자 예약 관리
	 * @param curPage
	 * @param no
	 * @param searchOption
	 * @param keyword
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/rent/reserve/list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String reserveList(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "0") int no,
			@RequestParam(defaultValue = "all") String searchOption, @RequestParam(defaultValue = "") String keyword,
			Model model) {

		log.info("예약현황목록 :: 현재페이지 = " + curPage + " : searchOption = " + searchOption + " : keyword = " + keyword);

		
		// 전체 예약 도서 갯수
		int totalCount = rentService.totalCountReserve(searchOption, keyword);

		if (no != 0) {
			curPage = rentService.selectReserveCurPage(searchOption, keyword, no);
		}

		Paging pagingInfo = new Paging(totalCount, curPage);

		System.out.println("-------------------");
		System.out.println(pagingInfo);
		System.out.println("-------------------");
		int start = pagingInfo.getPageBegin();
		int end = pagingInfo.getPageEnd();

		List<RentDto> reserveList = rentService.selectReserve(searchOption, keyword, start, end);
		
		for (RentDto rentDto : reserveList) {
			calcStatus(rentDto);
			System.out.println("pickupDate==========" + rentDto.getPickUpDate());
		}

		// 검색
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);

		// 페이징
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("pagingInfo", pagingInfo);

		model.addAttribute("reserveList", reserveList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("searchMap", searchMap);

		log.info("검색 문자 : " + keyword);
		log.info("검색 옵션 : " + searchOption);

		return "rent/reserve/ReserveListView";
	}

	// 예약 취소
	@RequestMapping(value = "/rent/reserve/cancel.do", method = RequestMethod.GET)
	public String reserveCancel(Model model) {
		List<RentDto> reserveList = rentService.selectReservebyStatus("예약");

		Calendar cal = Calendar.getInstance();
		Date today = new Date();
		cal.setTime(today);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);

		Calendar cal2 = Calendar.getInstance();
		for (RentDto rentDto : reserveList) {
			Date pickupDate = rentDto.getPickUpDate();
			cal2.setTime(pickupDate);
			cal2.set(Calendar.HOUR_OF_DAY, 0);
			cal2.set(Calendar.MINUTE, 0);
			cal2.set(Calendar.SECOND, 0);
			cal2.set(Calendar.MILLISECOND, 0);
			if (cal.after(cal2)) {
				rentService.updateOneStatusToKeep(rentDto);
				rentService.deleteOneFromRent(rentDto.getNo());
			}
		}

		return "redirect:/rent/reserve/list.do";
	}
	
	// 예약 목록 다중 대출 처리
	@RequestMapping(value="/rent/reserve/rentBatch.do", method = RequestMethod.POST, 
			produces="text/plain;charset=UTF-8")
	@ResponseBody
	public void rentBatch(int[] noArr) {
		log.info("관리자 예약 목록 :: 다중 반납 대출 처리");

		for (int no : noArr) {
			RentDto rentDto = rentService.selectOneReserve(no);
			rentService.updateOneStatusToRent(rentDto);
			rentService.updateOneRentDate(rentDto);
			rentService.updateOneExpireDate(rentDto);
		}
	}

	// 예약 상세
	@RequestMapping(value = "/rent/reserve/detail.do", method = RequestMethod.GET)
	public String reserveView(int no, String searchOption, String keyword, Model model) {
		log.info("예약 도서 상세 - " + no + "\n" + "검색옵션 : " + searchOption + "\n" + "검색문장" + keyword);

		RentDto rentDto = rentService.selectOneReserve(no);

		model.addAttribute("rentDto", rentDto);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);

		return "rent/reserve/ReserveDetailView";
	}

	// 반납처리 - 상세
	@RequestMapping(value = "/rent/reserve/statusUpdateCtr.do", method = RequestMethod.POST)
	public String reserveStatusUpdateCtr(RentDto rentDto, Model model) {
		log.info("대출 중으로 변경된 도서 번호 = ", rentDto.getBookNo());

		System.out.println(rentDto.toString());

		try {
			rentService.updateOneStatusToRent(rentDto);
			rentService.updateOneRentDate(rentDto);
			rentService.updateOneExpireDate(rentDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:/rent/reserve/list.do";
	}
	
	
	/** 관리자 대출 관리
	 * @param curPage
	 * @param no
	 * @param searchOption
	 * @param keyword
	 * @param status
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/rent/list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String rentList(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "0") int no,
		@RequestParam(defaultValue = "all") String searchOption, @RequestParam(defaultValue = "") String keyword,
		@RequestParam(defaultValue = "statusAll") String status, Model model) {
		log.info("대출현황목록 :: 현재페이지 : " + curPage + " : searchOption = " + searchOption + " : keyword = " + keyword
				+ " : status = " + status);
		
		// 전체 예약 도서 갯수
		int totalCount = rentService.totalCountRent(searchOption, keyword, status);
		
		if(no != 0) {
			curPage = rentService.selectRentCurPage(searchOption, keyword, no, status);
		}
		
		Paging pagingInfo = new Paging(totalCount, curPage);
		int start = pagingInfo.getPageBegin();
		int end = pagingInfo.getPageEnd();
		
		List<RentDto> rentList = rentService.selectRent(searchOption, keyword, start, end, status);
		
		for (RentDto rentDto : rentList) {
			calcStatus(rentDto);
		}
		
		// 검색
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);
		
		// 페이징
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("pagingInfo", pagingInfo);
		
		model.addAttribute("rentList", rentList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("searchMap", searchMap);
		model.addAttribute("status", status);
		
		System.out.println("검색 문자 : " + keyword);
		System.out.println("검색 옵션 : " + searchOption);
		System.out.println("분류 : " + status);
		
		return "rent/RentListView";
	}
	
	//다중 반납 처리
	@RequestMapping(value="/rent/returnBatch.do", method = RequestMethod.POST, 
			produces="text/plain;charset=UTF-8")
	@ResponseBody
	public void returnBatch(int[] noArr) {
		log.info("대출 현황 목록 :: 다중 반납처리");

		for (int no : noArr) {
			rentService.updateOneStatusToKeep(no);
		}
	}
		
	// 대출 상세
	@RequestMapping(value = "/rent/detail.do", method = RequestMethod.GET)
	public String rentDetail(int no, String searchOption, String keyword, String status, Model model) {
		log.info("대출 도서 상세 - " + no + "\n검색옵션 : " + searchOption + "\n검색문장 : " + keyword + "\n분류 : " + status);
		
		RentDto rentDto = rentService.selectOneRent(no);
		
		System.out.println("---------DETAIL----------");
		System.out.println(rentDto.toString());
		System.out.println("------------------------");
		
		model.addAttribute("rentDto", rentDto);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		model.addAttribute("status", status);
		
		return "rent/RentDetailView";
	}
	
	// 대출 반납처리
	@RequestMapping(value = "/rent/statusUpdateCtr.do", method = RequestMethod.POST)
		public String rentStatusUpdateCtr(RentDto rentDto, Model model) {
		log.info("보관 중으로 변경된 도서 번호 : {}", rentDto.getBookNo());
		
		try {
			rentService.updateOneStatusToKeep(rentDto);
			rentService.updateOneReturnDate(rentDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("---------UPDATE----------");
		System.out.println(rentDto.toString());
		System.out.println("-------------------------");
		
		rentDto = rentService.selectOneRent(rentDto.getNo());
		
		model.addAttribute("no", rentDto.getNo());
		
		return "redirect:/rent/detail.do";
	}
	
	@Autowired
	private JavaMailSender mailSender;
	
	// 대출 안내 이메일 전송
	@RequestMapping(value = "/rent/sendEmail.do")
		public String returnMailSending(int no, String userEmail, String memberName, String bookName, String expireDate
			, HttpServletRequest request) {
		log.info("이메일 전송 :: 번호 = " + no + " : 회원 이메일  = " + userEmail + " : 반납예정일 = " + expireDate + " : 회원 명 = " 
			+ memberName + " : 도서 제목 = " + bookName);
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		
			messageHelper.setFrom("Lightbrary"); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(userEmail); // 받는사람 이메일
			messageHelper.setSubject("Lightbrary 반납 안내"); // 메일제목은 생략이 가능하다
			messageHelper.setText(memberName + "님 안녕하십니까, \nLightbrary에서 대출하신 도서 '" + bookName + "'의 반납 예정일은  '" + expireDate + "' 입니다."); // 메일 내용
		
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		rentService.updateSend(no);
		
		return "redirect:/rent/list.do";
	}

	
	/** 관리자 연체 관리
	 * @param curPage
	 * @param no
	 * @param searchOption
	 * @param keyword
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/rent/overdue/list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String overdueList(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "0") int no,
			@RequestParam(defaultValue = "all") String searchOption, @RequestParam(defaultValue = "") String keyword,
			Model model) {

		log.info("연체목록 : 현재페이지 = " + curPage + " : searchOption = " + searchOption + " : keyword = " + keyword);

		System.out.println();
		// 전체 예약 도서 갯수
		int totalCount = rentService.totalCountOverdue(searchOption, keyword);

		if (no != 0) {
			curPage = rentService.selectOverdueCurPage(searchOption, keyword, no);
		}
		
		System.out.println(curPage);
		System.out.println(totalCount);

		Paging pagingInfo = new Paging(totalCount, curPage);

		System.out.println("-------------------");
		System.out.println(pagingInfo);
		System.out.println("-------------------");
		int start = pagingInfo.getPageBegin();
		int end = pagingInfo.getPageEnd();

		List<RentDto> overdueList = rentService.selectOverdue(searchOption, keyword, start, end);
		
		for (int i = 0; i < overdueList.size(); i++) {
			RentDto rentDto = overdueList.get(i);
			calcStatus(rentDto);
			System.out.println(">>>>>>>>>>>>>>getRentDate" + rentDto.getRentDate());
			System.out.println(">>>>>>>>>>>>>>getExpireDate" + rentDto.getExpireDate());
			System.out.println(">>>>>>>>>>>>>>getReturnDate" + rentDto.getReturnDate());
			System.out.println("getRentStatus===============" + rentDto.getRentStatus());
			
//			if(rentDto.getRentStatus() != "연체") {
//				overdueList.remove(i--);
//			}
		}

		// 검색
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);

		// 페이징
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("pagingInfo", pagingInfo);

		model.addAttribute("overdueList", overdueList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("searchMap", searchMap);

		System.out.println("검색 문자 : " + keyword);
		System.out.println("검색 옵션 : " + searchOption);

		return "rent/overdue/OverdueListView";
	}

	// 연체 불러오기
	@RequestMapping(value = "/rent/overdue/refresh.do", method = RequestMethod.GET)
	public String overdueRefresh(Model model) {

		// 대출 중인 도서들만 불러와서 비교하기
		List<RentDto> overdueList = rentService.selectRentAll();

		Calendar cal = Calendar.getInstance();
		Date today = new Date();
		cal.setTime(today);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);

		Calendar cal2 = Calendar.getInstance();
		for (RentDto rentDto : overdueList) {
			Date expireDate = rentDto.getExpireDate();
			cal2.setTime(expireDate);
			cal2.set(Calendar.HOUR_OF_DAY, 0);
			cal2.set(Calendar.MINUTE, 0);
			cal2.set(Calendar.SECOND, 0);
			cal2.set(Calendar.MILLISECOND, 0);
			if (cal.after(cal2)) {
				rentService.updateOneStatusToOverdue(rentDto);
			}
		}

		return "redirect:/rent/overdue/list.do";
	}

	// 연체 상세
	@RequestMapping(value = "/rent/overdue/detail.do", method = RequestMethod.GET)
	public String overdueView(int no, String searchOption, String keyword, Model model) {
		log.info("연체 도서 상세 - " + no + "\n" + "검색옵션 : " + searchOption + "\n" + "검색문장" + keyword);

		RentDto rentDto = rentService.selectOneOverdue(no);

		model.addAttribute("rentDto", rentDto);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);

		return "rent/overdue/OverdueDetailView";
	}

	// 연체 반납처리
	@RequestMapping(value = "/rent/overdue/statusUpdateCtr.do", method = RequestMethod.POST)
	public String overdueStatusUpdateCtr(RentDto rentDto, Model model) {
		log.info("대출 중으로 변경된 도서 번호 : {}", rentDto.getBookNo());

		System.out.println(rentDto.toString());

		try {
			rentService.updateOneStatusToKeep(rentDto);
			rentService.updateOneReturnDate(rentDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:/rent/overdue/list.do";
	}
	
	// 연체 안내 이메일 전송
	@RequestMapping(value = "/rent/overdue/sendEmail.do")
	public String overdueMailSending(int no, String userEmail, String memberName, String bookName
			, String expireDate, int overdueDays, HttpServletRequest request) {
		log.info("이메일 전송 :: 번호 = " + no + " : 회원 이메일  = " + userEmail + " : 반납예정일 = " + expireDate + " : 연체 일 = " 
			+ overdueDays + " : 회원 명 = " + memberName + " : 도서 제목 = " + bookName);

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom("관리자"); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(userEmail); // 받는사람 이메일
			messageHelper.setSubject("Lightbrary 연체 안내"); // 메일제목은 생략이 가능하다
			messageHelper.setText(memberName + "님 안녕하십니까, \nLightbrary에서 대출하신 도서 '" + bookName + "'의 반납 예정일은  '" 
			+ expireDate + "'이였으나 반납이 확인 되지 않았습니다.\n총 연체일은 '" + overdueDays + "일'입니다.\n최대한 빠른 반납 부탁드리겠습니다."); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		rentService.updateOverdueSend(no);

		return "redirect:/rent/overdue/list.do";
	}
	
	public void calcStatus(RentDto rentDto) {
		Date pickupDate = rentDto.getReserveDate();
		Date rentDate = rentDto.getRentDate();
		Date expireDate = rentDto.getExpireDate();
		Date returnDate = rentDto.getReturnDate();

		Calendar today = Calendar.getInstance();
		Calendar pickUpCal = Calendar.getInstance();
		Calendar expireCal = Calendar.getInstance();
		
		today.setTime(new Date());
		today.set(Calendar.HOUR_OF_DAY, 0);
		today.set(Calendar.MINUTE, 0);
		today.set(Calendar.SECOND, 0);
		today.set(Calendar.MILLISECOND, 0);
		
		if(rentDate == null) {
			pickUpCal.setTime(pickupDate);
			pickUpCal.set(Calendar.HOUR_OF_DAY, 0);
			pickUpCal.set(Calendar.MINUTE, 0);
			pickUpCal.set(Calendar.SECOND, 0);
			pickUpCal.set(Calendar.MILLISECOND, 0);
			if(today.after(pickUpCal)) {
				rentDto.setRentStatus("예약취소");
			} else {
				rentDto.setRentStatus("예약");
			}
		} else {
			if(returnDate == null) {
				expireCal.setTime(expireDate);
				expireCal.set(Calendar.HOUR_OF_DAY, 0);
				expireCal.set(Calendar.MINUTE, 0);
				expireCal.set(Calendar.SECOND, 0);
				expireCal.set(Calendar.MILLISECOND, 0);
				if(today.after(expireCal)) {
					rentDto.setRentStatus("연체");
				} else {
					rentDto.setRentStatus("대출");
				}
			} else {
				rentDto.setRentStatus("보관");
			}
		}
	}
}
