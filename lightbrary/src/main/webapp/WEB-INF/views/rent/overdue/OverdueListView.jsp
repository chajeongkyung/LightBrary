<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Lightbrary : 연체현황</title>

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
		// depth1 네비
		$('#depth1Ul > li:nth-child(2)').addClass('active');
		// depth2 네비
		$('#depth1Ul > li.active > .depth2Ul > li:nth-child(2)').addClass('active');
	});
	
	function rentCheckedObjArr(){
		return $('input[id^=chk]:checked ~ input[type="hidden"]');
	}
	
	//다중 처리
	function returnBatchFnc() {
		var noObjArr = rentCheckedObjArr();
		var noArr = new Array();
		
		for (var i = 0; i < noObjArr.length; i++) {
			noArr[i] = noObjArr[i].value;
		}
		
		var baseUrl = window.location.protocol + "//" + window.location.host + "/lightbrary/";
		$.ajax({
			type: "POST",
			url: baseUrl + '/rent/returnBatch.do',
			data: "noArr=" + noArr,
			success:function(){
				alert('반납처리 되었습니다.');
				$('#pagingForm').submit();
			},
			error: function(){
				alert('오류');
			}
		});
	}
	
	// 상세페이지로 이동
	function listOnePageFnc(clickObj){	
		var reserveNoObj = '';
		var searchOptionObj = $('#searchOption');
		var keywordObj = $('#keyword');
		
		reserveNoObj = $(clickObj).parent().parent().find('input[type="hidden"]');
		
		var url = '';
		
		url += './detail.do?';
		url += 'no=' + reserveNoObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		url += '&keyword=' + keywordObj.val();
		
		location.href = url;
	
		return false;
	}
	
	function refreshFnc() {
		if(confirm('연체 목록을 업데이트 시키겠습니까?')){
			alert('연체 도서 목록을 업데이트합니다.');
			return;
		} else{
			return false;
		}
	}
	
	// 이메일 전송
	function sendEmailFnc(clickObj) {
		var url = "";
		var no = $(clickObj).find('.no').val();
		var userEmail = $(clickObj).find('.userEmail').val();
		var memberName = $(clickObj).find('.memberName').val();
		var bookName = $(clickObj).find('.bookName').val();
		var overdueDays = $(clickObj).find('.overdueDays').val();
		var expireDate = $(clickObj).parent().parent().parent().find('.expireDate span').html();
		
		url = "./sendEmail.do?";
		url += "no=" + no;
		url += "&userEmail=" + userEmail;
		url += "&memberName=" + memberName;
		url += "&bookName=" + bookName;
		url += "&overdueDays=" + overdueDays;
		url += "&expireDate=" + expireDate;
		
		if(confirm('연체 안내 이메일을 전송하시겠습니까?')){
			alert('연체 안내 이메일이 전송되었습니다.');
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
			<h2 id='pageTitle'>연체현황</h2>
				
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
			
			<!-- 테이블 목록 start -->
			<div id='tableListWrap'>
				<div class='listSettings overH'>
					<ul class='settings fLeft fs0'>
						<li>
							<a href="#none" class='text' onclick="returnBatchFnc();">선택 반납처리</a>
						</li>
						<li>
							<a href="#none" class='text'>선택 연체 안내 이메일 발송</a>
						</li>
					</ul>
					<ul class='settings fRight fs0'>
						<li>
							<a href="./refresh.do" class='text' onclick="refreshFnc();">연체 목록 업데이트</a>
						</li>
					</ul>
				</div>
				<div id='tableWrap'>
					<table id='table'>
						<colgroup>
							<col width="52px">
							<col width="260px">
							<col width="85px">
							<col width="120px">
							<col width="80px">
							<col width="212px">
							<col width="80px">
							<col width="111px">
						</colgroup>
						<thead>
							<tr>
								<th class='checkboxTd'>
									<!-- 기본 체크박스 전체선택 start -->
									<div class='selectAll checkbox type2 fLeft'>
										<input type="checkbox" id='all'>
										<label for="all"></label>
									</div>
									<!-- //기본 체크박스 전체선택 end -->
								</th>
								<th>도서 제목</th>
								<th>저자</th>
								<th>출판사</th>
								<th>회원명</th>
								<th>이메일</th>
								<th>연체일</th>
								<th>반납예정일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty overdueList}">
								<!--  -->
								<tr>
									<td colspan="8" style="text-align: center; padding: 56px 0px;">
										<span style="font-size: 16px; color: #686868;">연체 도서가 없습니다.</span>
									</td>
								</tr>
								<!--  -->	
							</c:if>
							<!--  -->
							<c:forEach var="rentDto" items="${overdueList}">
								<tr>
									<td class='checkboxTd'>
										<input type="hidden" value='${rentDto.no}' class='noObj'>
										<!-- 기본 체크박스 start -->
										<div class='checkbox type2 fLeft'>
											<input type="checkbox" id='chk${rentDto.no}'>
											<input type="hidden" id='check${rentDto.bookNo}'>
											<label for="chk${rentDto.no}"></label>
										</div>
										<!-- //기본 체크박스 end -->
									</td>
									<td>
										<a href="#none" onclick="listOnePageFnc(this);" class='ellipsis'>
											${rentDto.bookName}
										</a>
									</td>
									<td>
										<span class='ellipsis'>${rentDto.writer}</span>
									</td>
									<td>
										<span class='ellipsis'>${rentDto.publish}</span>
									</td>
									<td>
										<span class='ellipsis'>${rentDto.mname}</span>
									</td>
									<td>
										<span class='ellipsis'>
											<c:if test="${rentDto.overdueSendFlag eq 'N'}">
												<a href="#none" onclick="sendEmailFnc(this);">
													<input type="hidden" class='no' value="${rentDto.no}">
													<input type="hidden" class='userEmail' value="${rentDto.email}">
													<input type="hidden" class='memberName' value="${rentDto.mname}">
													<input type="hidden" class='bookName' value="${rentDto.bookName}">
													<input type="hidden" class='overdueDays' value="${rentDto.overdueDays}">
													<img alt="이메일" src="<%=request.getContextPath()%>/resources/img/icon-mail.png" style="width: 24px; vertical-align: middle;">
												</a>
											</c:if>
											${rentDto.email}
										</span>
									</td>
									<td>
										<span>${rentDto.overdueDays}일</span>
									</td>
									<td class='expireDate'>
										<span><fmt:formatDate value="${rentDto.expireDate}" pattern="yyyy/MM/dd"/></span>
									</td>
								</tr>
							</c:forEach>
							<!--  -->
						</tbody>
					</table>
				</div>
			</div>
			<!-- //테이블 목록 end -->
			
			<c:if test="${!empty overdueList}">
				<jsp:include page="/WEB-INF/views/common/paging.jsp">
					<jsp:param value="${pagingInfo}" name="pagingMap"/>
				</jsp:include>
				
				<form action="./list.do" id='pagingForm' method="post">
					<input type="hidden" id='curPage' name='curPage' value="${pagingInfo.curPage}">
					<input type="hidden" id='searchOption' name='searchOption' value="${searchMap.searchOption}">
					<input type="hidden" id='keyword' name='keyword' value="${searchMap.keyword}">
				</form>
			</c:if>
			
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
	</div>

</body>

</html>