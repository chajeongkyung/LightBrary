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
		var myNoObj = $('#myNo');
		var searchOptionObj = $('#searchOption');
		var keywordObj = $('#keyword');
		
		reserveNoObj = $(clickObj).parent().parent().find('.no');
		
		var url = '';
		
		url += './detail.do?';
		url += 'no=' + reserveNoObj.val();
		url += '&myNo=' + myNoObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		url += '&keyword=' + keywordObj.val();
		
		location.href = url;
	
		return false;
	}
	
	// 예약 취소
	function cancelReserveFnc(clickObj) {
		var noObj = $(clickObj).parent().find('.no');
		var myNoObj = $('#myNo');
		var bookNoObj = $(clickObj).parent().find('.bookNo');
		
		var url = '';
		url += './statusUpdateCtr.do?';
		url += 'no=' + noObj.val();
		url += '&myNo=' + myNoObj.val();
		url += '&bookNo=' + bookNoObj.val();
		
		if(confirm('선택 도서의 대출 예약을 취소하시겠습니까?')){
			alert('도서의 대출 예약이 취소되었습니다.');
			
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
			<h2 id='pageTitle'>나의예약현황</h2>
			
			<!-- 검색폼 버전2 start -->
			<div class='searchForm type2'>
				<!-- 셀렉트 검색 start -->
				<form action="./list.do" id='selectSearch' method="post">
					<fieldset class="overH" style="height: 50px;">
						<select id='searchOption' name='searchOption' class='searchSelect fLeft text'>
							<c:choose>
								<c:when test="${searchMap.searchOption eq 'all'}">
									<option value="all" selected="selected">전체 검색</option>
									<option value="bookName">도서 제목</option>
									<option value="writer">저자</option>
									<option value="publish">출판사</option>
								</c:when>
								
								<c:when test="${searchMap.searchOption eq 'bookName'}">
									<option value="all">전체 검색</option>
									<option value="bookName" selected="selected">도서 제목</option>
									<option value="writer">저자</option>
									<option value="publish">출판사</option>
								</c:when>
					
								<c:when test="${searchMap.searchOption eq 'writer'}">
									<option value="all">전체 검색</option>
									<option value="bookName">도서 제목</option>
									<option value="writer" selected="selected">저자</option>
									<option value="publish">출판사</option>
								</c:when>
								
								<c:when test="${searchMap.searchOption eq 'publish'}">
									<option value="all">전체 검색</option>
									<option value="bookName">도서 제목</option>
									<option value="writer">저자</option>
									<option value="publish" selected="selected">출판사</option>
								</c:when>
							</c:choose>
						</select>
						<input type="text" id='keyword' class='searchInput fLeft' name="keyword" value="${searchMap.keyword}">
						<input type="hidden" id='myNo' name="myNo" value="${member.no}">
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
					<!--  -->
					<c:if test="${empty myReserveList}">
						<li style="text-align: center; padding-top: 81px;">
							<span style="font-size: 16px; color: #686868;">예약 도서가 없습니다.</span>
						</li>
					</c:if>
					<!--  -->
					<c:forEach var="rentDto" items="${myReserveList}">
						<li>
							<!-- 동그란 체크박스 start -->
							<div class='checkbox type1'>
								<input type="checkbox" id='check${rentDto.no}'>
								<label for="check${rentDto.no}"></label>
							</div>
							<!-- //동그란 체크박스 end -->
							<span class='num'>${rentDto.rnum}</span>
							<a href="#none" onclick="listOnePageFnc(this);" class="fLeft">
								<span class='bookImage bgCover' 
									style="background-image: url('<%=request.getContextPath()%>/resources/img/book-img1-limgaejang.jpg');">
								</span>
							</a>
							<input type="hidden" name="no" class='no' value="${rentDto.no}">
							<div class='bookInfo fLeft'>
								<a href="#none" onclick="listOnePageFnc(this);" class='bookTitle ellipsis'>${rentDto.bookName}</a>
								<p class='text ellipsis'>${rentDto.writer}</p>
								<p class='text ellipsis'>${rentDto.publish}</p>
								<p class='text'>
									<fmt:formatDate value="${rentDto.publishDate}" pattern="yyyy/MM/dd "/>
								</p>
							</div>
							<div class='listOptions fRight'>
								<ul class='listOptionsUl fs0'>
									<li>
										<input type="hidden" name="no" class='no' value="${rentDto.no}">
										<input type="hidden" name="bookNo" class='bookNo' value="${rentDto.bookNo}">
										<a href="#none" class="text bold" onclick="cancelReserveFnc(this);">예약 취소</a> 
									</li>
								</ul>
							</div>
						</li>
						<!--  -->
					</c:forEach>
				</ul>
			</div>
			<!-- //도서목록 end -->
			
			<c:if test="${!empty myReserveList}">
				<jsp:include page="/WEB-INF/views/common/paging.jsp">
					<jsp:param value="${pagingInfo}" name="pagingMap"/>
				</jsp:include>
			</c:if>
			
			<form action="./list.do" id='pagingForm' method="post">
				<input type="hidden" id='curPage' name='curPage' value="${pagingInfo.curPage}">
				<input type="hidden" id='searchOption' name='searchOption' value="${searchMap.searchOption}">
				<input type="hidden" id='keyword' name='keyword' value="${searchMap.keyword}">
				<input type="hidden" id="myNo" name="myNo" value="${member.no}">
			</form>
			
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
	</div>

</body>

</html>