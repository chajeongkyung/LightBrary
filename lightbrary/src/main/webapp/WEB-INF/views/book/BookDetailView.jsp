<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</script>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header_temp.jsp" />
		
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>도서 상세</h2>
			
			<!-- 도서 등록 start -->
			<div id='detailWrap'>
				<div id='bookImage' class='bgCover' style="margin: auto; background-image: url('<%=request.getContextPath()%>/resources/img/noimage.jpg')"></div>
				<div class='detailTable detailInputTable'>
					<p class='text bold textDark'>도서정보</p>
					<table>
						<colgroup>
							<col width="214px">
							<col width="786px">
						</colgroup>
						<tbody>
							<tr>
								<th class='text bold textDark'>도서 코드</th>
								<td class='text textGrey'>${bookDto.bookCode}</td>
							</tr>
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
								<td class='text textGrey'>${bookDto.writer }</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>출판사</th>
								<td class='text textGrey'>${bookDto.publish }</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>출판일</th>
								<td class='text textGrey'>
								<fmt:formatDate var="fommatedPublishDate" value="${bookDto.publishDate}" pattern="yyyy-MM-dd"/>
								${fommatedPublishDate}
								</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>상태</th>
								<td id='bookStatus' class='text textGrey'>${bookDto.statusCode}</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<!-- 상세페이지 버튼 start -->
				<div class='btnWrap viewBtns fs0 tCenter'>
					<a href="#none" class='btn grey'>수정</a>
					<a href="#none" id='listBtn' onclick='moveListFnc()' class='btn green'>목록</a>
				</div>
				
				<form name="bookListParamDto" action="./list.do" id='bookListParamDto' method="post">
					<input type="hidden" id='curPage' name='curPage' value="${bookListParamDto.curPage}">
					<input type="hidden" id="name" name="name" value="${bookListParamDto.name}">
					<input type="hidden" id="writer" name="writer" value="${bookListParamDto.writer}">
					<input type="hidden" id="publish" name="publish" value="${bookListParamDto.publish}">
					<input type="hidden" id="publishDateStart" name="publishDateStart" value="${bookListParamDto.publishDateStart}">
					<input type="hidden" id="publishDateEnd" name="publishDateEnd" value="${bookListParamDto.publishDateEnd}">
					<input type="hidden" id="bookCategory1" name="bookCategory1" value="${bookListParamDto.bookCategory1}">
					<input type="hidden" id="bookCategory2" name="bookCategory2" value="${bookListParamDto.bookCategory2}">
					<input type="hidden" id="bookCategory3" name="bookCategory3" value="${bookListParamDto.bookCategory3}">
				</form>
				<!-- //상세페이지 버튼 end -->
			</div>
			<!-- //도서등록 end -->
			
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail_temp.jsp" />
	</div>

</body>

</html>