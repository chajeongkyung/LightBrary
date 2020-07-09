<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Lightbrary : 나의예약현황</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">

<style type="text/css">
	.returned td>*{opacity: 0.5;}
</style>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
// 		// depth1 네비
// 		$('#depth1Ul > li:nth-child(2)').addClass('active');
// 		// depth2 네비
// 		$('#depth1Ul > li.active > .depth2Ul > li:nth-child(3)').addClass('active');
	});
	
	// 상세페이지로 이동
	function listOnePageFnc(clickObj){	
		var reserveNoObj = '';
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		
		reserveNoObj = $(clickObj).parent().parent().find('input[type="hidden"]');
		
		var url = '';
		
		url += './detail.do?';
		url += 'no=' + reserveNoObj.val();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		
		location.href = url;
	
		return false;
	}
</script>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header.jsp" />
		
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>나의예약현황</h2>
			
			<!-- 검색폼 버전2 start -->
			<div class='searchForm type2'>
			
				<!-- 기간설정 탭 start -->
				<ul class='rangeTabs fs0 tCenter' style="margin-bottom: 22px;">
					<li class='active'>
						<a href="#none">최근 1주일</a>
					</li>
					<li>
						<a href="#none">1개월</a>
					</li>
					<li>
						<a href="#none">3개월</a>
					</li>
					<li>
						<a href="#none">6개월</a>
					</li>
				</ul>
				<!-- //기간설정 탭 end -->
				
				<!-- 기간 조회 start -->
				<form action="" id='viewWithinDates'>
					<fieldset>
						<div class='searchInputBox overH'>
							<div class='dateInputBox fLeft'>
								<input type="text" id="dateStart" class='searchInput searchDate' readonly="readonly">
								<button type="button" class='clear'></button>
							</div>
							<span class='range fLeft text bold'>~</span>
							<div class='dateInputBox fLeft' style="margin-left:3px">
								<input type="text" id="dateEnd" class='searchInput searchDate fLeft' readonly="readonly">
								<button type="button" class='clear'></button>
							</div>
							<div class='btnWrap fs0 tCenter fRight'>
								<input type="submit" class='btn grey' value="조회">
							</div>
						</div>
					</fieldset>
				</form>
				<!-- //기간 조회 end -->
				
				<!-- 셀렉트 검색 start -->
				<form action="./list.do" id='selectSearch' method="post" style="margin-top: 65px;">
					<fieldset class="overH" style="height: 50px;">
						<select id='searchOption' name='searchOption' class='searchSelect fLeft text'>
							<c:choose>
								<c:when test="${searchMap.searchOption eq 'all'}">
									<option value="all" selected="selected">전체 검색</option>
									<option value="bookName">도서 제목</option>
									<option value="writer">저자</option>
									<option value="publish">출판사</option>
									<option value="mname">회원명</option>
									<option value="email">이메일</option>
								</c:when>
								
								<c:when test="${searchMap.searchOption eq 'bookName'}">
									<option value="all">전체 검색</option>
									<option value="bookName" selected="selected">도서 제목</option>
									<option value="writer">저자</option>
									<option value="publish">출판사</option>
									<option value="mname">회원명</option>
									<option value="email">이메일</option>
								</c:when>
					
								<c:when test="${searchMap.searchOption eq 'writer'}">
									<option value="all">전체 검색</option>
									<option value="bookName">도서 제목</option>
									<option value="writer" selected="selected">저자</option>
									<option value="publish">출판사</option>
									<option value="mname">회원명</option>
									<option value="email">이메일</option>
								</c:when>
								
								<c:when test="${searchMap.searchOption eq 'publish'}">
									<option value="all">전체 검색</option>
									<option value="bookName">도서 제목</option>
									<option value="writer">저자</option>
									<option value="publish" selected="selected">출판사</option>
									<option value="mname">회원명</option>
									<option value="email">이메일</option>
								</c:when>
								
								<c:when test="${searchMap.searchOption eq 'mname'}">
									<option value="all">전체 검색</option>
									<option value="bookName">도서 제목</option>
									<option value="writer">저자</option>
									<option value="mname" selected="selected">회원명</option>
									<option value="email">이메일</option>
								</c:when>
								
								<c:when test="${searchMap.searchOption eq 'email'}">
									<option value="all">전체 검색</option>
									<option value="bookName">도서 제목</option>
									<option value="writer">저자</option>
									<option value="publish">출판사</option>
									<option value="mname">회원명</option>
									<option value="email" selected="selected">이메일</option>
								</c:when>
							</c:choose>
						</select>
						<input type="text" id='keyword' class='searchInput fLeft' name="keyword" value="${searchMap.keyword}">
						<div class='btnWrap fs0 tCenter fRight'>
							<input type="submit" class='btn green' value="검색">
						</div>
					</fieldset>
				</form>
				<!-- //셀렉트 검색 end -->
				
			</div>
			<!-- //검색폼 버전2 end -->
			
			<!-- 도서목록 start -->
			<div id='bookListWrap' style="margin-top: 45px;">
				<div class='listSettings overH'>
					<!-- 동그란 체크박스 전체선택 start -->
					<div class='selectAll checkbox type1 fLeft'>
						<input type="checkbox" id='all'>
						<label class='text bold' for="all">
							<span>전체선택</span>
						</label>
					</div>
					<!-- 동그란 체크박스 전체선택 end -->
					<ul class='settings fRight fs0'>
						<li>
							<a href="#none" class='text'>선택 예약 취소</a>
						</li>
					</ul>
				</div>
				<ul id='bookList'>
					<c:forEach var="rentDto" items="${myReserveList}">
						<!--  -->
						<li>
							<!-- 동그란 체크박스 start -->
							<div class='checkbox type1'>
								<input type="checkbox" id='check1'>
								<label for="check1"></label>
							</div>
							<!-- //동그란 체크박스 end -->
							<span class='num'>1</span>
							<a href="#none" class="fLeft">
								<span class='bookImage bgCover' style="background-image: url('<%=request.getContextPath()%>/resources/img/book-img1-limgaejang.jpg');"></span>
							</a>
							<div class='bookInfo fLeft'>
								<a href="#none" class='bookTitle ellipsis'>${rentDto.bookName}</a>
								<p class='text ellipsis'>${rentDto.writer}</p>
								<p class='text ellipsis'>${rentDto.publish}</p>
								<p class='text'>
									<fmt:formatDate value="${rentDto.publishDate}" pattern="yyyy/MM/dd "/>
								</p>
							</div>
							<div class='listOptions fRight'>
								<ul class='listOptionsUl fs0'>
									<li>
										<a href="#none" class="text bold">예약 취소</a> 
									</li>
								</ul>
							</div>
						</li>
						<!--  -->
					</c:forEach>
				</ul>
				
				<jsp:include page="/WEB-INF/views/common/paging.jsp" />
			</div>
			<!-- //도서목록 end -->
			
			<c:if test="${!empty reserveList}">
				<jsp:include page="/WEB-INF/views/common/paging.jsp">
					<jsp:param value="${pagingInfo}" name="pagingMap"/>
				</jsp:include>
				
				<form action="./list.do" id='pagingForm' method="post">
					<input type="hidden" id='curPage' name='curPage' 
						value="${pagingInfo.curPage}">
				</form>
			</c:if>
			
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
	</div>

</body>

</html>