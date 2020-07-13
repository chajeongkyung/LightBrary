<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Lightbrary : 예약 도서 상세</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bookCategorySelect.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		// depth1 네비
		$('#depth1Ul > li:nth-child(2)').addClass('active');
		// depth2 네비
		$('#depth1Ul > li.active > .depth2Ul > li:nth-child(3)').addClass('active');
		
		//분류 문자
		bookCategorySelect();
	});
	
	//분류 문자
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
	
	function extendRentFnc() {
		var myNoObj = $('#myNo');
		var noObj = $('#no');
		
		var url = '';
		
		url += './detail/statusUpdateCtr.do?';
		url += 'no=' + noObj.val();
		url += '&myNo=' + myNoObj.val();
		
		if(confirm('선택 도서의 반납일을 3일 연장하시겠습니까?')){
			alert('도서의 반납일이 3일 연장되었습니다.\n반납일 연장은 총 한번만 허용됨을 알려드립니다.');
			
			location.href = url;
			
			return;
		} else{
			return false;
		}
	}
	
	function pageMoveListFnc(){
		var noObj = $('#no');
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		var myNoObj = $('#myNo');
		
		var url = '';
		
		url += './list.do?';
		url += 'no=' + noObj.val();
		url += '&myNo=' + myNoObj.val();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		
		location.href = url;
	}
</script>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header.jsp" />
		
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>나의 예약 도서 상세</h2>
			
			<!-- 상세페이지 start -->
			<form action="./statusUpdateCtr.do" method="post">
				<div id='detailWrap'>
					<div id='bookImage' class='bgCover' style="background-image: url('<%=request.getContextPath()%>/resources/img/book-img1-limgaejang.jpg')"></div>
					<!--  -->
					<div class='detailTable'>
						<p class='text bold textDark'>도서정보</p>
						<table>
							<colgroup>
								<col width="214px">
								<col width="786px">
							</colgroup>
							<tbody>
								<tr>
									<th class='text bold textDark'>분류</th>
									<td id='bookCategoryCode' class='text textGrey'>
										${rentDto.bookCategoryCode}
									</td>
								</tr>
								<tr>
									<th class='text bold textDark'>제목</th>
									<td class='text textGrey'>${rentDto.bookName}</td>
								</tr>
								<tr>
									<th class='text bold textDark'>저자</th>
									<td class='text textGrey'>${rentDto.writer}</td>
								</tr>
								<tr>
									<th class='text bold textDark'>출판사</th>
									<td class='text textGrey'>${rentDto.publish}</td>
								</tr>
								<tr>
									<th class='text bold textDark'>출판일</th>
									<td class='text textGrey'>
										<fmt:formatDate value="${rentDto.publishDate}" pattern="yyyy/MM/dd "/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--  -->
					<div class='detailTable'>
						<p class='text bold textDark'>대출정보</p>
						<table>
							<colgroup>
								<col width="214px">
								<col width="786px">
							</colgroup>
							<tbody>
								<tr>
									<th class='text bold textDark'>상태</th>
									<c:choose>
										<c:when test="${rentDto.bookStatus eq '대출'}">
											<td class='text textGreen bold'>
												${rentDto.bookStatus}
											</td>
										</c:when>
										<c:otherwise>
											<td class='text textRed bold'>
												${rentDto.bookStatus}
											</td>
										</c:otherwise>
									</c:choose>
									
								</tr>
								<tr>
									<th class='text bold textDark'>반납일</th>
									<td class='text textGrey'>
										<fmt:formatDate value="${rentDto.expireDate}" pattern="yyyy/MM/dd "/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<!-- 상세페이지 버튼 start -->
					<div class='btnWrap viewBtns fs0 tCenter'>
						<input type="hidden" id='bookNo' name="bookNo" value="${rentDto.bookNo}">
						
						<button type="submit" class='btn grey' onclick="extendRentFnc();">대출 연장 하기</button>
						
						<input type="hidden" id='no' name="no" value="${rentDto.no}">
						<input type="hidden" id='myNo' name="myNo" value="${member.no}">
						<input type="hidden" id='searchOption' name="searchOption" value="${searchOption}">
						<input type="hidden" id='keyword' name="keyword" value="${keyword}">
						
						<a href="#none" class='btn green' onclick='pageMoveListFnc();'>목록</a>
					</div>
					<!-- //상세페이지 버튼 end -->
				</div>
				<!-- //상세페이지 end -->
			</form>
			
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
	</div>

</body>

</html>