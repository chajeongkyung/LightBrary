<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		$('#depth1Ul > li.active > .depth2Ul > li:nth-child(1)').addClass('active');
		
		//분류 문자
		bookCategorySelect();
		
		// 대출중으로 변경
		changeStatusFnc();
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
	
	function changeStatusFnc() {
		$('#changeStatus').click(function() {
			if(confirm("예약된 도서를 대출 중으로 변경하시겠습니까?")){
				alert("도서의 상태가 예약에서 대출 중으로 성공적으로 변경 되었습니다.\n대출 도서는 대출 현황 목록에서 확인해주세요.");
				return;
			}else{
				return false;
			}
		});
	}
	
	function pageMoveListFnc(){
		var noObj = $('#no');
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		
		var url = '';
		
		url += './list.do?';
		url += 'no=' + noObj.val();
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
			<h2 id='pageTitle'>예약 도서 상세</h2>
			
			<!-- 상세페이지 start -->
			<form action="./statusUpdateCtr.do" method="post">
				<div id='detailWrap'>
					<div id='bookImage' class='bgCover' 
						style="background-image: url('<%=request.getContextPath()%>/resources/img/book-img1-limgaejang.jpg')">
					</div>
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
						<p class='text bold textDark'>예약정보</p>
						<table>
							<colgroup>
								<col width="214px">
								<col width="786px">
							</colgroup>
							<tbody>
								<tr>
									<th class='text bold textDark'>픽업일</th>
									<td class='text textGrey'>
										<fmt:formatDate value="${rentDto.pickUpDate}" pattern="yyyy/MM/dd "/>
									</td>
								</tr>
								<tr>
									<th class='text bold textDark'>예약상태</th>
									<td class='text textGreen bold'>
										${rentDto.rentStatus}
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<!--  -->
					<div class='detailTable'>
						<p class='text bold textDark'>회원정보</p>
						<table>
							<colgroup>
								<col width="214px">
								<col width="786px">
							</colgroup>
							<tbody>
								<tr>
									<th class='text bold textDark'>이름</th>
									<td class='text textGrey'>${rentDto.mname}</td>
								</tr>
								<tr>
									<th class='text bold textDark'>이메일</th>
									<td class='text textGrey'>${rentDto.email}</td>
								</tr>
								<tr>
									<th class='text bold textDark'>연락처</th>
									<td class='text textGrey'>${rentDto.phone}</td>
								</tr>
								<tr>
									<th class='text bold textDark'>주소</th>
									<td class='text textGrey'>${rentDto.address}</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<!-- 상세페이지 버튼 start -->
					<div class='btnWrap viewBtns fs0 tCenter'>
						<input type="hidden" id='bookNo' name="bookNo" value="${rentDto.bookNo}">
						
						<button type="submit" id='changeStatus' class='btn grey'>대출 중으로 변경</button>
						
						<input type="hidden" id='no' name="no" value="${rentDto.no}">
						<input type="hidden" id='searchOption' name="searchOption" value="${searchOption}">
						<input type="hidden" id='keyword' name="keyword" value="${keyword}">
						
						<a href="#none" class='btn green' onclick='pageMoveListFnc();'>뒤로</a>
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