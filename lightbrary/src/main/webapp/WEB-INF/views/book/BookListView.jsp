<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>LightBrary : 도서 조회</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bookCategorySelect.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bookStatusSelect.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/validation.js"></script>

<script type="text/javascript">
	
	$(function(){
		bookCategorySelect();
		bookStatusSelect();
	});
	
	function bookStatusOnload(){
		$.each($('span[id^=bookStatus]'), function(idx, item){
			item.innerHTML = bookStatusObj[parseInt(item.innerHTML)].name;
		});
	}
	
	function selectCategorybySearchParam(){
		var category1 = $('#hiddenBookCategory1').val();
		var category2 = $('#hiddenBookCategory2').val();
		var category3 = $('#hiddenBookCategory3').val();
		
		$('#bookCategory1').val(category1);
		$('#bookCategory1').trigger("change");
		$('#bookCategory2').val(category2);
		$('#bookCategory2').trigger("change");
		$('#bookCategory3').val(category3);
		
	}
	
	function bookCategoryOnload(){
		initBookCategory();
		selectCategorybySearchParam();
	}
	
	function bookDetailMove(obj){
		$('#no').val(obj);
		$('#pagingForm').attr("action", "./detail.do");
		$('#pagingForm').submit();
	}
	
	function bookListParamDtoSubmit(){
		if(isValidDateRange($('#publishDateStart').val(), $('#publishDateEnd').val())){
			$('#bookListParamDto').submit();
		} else{
			alert('시작 날짜가 끝 날짜보다 클 수 없습니다.');
		}
	}
</script>

</head>

<body>
	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header.jsp" />
	
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>도서 조회</h2>
			
			<div class='searchForm type1'>
				<form id="bookListParamDto" name="bookListParamDto" action="./list.do" method="post">
					<fieldset>
						<!-- 기본 인풋 start -->
						<div class='searchInputWrap fs0'>
							<span class='label text bold'>제목</span>
							<div class='searchInputBox'>
								<input type="text" id="name" name="name" class='searchInput' value='${bookListParamDto.name}'>
							</div>
						</div>
						<!-- //기본 인풋 end -->
						<!-- 기본 인풋 start -->
						<div class='searchInputWrap fs0'>
							<span class='label text bold'>저자</span>
							<div class='searchInputBox'>
								<input type="text" id="writer" name="writer" class='searchInput' value='${bookListParamDto.writer}'>
							</div>
						</div>
						<!-- //기본 인풋 end -->
						<!-- 기본 인풋 start -->
						<div class='searchInputWrap fs0'>
							<span class='label text bold'>출판사</span>
							<div class='searchInputBox'>
								<input type="text" id="publish" name="publish" class='searchInput' value='${bookListParamDto.publish}'>
							</div>
						</div>
						<!-- //기본 인풋 end -->
						
						<!-- 기간 범위 인풋 (달력) start -->
						<div class='searchInputWrap fs0'>
							<span class='label text bold'>출판일</span>
							<div class='searchInputBox overH'>
								<input type="text" id="publishDateStart" name="publishDateStart" class='searchInput searchDate fLeft datePicker' readonly="readonly" value='${bookListParamDto.publishDateStart}'>
								<span class='range fLeft text bold'>~</span>
								<input type="text" id="publishDateEnd" name="publishDateEnd" class='searchInput searchDate fRight datePicker' readonly="readonly" value='${bookListParamDto.publishDateEnd}'>
							</div>
						</div>
						<!-- //기간 범위 인풋 (달력) end -->
						
						<!-- 분류 셀렉트 박스 start -->
						<div class='searchInputWrap fs0'>
							<span class='label text bold'>분류</span>
							<div class='searchInputBox overH'>
								<input type="hidden" id="hiddenBookCategory1" value="${bookListParamDto.bookCategory1}">
								<select id='bookCategory1' name="bookCategory1" class='searchSelect fLeft dark text'>
								</select>
								<input type="hidden" id="hiddenBookCategory2" value="${bookListParamDto.bookCategory2}">
								<select id='bookCategory2' name="bookCategory2" class='searchSelect fLeft med text'>
									<option value="">중분류</option>
								</select>
								<input type="hidden" id="hiddenBookCategory3" value="${bookListParamDto.bookCategory3}">
								<select id='bookCategory3' name="bookCategory3" class='searchSelect fLeft light text'>
									<option value="">소분류</option>
								</select>
							</div>
						</div>
						<!-- //분류 셀렉트 박스 end -->
					</fieldset>
					<div class='btnWrap searchBtnWrap fs0 tCenter'>
						<input type="button" onclick="bookListParamDtoSubmit();" class='btn green' value="검색">
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
						<a href="#none" onclick="bookDetailMove(${bookDto.no})" class="fLeft">
							<c:url var="imgUrl" value='/img/${bookDto.imageName}'/>
							<span class='bookImage bgCover' style="background-image: url('${imgUrl}');"></span>
						</a>
						<div class='bookInfo fLeft'>
							<a href="#none" onclick="bookDetailMove(${bookDto.no})" class='bookTitle ellipsis'>${bookDto.name}</a>
							<p class='text ellipsis'>${bookDto.writer}</p>
							<p class='text ellipsis'>${bookDto.publish}</p>
							<p class='text'>
								<fmt:formatDate var="fommatedPublishDate" value="${bookDto.publishDate}" pattern="yyyy-MM-dd"/>
								${fommatedPublishDate}
							</p>
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
								<span id='bookStatus${bookDto.no}'>${bookDto.statusCode}</span>
							</p>
						</div>
						</li>
					</c:forEach>
				</ul>
				
				<ul class='settings fRight fs0'>
						<li>
							<a href="./insert.do" class='text'>단편도서 등록</a>
						</li>
						<li>
							<a href="#none" class='text'>시리즈 등록</a>
						</li>
				</ul>
				
				<jsp:include page="/WEB-INF/views/common/paging.jsp">
					<jsp:param value="${pagingInfo}" name="pagingMap"/>
				</jsp:include>
				
				<form name="bookListParamDto" action="./list.do" id='pagingForm' method="post">
					<input type="hidden" id='curPage' name='curPage' 
						value="${bookListParamDto.curPage}">
					<input type="hidden" name="name" value="${bookListParamDto.name}">
					<input type="hidden" name="writer" value="${bookListParamDto.writer}">
					<input type="hidden" name="publish" value="${bookListParamDto.publish}">
					<input type="hidden" name="publishDateStart" value="${bookListParamDto.publishDateStart}">
					<input type="hidden" name="publishDateEnd" value="${bookListParamDto.publishDateEnd}">
					<input type="hidden" name="bookCategory1" value="${bookListParamDto.bookCategory1}">
					<input type="hidden" name="bookCategory2" value="${bookListParamDto.bookCategory2}">
					<input type="hidden" name="bookCategory3" value="${bookListParamDto.bookCategory3}">
					<input type="hidden" id="no" name="no" value="">
				</form>
				
			</div>
			
			<!-- 
			이안에 내용 작성 
			-->
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
		<div id="test"></div>
	</div>

</body>

</html>