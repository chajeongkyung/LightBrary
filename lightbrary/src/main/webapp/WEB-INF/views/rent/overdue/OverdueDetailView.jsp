<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Lightbrary : 연체 도서 상세</title>

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
			if(confirm("선택하신 도서의 반납처리를 진행하시겠습니까?")){
				alert("선택하신 도서의 반납처리가 성공적으로 처리되었습니다.");
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
	
	// 이메일 전송
	function sendEmailFnc(clickObj) {
		var url = "";
		var no = $(clickObj).parent().find('#no').val();
		var userEmail = $(clickObj).parent().find('.userEmail').val();
		var memberName = $(clickObj).parent().find('.memberName').val();
		var bookName = $(clickObj).parent().find('.bookName').val();
		var overdueDays = $(clickObj).parent().find('.overdueDays').val();
		var expireDate = $('#expireDateObj').html();
		
		url = "./detailSendEmail.do?";
		url += "no=" + no;
		url += "&userEmail=" + userEmail;
		url += "&memberName=" + memberName;
		url += "&bookName=" + bookName;
		url += "&overdueDays=" + overdueDays;
		url += "&expireDate=" + expireDate;
		
		if(confirm('반납일 안내 이메일을 전송하시겠습니까?')){
			alert('반납일 안내 이메일이 전송되었습니다.');
			location.href = url;
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
			<h2 id='pageTitle'>연체 도서 상세</h2>
			
			<!-- 상세페이지 start -->
			<form action="./statusUpdateCtr.do" method="post">
				<div id='detailWrap'>
					<c:url var="imgUrl" value='/img/${rentDto.imageName}'/>
					<div id='bookImage' class='bgCover' style="background-image: url('${imgUrl}')"></div>
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
									<th class='text bold textDark'>반납예정일</th>
									<td class='text textGrey' id='expireDateObj'>
										<fmt:formatDate value="${rentDto.expireDate}" pattern="yyyy/MM/dd "/>
									</td>
								</tr>
								<tr>
									<th class='text bold textDark'>반납여부</th>
									<td class='text textRed bold'>
										${rentDto.bookStatus} ${rentDto.overdueDays}일
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
						<input type="hidden" id='no' value="${rentDto.no}" name="no">
						<input type="hidden" value="${rentDto.bookNo}" name="bookNo">
						<input type="hidden" value="${rentDto.rentStatus}" name="bookStatus">
						
						<input type="hidden" id='searchOption' name="searchOption" value="${searchOption}">
						<input type="hidden" id='keyword' name="keyword" value="${keyword}">
						
						<a href="#none" class='btn grey' onclick='pageMoveListFnc();'>목록</a>
						
						<input type="hidden" class='userEmail' value="${rentDto.email}">
						<input type="hidden" class='memberName' value="${rentDto.mname}">
						<input type="hidden" class='bookName' value="${rentDto.bookName}">
						<input type="hidden" class='overdueDays' value="${rentDto.overdueDays}">
						<c:choose>
							<c:when test="${rentDto.overdueSendFlag eq 'Y'}">
								<button type="button" class='btn grey disabled'>반납 안내 이메일 발송</button>
							</c:when>
							<c:otherwise>
								<button type="button" class='btn grey' onclick="sendEmailFnc(this);">연체 안내 이메일 발송</button>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${rentDto.bookStatus eq '보관'}">
								<button type="submit" id='changeStatus' class='btn grey disabled' disabled="disabled">반납 처리</button>
							</c:when>
							<c:otherwise>
								<button type="submit" id='changeStatus' class='btn green'>반납 처리</button>
							</c:otherwise>
						</c:choose>
						
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