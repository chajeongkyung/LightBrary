package com.lightbrary.rent.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lightbrary.rent.model.RentDto;
import com.lightbrary.rent.service.RentService;
import com.lightbrary.util.Paging;


@Controller
public class RentController {

	private static final Logger log = 
		LoggerFactory.getLogger(RentController.class);

	@Autowired
	private RentService rentService;
	
	
	/*******************
			대출
	*******************/
	
	// 대출 목록
	@RequestMapping(value = "/rent/list.do"
			, method = {RequestMethod.GET, RequestMethod.POST})
	public String rentList(@RequestParam(defaultValue = "1") 
			int curPage
			, @RequestParam(defaultValue = "0") int no
			, @RequestParam(defaultValue = "all") String searchOption
			, @RequestParam(defaultValue = "") String keyword
			, Model model) {
		log.info("대출현황목록 : 현재페이지 : " + curPage + " : searchOption = " 
			+ searchOption + " : keyword = " + keyword);
	
		System.out.println();
		// 전체 예약 도서 갯수
		int totalCount = rentService.totalCountRent(searchOption, keyword);
		
		
//				이전 페이지로 회원으이 번호가 명확하게 나온경우
//				자신의 curPage 찾는 로직
		if(no != 0) {
			curPage = rentService.selectRentCurPage(searchOption, keyword, no);
		}
		
		
		Paging pagingInfo = new Paging(totalCount, curPage);
		int start = pagingInfo.getPageBegin();
		int end = pagingInfo.getPageEnd();
		
		List<RentDto> rentList = 
			rentService.selectRent(searchOption, keyword
				, start, end);
		
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
		
		System.out.println("검색 문자 : " + keyword);
		System.out.println("검색 옵션 : " + searchOption);
		
		return "rent/RentListView";
	}
	
	// 대출 상세
	@RequestMapping(value = "/rent/detail.do"
		, method = RequestMethod.GET)
	public String rentDetail(int no, String searchOption,
			String keyword, Model model) {
		log.info("대출 도서 상세 - " + no + "\n" + "검색옵션 : " + searchOption
				+ "\n" + "검색문장 : " + keyword);
		
		RentDto rentDto = rentService.selectOneRent(no);
		
		System.out.println(rentDto.toString());
		
		model.addAttribute("rentDto", rentDto);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		
		return "rent/RentDetailView";
	}
	
	// 대출 상태 변경
	@RequestMapping(value = "/rent/statusUpdateCtr.do"
			, method = RequestMethod.POST)
	public String rentStatusUpdateCtr(RentDto rentDto, Model model) {
		log.info("보관 중으로 변경된 도서 번호 : {}", rentDto.getBookNo());
		
		System.out.println(rentDto.toString());
		
		try {
			rentService.updateOneRentStatus(rentDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		rentDto = rentService.selectOneRent(rentDto.getBookNo()); 
		
		model.addAttribute("no", rentDto.getNo());
		
		return "redirect:/rent/detail.do";
	}
	
	
	/*******************
			예약
	*******************/
	
	// 예약 목록
	@RequestMapping(value = "/rent/reserve/list.do"
			, method = {RequestMethod.GET, RequestMethod.POST})
	public String reserveList(@RequestParam(defaultValue = "1") 
			int curPage
			, @RequestParam(defaultValue = "0") int no
			, @RequestParam(defaultValue = "all") String searchOption
			, @RequestParam(defaultValue = "") String keyword
			, Model model) {
		
		log.info("예약현황목록 : 현재페이지 = " + curPage + " : searchOption = " + searchOption + " : keyword = " + keyword);
	
		System.out.println();
		// 전체 예약 도서 갯수
		int totalCount = rentService.totalCountReserve(searchOption, keyword);
		
		if(no != 0) {
			curPage = rentService.selectReserveCurPage(searchOption, keyword, no);
		}
		System.out.println(curPage);
		System.out.println(totalCount);
		
		Paging pagingInfo = new Paging(totalCount, curPage);
		
		System.out.println("-------------------");
		System.out.println(pagingInfo);
		System.out.println("-------------------");
		int start = pagingInfo.getPageBegin();
		int end = pagingInfo.getPageEnd();
		
		List<RentDto> reserveList = rentService.selectReserve(searchOption, keyword, start, end);
		
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
		
		System.out.println("검색 문자 : " + keyword);
		System.out.println("검색 옵션 : " + searchOption);
		
		return "rent/reserve/ReserveListView";
	}
	
	// 예약 상세
	@RequestMapping(value = "/rent/reserve/detail.do"
		, method = RequestMethod.GET)
	public String reserveView(int no, String searchOption,
			String keyword, Model model) {
		log.info("예약 도서 상세 - " + no + "\n" + "검색옵션 : " + searchOption
				+ "\n" + "검색문장" + keyword);
		
		RentDto rentDto = rentService.selectOneReserve(no);
		
		model.addAttribute("rentDto", rentDto);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		
		return "rent/reserve/ReserveDetailView";
	}
	
	// 예약 상태 변경
	@RequestMapping(value = "/rent/reserve/statusUpdateCtr.do"
			, method = RequestMethod.POST)
	public String reserveStatusUpdateCtr(RentDto rentDto, Model model) {
		log.info("대출 중으로 변경된 도서 번호 : {}", rentDto.getBookNo());
		
		System.out.println(rentDto.toString());
		
		try {
			rentService.updateOneReserveStatus(rentDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/rent/reserve/list.do";
	}
	
	
	/*******************
			연체
	*******************/
	
	// 연체 목록
	@RequestMapping(value = "/rent/overdue/list.do"
		, method = {RequestMethod.GET, RequestMethod.POST})
	public String overdueList(@RequestParam(defaultValue = "1") 
		int curPage
		, @RequestParam(defaultValue = "0") int no
		, @RequestParam(defaultValue = "all") String searchOption
		, @RequestParam(defaultValue = "") String keyword
		, Model model) {
	
		log.info("연체목록 : 현재페이지 = " + curPage + " : searchOption = " + searchOption + " : keyword = " + keyword);
		
		System.out.println();
		// 전체 예약 도서 갯수
		int totalCount = rentService.totalCountOverdue(searchOption, keyword);
		
		if(no != 0) {
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

	// 예약 상세
	@RequestMapping(value = "/rent/overdue/detail.do"
		, method = RequestMethod.GET)
	public String overdueView(int no, String searchOption,
			String keyword, Model model) {
		log.info("연체 도서 상세 - " + no + "\n" + "검색옵션 : " + searchOption
				+ "\n" + "검색문장" + keyword);
		
		RentDto rentDto = rentService.selectOneOverdue(no);
		
		model.addAttribute("rentDto", rentDto);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		
		return "rent/overdue/OverdueDetailView";
	}
	
	// 예약 상태 변경
	@RequestMapping(value = "/rent/overdue/statusUpdateCtr.do"
			, method = RequestMethod.POST)
	public String overdueStatusUpdateCtr(RentDto rentDto, Model model) {
		log.info("대출 중으로 변경된 도서 번호 : {}", rentDto.getBookNo());
		
		System.out.println(rentDto.toString());
		
		try {
			rentService.updateOneOverdueStatus(rentDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/rent/overdue/list.do";
	}
	
}
