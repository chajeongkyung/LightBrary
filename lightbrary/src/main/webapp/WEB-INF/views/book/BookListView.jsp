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
		var msgObj = $('#alertInvalidDateMsg');
		
		if(isValidDateRange($('#publishDateStart').val(), $('#publishDateEnd').val())){
			$('#bookListParamDto').submit();
		} else{
			msgObj.addClass('textRed');
			msgObj.html('시작 날짜가 끝 날짜보다 클 수 없습니다.');
		}
	}
	
	function clearDateFnc(obj){
		obj.previousElementSibling.value = "";
	}
	
	function getStatusCodebyName(name){
		for (var i = 0; i < bookStatusObj.length; i++) {
			if(bookStatusObj[i].name == name){
				return bookStatusObj[i].code;
			}
		}
	}
	
	function searchStatusAllFnc(){
		$('#searchStatus').val("-1");
		bookListParamDtoSubmit();
	}
	
	function searchStatusDamagedFnc(){
		$('#searchStatus').val(getStatusCodebyName("파손"));
		bookListParamDtoSubmit();
	}
	
	function searchStatusLostFnc(){
		$('#searchStatus').val(getStatusCodebyName("분실"));
		bookListParamDtoSubmit();
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
								<input type="text" id="name" name="searchName" class='searchInput' value='${bookListParamDto.searchName}'>
							</div>
						</div>
						<!-- //기본 인풋 end -->
						<!-- 기본 인풋 start -->
						<div class='searchInputWrap fs0'>
							<span class='label text bold'>저자</span>
							<div class='searchInputBox'>
								<input type="text" id="writer" name="searchWriter" class='searchInput' value='${bookListParamDto.searchWriter}'>
							</div>
						</div>
						<!-- //기본 인풋 end -->
						<!-- 기본 인풋 start -->
						<div class='searchInputWrap fs0'>
							<span class='label text bold'>출판사</span>
							<div class='searchInputBox'>
								<input type="text" id="publish" name="searchPublish" class='searchInput' value='${bookListParamDto.searchPublish}'>
							</div>
						</div>
						<!-- //기본 인풋 end -->
						
						<!-- 기간 범위 인풋 (달력) start -->
						<div class='searchInputWrap fs0'>
							<span class='label text bold'>출판일</span>
							<div class='searchInputBox overH'>
								<div class='dateInputBox fLeft'>
									<input type="text" id="publishDateStart" name="publishDateStart" class='searchInput searchDate fLeft datePicker' readonly="readonly" value='${bookListParamDto.publishDateStart}'>
									<button type="button" class='clear' onclick='clearDateFnc(this);'></button>
								</div>
								<span class='range fLeft text bold'>~</span>
								<div class='dateInputBox fRight'>
									<input type="text" id="publishDateEnd" name="publishDateEnd" class='searchInput searchDate fRight datePicker' readonly="readonly" value='${bookListParamDto.publishDateEnd}'>
									<button type="button" class='clear' onclick='clearDateFnc(this);'></button>
								</div>
							</div>
							<p style="margin:5px 0px 5px 95px; font-size:13px;" id="alertInvalidDateMsg"></p>
						</div>
						<!-- //기간 범위 인풋 (달력) end -->
						
						<!-- 분류 셀렉트 박스 start -->
						<div class='searchInputWrap fs0'>
							<span class='label text bold'>분류</span>
							<div class='searchInputBox overH'>
								<input type="hidden" id="hiddenBookCategory1" value="${bookListParamDto.searchCategory1}">
								<select id='bookCategory1' name="searchCategory1" class='searchSelect fLeft dark text'>
								</select>
								<input type="hidden" id="hiddenBookCategory2" value="${bookListParamDto.searchCategory2}">
								<select id='bookCategory2' name="searchCategory2" class='searchSelect fLeft med text'>
									<option value="">중분류</option>
								</select>
								<input type="hidden" id="hiddenBookCategory3" value="${bookListParamDto.searchCategory3}">
								<select id='bookCategory3' name="searchCategory3" class='searchSelect fLeft light text'>
									<option value="">소분류</option>
								</select>
							</div>
						</div>
						<!-- //분류 셀렉트 박스 end -->
						<input type="hidden" id="searchStatus" name="searchStatus" value="-1">
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
						<c:choose>
							<c:when test="${member.gradeCode eq 0}">
								<li>
									<a href="#none" class='text' onclick="searchStatusAllFnc();">전체도서 보기</a>
								</li>
								<li>
									<a href="#none" class='text' onclick="searchStatusDamagedFnc();">파손도서 보기</a>
								</li>
								<li>
									<a href="#none" class='text' onclick="searchStatusLostFnc();">분실도서 보기</a>
								</li>
							</c:when>
							<c:when test="${member.gradeCode eq 1}">
								<li>
									<a href="#none" class='text'>대출 예약</a>
								</li>
							</c:when>
						</c:choose>
					</ul>
					<input type="hidden" id="searchStatus" name="searchStatus" value="">
				</div>
				<!-- 책 정보가 없을때 start -->
				<c:if test="${empty bookDtoList}">
					<div style="text-align: center; font-size: 16px; color: #686868; height:100px; margin-top: 100px;">해당 도서가 없습니다.</div>
				</c:if>
				<!-- 책 정보가 없을때 end -->
				<ul id='bookList'>
					<!-- 책 정보 출력 start -->
					<c:forEach var="bookDto" items="${bookDtoList}">					
						<li>
						<!-- 동그란 체크박스 start -->
						<div class='checkbox type1'>
							<input type="checkbox" id='chk${bookDto.no}' value='${bookDto.no}'>
							<label for="chk${bookDto.no}"></label>
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
								<c:if test="${member.gradeCode eq 1}">
									<li>
										<a href="#none" class="text bold">대출 예약</a> 
									</li>
								</c:if>
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
					<c:if test="${member.gradeCode eq 0}">
						<li>
							<a href="./insert.do" class='text'>단편도서 등록</a>
						</li>
						<li>
							<a href="./insertBatch.do" class='text'>시리즈 등록</a>
						</li>
					</c:if>
				</ul>
				
				<jsp:include page="/WEB-INF/views/common/paging.jsp">
					<jsp:param value="${pagingInfo}" name="pagingMap"/>
				</jsp:include>
				
				<form name="bookListParamDto" action="./list.do" id='pagingForm' method="post">
					<input type="hidden" id='curPage' name='curPage' 
						value="${bookListParamDto.curPage}">
					<input type="hidden" name="searchName" value="${bookListParamDto.searchName}">
					<input type="hidden" name="searchWriter" value="${bookListParamDto.searchWriter}">
					<input type="hidden" name="searchPublish" value="${bookListParamDto.searchPublish}">
					<input type="hidden" name="publishDateStart" value="${bookListParamDto.publishDateStart}">
					<input type="hidden" name="publishDateEnd" value="${bookListParamDto.publishDateEnd}">
					<input type="hidden" name="searchCategory1" value="${bookListParamDto.searchCategory1}">
					<input type="hidden" name="searchCategory2" value="${bookListParamDto.searchCategory2}">
					<input type="hidden" name="searchCategory3" value="${bookListParamDto.searchCategory3}">
					<input type="hidden" name="searchStatus" value="${bookListParamDto.searchStatus}">
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