<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>LightBrary : 도서 조회</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/jquery-ui.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

<script type="text/javascript">
	jQuery.browser = {};
	(function () {
	    jQuery.browser.msie = false;
	    jQuery.browser.version = 0;
	    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
	        jQuery.browser.msie = true;
	        jQuery.browser.version = RegExp.$1;
	    }
	})();
	
	$(function(){
		$(".datePicker").datepicker({
			yearRange: "10"
		});
	});
</script>

</head>

<body>
	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header.jsp" />
	
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>도서 조회</h2>
			
			<div class='searchForm type1'>
				<form action="">
					<fieldset>
						<!-- 기본 인풋 start -->
						<div class='searchInputWrap fs0'>
							<span class='label text bold'>제목</span>
							<div class='searchInputBox'>
								<input type="text" id="bookName" class='searchInput'>
							</div>
						</div>
						<!-- //기본 인풋 end -->
						<!-- 기본 인풋 start -->
						<div class='searchInputWrap fs0'>
							<span class='label text bold'>저자</span>
							<div class='searchInputBox'>
								<input type="text" id="bookAuthor" class='searchInput'>
							</div>
						</div>
						<!-- //기본 인풋 end -->
						<!-- 기본 인풋 start -->
						<div class='searchInputWrap fs0'>
							<span class='label text bold'>출판사</span>
							<div class='searchInputBox'>
								<input type="text" id="bookPublish" class='searchInput'>
							</div>
						</div>
						<!-- //기본 인풋 end -->
						
						<!-- 기간 범위 인풋 (달력) start -->
						<div class='searchInputWrap fs0'>
							<span class='label text bold'>출판일</span>
							<div class='searchInputBox overH'>
								<input type="text" id="bookPublishDateStart" class='searchInput searchDate fLeft datePicker' readonly="readonly">
								<span class='range fLeft text bold'>~</span>
								<input type="text" id="bookPublishDateEnd" class='searchInput searchDate fRight datePicker' readonly="readonly">
							</div>
						</div>
						<!-- //기간 범위 인풋 (달력) end -->
						
						<!-- 분류 셀렉트 박스 start -->
						<div class='searchInputWrap fs0'>
							<span class='label text bold'>분류</span>
							<div class='searchInputBox overH'>
								<select id='bookCategory1' class='searchSelect fLeft dark text'>
									<option value="">대분류</option>
									<option value="">대분류</option>
									<option value="">대분류</option>
								</select>
								<select id='bookCategory2' class='searchSelect fLeft med text'>
									<option value="">중분류</option>
								</select>
								<select id='bookCategory3' class='searchSelect fLeft light text'>
									<option value="">소분류</option>
								</select>
							</div>
						</div>
						<!-- //분류 셀렉트 박스 end -->
					</fieldset>
					<div class='btnWrap searchBtnWrap fs0 tCenter'>
						<input type="submit" class='btn green' value="검색">
					</div>
				</form>
			</div>
			
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
							<a href="#none" class='text'>바구니 담기</a>
						</li>
						<li>
							<a href="#none" class='text'>대출 예약</a>
						</li>
					</ul>
				</div>
				<ul id='bookList'>
					<!-- 책 정보 출력 start -->
					<c:forEach var="bookDto" items="${bookDtoList}">					
						<li>
						<!-- 동그란 체크박스 start -->
						<div class='checkbox type1'>
							<input type="checkbox" id='chk1'>
							<label for="chk1"></label>
						</div>
						<!-- //동그란 체크박스 end -->
						
						<span class='num'>${bookDto.no}</span>
						<a href="#none" class="fLeft">
							<span class='bookImage bgCover' style="background-image: url('<%=request.getContextPath()%>/resources/img/book-img1-limgaejang.jpg');"></span>
						</a>
						<div class='bookInfo fLeft'>
							<p class='text'>${bookDto.bookCode}</p>
							<a href="#none" class='bookTitle ellipsis'>${bookDto.name}</a>
							<p class='text ellipsis'>${bookDto.writer}</p>
							<p class='text ellipsis'>${bookDto.publish}</p>
							<p class='text'>${bookDto.publishDate}</p>
						</div>
						<div class='listOptions fRight'>
							<ul class='listOptionsUl fs0'>
								<li>
									<a href="#none" class="text bold">바구니 담기</a> 
								</li>
								<li>
									<a href="#none" class="text bold">대출 예약</a> 
								</li>
							</ul>
							<p class='bookState text'>
								<span class="bold">상태 : </span>
								<span>${bookDto.statusCode}</span>
							</p>
						</div>
						</li>
					</c:forEach>
				</ul>
				
				<jsp:include page="/WEB-INF/views/common/paging.jsp">
					<jsp:param value="${pagingInfo}" name="pagingMap"/>
				</jsp:include>
				
				<form action="./list.do" id='pagingForm' method="get">
					<input type="hidden" id='curPage' name='curPage' 
						value="${pagingInfo.curPage}">
				</form>
				
			</div>
			<!-- 
			이안에 내용 작성 
			-->
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
	</div>

</body>

</html>