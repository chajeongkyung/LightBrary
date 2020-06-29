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
	
	//도서대출 목록
	@RequestMapping(value = "/rent/list.do"
			, method = {RequestMethod.GET, RequestMethod.POST})
	public String rentList(@RequestParam(defaultValue = "1") 
			int curPage
			, @RequestParam(defaultValue = "0") int no
			, @RequestParam(defaultValue = "all") String searchOption
			, @RequestParam(defaultValue = "") String keyword
			, Model model) {
		log.info("대출현황목록 : 현재페이지 : " + curPage + " : " 
			+ searchOption + " : " + keyword);
		// 화면의 form의 이름을 마바티스에 편하게 맞추기 위한 로직
		if("name".equals(searchOption)) {
			searchOption = "mname";
		}
	
		
		// 페이징을 위한 전체 회원목록 갯수
		int totalCount = 
			rentService.rentSelectTotalCount(
				searchOption, keyword
			);
		
		
//		이전 체이지로 회원으이 번호가 명확하게 나온경우
//		자신의 curPage 찾는 로직
		if(no != 0) {
			curPage
				= rentService.rentSelectCurPage(searchOption, keyword, no);
		}
		
		
		Paging rentPaging = new Paging(totalCount, curPage);
		int start = rentPaging.getPageBegin();
		int end = rentPaging.getPageEnd();
		
		List<RentDto> rentList = 
			rentService.rentSelectList(searchOption, keyword
				, start, end);

		// 화면의 form의 이름을 맞추기 위한 작업
		if("mname".equals(searchOption)) {
			searchOption = "name";
		}
		
		// 검색
		HashMap<String, Object> searchMap 
			= new HashMap<String, Object>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);
		
		// 페이징
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("rentPaging", rentPaging);

		model.addAttribute("rentList", rentList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("searchMap", searchMap);
		
		System.out.println("@@@@@@@#################" + keyword);
		System.out.println("@@@@@@@#################" + searchOption);
		
		return "rent/RentListView";
	}
	
}
