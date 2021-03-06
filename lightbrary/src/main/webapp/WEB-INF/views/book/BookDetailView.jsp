<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>LightBrary : 도서 상세</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bookCategorySelect.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bookStatusSelect.js"></script>

<script type="text/javascript">
	$(function(){
		if($('#gradeCode').val() == 0){
			$('#bookNav').addClass('active');
			$('#bookDepth2 > li:nth-child(1)').addClass('active');
		} else{
			$('#depth1Ul > li:nth-child(1)').addClass('active');
		}
		
		bookCategorySelect();
		bookStatusSelect();
	});
	
	function bookCategoryOnload(){
		var categoryCode = $('#bookCategoryCode').html();
		firstCode = parseInt(categoryCode / 100) * 100;
		secondCode = parseInt(categoryCode / 10) * 10;
		thirdCode = parseInt(categoryCode);
		
		var resultStr = bookCategoryObj[firstCode].name
			+ " / " + bookCategoryObj[secondCode].name
			+ " / " + bookCategoryObj[thirdCode].name;
		
		$('#bookCategoryCode').html(resultStr);
	}
	
	function bookStatusOnload(){
		$('#bookStatus').html(bookStatusObj[parseInt($('#bookStatus').html())].name);
	}
	
	function moveListFnc(){
		$('#bookListParamDto').submit();
	}
	
	function moveUpdateFnc(){
		$('#bookListParamDto').attr("action", "./update.do");
		$('#bookListParamDto').submit();
	}
	
	function moveReserveFnc() {
		var bookNoObj = $('#no');
		
		if(confirm('도서의 대출 예약을 하시겠습니까?')){
			alert('대출 가능한 날짜는 오늘로 부터 5일입니다.\n픽업일 내에 도서를 찾아가지 않을 시 예약은 취소됩니다.\n"나의 예약 현황"으로 이동합니다.');
			
			$('#no').val(bookNoObj.val());
			$('#bookListParamDto').attr("action", "./detailReserve.do");
			$('#bookListParamDto').submit();
			
			return;
		} else{
			return false;
		}
	}
</script>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header.jsp" />
		
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>도서 상세</h2>
			
			<!-- 도서 등록 start -->
			<div id='detailWrap'>
				<c:url var="imgUrl" value='/img/${bookDto.imageName}'/>
				<div id='bookImage' class='bgCover' style="margin: auto; background-image: url('${imgUrl}')"></div>
				<div class='detailTable detailInputTable'>
					<p class='text bold textDark'>도서정보</p>
					<table>
						<colgroup>
							<col width="214px">
							<col width="786px">
						</colgroup>
						<tbody>
							<tr>
								<th class='text bold textDark inputTh'>분류</th>
								<td id='bookCategoryCode' class='text textGrey'>${bookDto.categoryCode}</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>제목</th>
								<td class='text textGrey'>${bookDto.name}</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>저자</th>
								<td class='text textGrey'>${bookDto.writer}</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>출판사</th>
								<td class='text textGrey'>${bookDto.publish }</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>출판일</th>
								<td class='text textGrey'>
								<fmt:formatDate var="fommatedPublishDate" value="${bookDto.publishDate}" pattern="yyyy/MM/dd"/>
								${fommatedPublishDate}
								</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>상태</th>
								<c:choose>
									<c:when test="${bookDto.statusCode eq 1 || bookDto.statusCode eq 2}">
										<td id='bookStatus' class='text textGreen bold'>${bookDto.statusCode}</td>
									</c:when>
									<c:when test="${bookDto.statusCode eq 3 || bookDto.statusCode eq 4 || bookDto.statusCode eq 5}">
										<td id='bookStatus' class='text textRed bold'>${bookDto.statusCode}</td>
									</c:when>
									<c:otherwise>
										<td id='bookStatus' class='text textGrey bold'>${bookDto.statusCode}</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</tbody>
					</table>
				</div>
				
				<!-- 상세페이지 버튼 start -->
				<div class='btnWrap viewBtns fs0 tCenter'>
					<a href="#none" id='listBtn' onclick='moveListFnc()' class='btn grey'>목록</a>
					<c:if test="${member.gradeCode eq 0}">
						<a href="#none" id='updateBtn' onclick='moveUpdateFnc()' class='btn green'>수정</a>
					</c:if>
					<c:if test="${member.gradeCode eq 1}">
						<c:choose>
							<c:when test="${bookDto.statusCode eq 0}">
								<input type="hidden" id="memberNo" name="memberNo" value="${member.no}">
								<input type="hidden" id="rentNo" name="rentNo" value="${rentDto.no}">
								<a href="#none" id='reserveBtn' onclick='moveReserveFnc()' class='btn green'>도서 대출 예약</a>
							</c:when>
							<c:otherwise>
								<a href="#none" class='btn green disabled'>도서 대출 예약</a>
							</c:otherwise>
						</c:choose>
					</c:if>
				</div>
				
				<form name="bookListParamDto" action="./list.do" id='bookListParamDto' method="post">
					<input type="hidden" id="no" name="no" value="${bookDto.no}">
					<input type="hidden" id='curPage' name='curPage' value="${bookListParamDto.curPage}">
					<input type="hidden" id="searchName" name="searchName" value="${bookListParamDto.searchName}">
					<input type="hidden" id="searchWriter" name="searchWriter" value="${bookListParamDto.searchWriter}">
					<input type="hidden" id="searchPublish" name="searchPublish" value="${bookListParamDto.searchPublish}">
					<input type="hidden" id="publishDateStart" name="publishDateStart" value="${bookListParamDto.publishDateStart}">
					<input type="hidden" id="publishDateEnd" name="publishDateEnd" value="${bookListParamDto.publishDateEnd}">
					<input type="hidden" id="searchCategory1" name="searchCategory1" value="${bookListParamDto.searchCategory1}">
					<input type="hidden" id="searchCategory2" name="searchCategory2" value="${bookListParamDto.searchCategory2}">
					<input type="hidden" id="searchCategory3" name="searchCategory3" value="${bookListParamDto.searchCategory3}">
					<input type="hidden" id="searchStatus" name="searchStatus" value="${bookListParamDto.searchStatus}">
				</form>
				<!-- //상세페이지 버튼 end -->
			</div>
			<!-- //도서등록 end -->
			
			<input type="hidden" name="gradeCode" id='gradeCode' value="${member.gradeCode}">
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail_temp.jsp" />
	</div>

</body>

</html>