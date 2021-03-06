<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Lightbrary : 도서대출현황</title>

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
		
		// 상태 분류 탭
		statusTab();
		
		var statusObj = $('#status');
		
		if(statusObj.val() == 'statusAll'){
			$('#statusAll').parent().addClass('active');
			$('#statusAll').parent().siblings().removeClass('active');
		} else if(statusObj.val() == 'statusRent'){
			$('#statusRent').parent().addClass('active');
			$('#statusRent').parent().siblings().removeClass('active');
		} else if(statusObj.val() == 'statusKeep'){
			$('#statusKeep').parent().addClass('active');
			$('#statusKeep').parent().siblings().removeClass('active');
		}
		
	});
	
	// 상태 분류 탭
	function statusTab() {
		
		var curPageObj = $('#curPage');
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		var statusObj = $('#status');
		var statusStr = '';
		var url = '';
		
		url += './list.do?';
		url += 'curPage=' + curPageObj.val();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		
		// 전체
		$('#statusAll').click(function() {
			statusStr = 'statusAll';
			
			url += '&status=' + statusStr;
			
			location.href = url;
		});
		// 대출 중
		$('#statusRent').click(function() {
			statusStr = 'statusRent';
			
			url += '&status=' + statusStr;
			
			location.href = url;
		});
		// 보관 중
		$('#statusKeep').click(function() {
			statusStr = 'statusKeep';
			
			url += '&status=' + statusStr;
			
			location.href = url;
		});
	}
	
	//다중 처리
	function returnBatchFnc() {
		var noObjArr = checkedObjArr();
		var noArr = new Array();
		
		for (var i = 0; i < noObjArr.length; i++) {
			noArr[i] = noObjArr[i].value;
		}
		
		if(noObjArr.length > 0){
			var baseUrl = window.location.protocol + "//" + window.location.host + "/lightbrary/";
			if(confirm("선택하신 도서의 반납처리를 진행하시겠습니까?")){
				$.ajax({
					type: "POST",
					url: baseUrl + 'rent/returnBatch.do',
					data: "noArr=" + noArr,
					success:function(){
						alert('반납처리 되었습니다.');
						$('#pagingForm').submit();
					},
					error: function(){
						alert('오류');
					}
				});
			}else{
				return false;
			}
		} else{
			alert('선택된 도서가 없습니다.');
		}
		
	}
	
	// 상세페이지로 이동
	function listOnePageFnc(clickObj){	
		var noObj = '';
		var searchOptionObj = $('#searchOption');
		var keywordObj = $('#keyword');
		var statusObj = $('#status');
		
		noObj = $(clickObj).parent().parent().find('input[type="hidden"]');
		
		var url = '';
		
		url += './detail.do?';
		url += 'no=' + noObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		url += '&keyword=' + keywordObj.val();
		url += '&status=' + statusObj.val();
		
		location.href = url;
	
		return false;
	}
	
	// 이메일 전송
	function sendEmailFnc(clickObj) {
		var url = "";
		var no = $(clickObj).find('.no').val();
		var userEmail = $(clickObj).find('.userEmail').val();
		var memberName = $(clickObj).find('.memberName').val();
		var bookName = $(clickObj).find('.bookName').val();
		var expireDate = $(clickObj).parent().parent().parent().find('.expireDate span').html();
		
		url = "./sendEmail.do?";
		url += "no=" + no;
		url += "&userEmail=" + userEmail;
		url += "&memberName=" + memberName;
		url += "&bookName=" + bookName;
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
			<h2 id='pageTitle'>도서대출현황</h2>
				
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
					<input type="hidden" id='status' value="${status}">
					<ul class='settings fLeft fs0'>
						<li class='active'>
							<a href="#none" class='text' id='statusAll'>전체 현황 보기</a>
						</li>
						<li>
							<a href="#none" class='text' id='statusRent'>대출 중</a>
						</li>
						<li>
							<a href="#none" class='text' id='statusKeep'>반납완료</a>
						</li>
					</ul>
					<ul class='settings fRight fs0'>
						<li>
							<a href="#none" onclick="returnBatchFnc();" class='text'>선택 반납처리</a>
						</li>
<!-- 						<li> -->
<!-- 							<a href="#none" class='text'>선택 반납일 안내 이메일 발송</a> -->
<!-- 						</li> -->
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
							<col width="202px">
							<col width="90px">
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
								<th>반납여부</th>
								<th>반납예정일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty rentList}">
								<!--  -->
								<tr>
									<td colspan="8" style="text-align: center; padding: 56px 0px;">
										<span style="font-size: 16px; color: #686868;">대출 도서가 없습니다.</span>
									</td>
								</tr>
								<!--  -->	
							</c:if>
							<!--  -->
							<c:forEach var="rentDto" items="${rentList}">
								<c:choose>
									<c:when test="${rentDto.rentStatus eq '보관'}">
										<tr class='returned'>
									</c:when>
									<c:otherwise>
										<tr>
									</c:otherwise>
								</c:choose>
									<td class='checkboxTd'>
										<input type="hidden" value='${rentDto.no}' class='noObj'>
										<!-- 기본 체크박스 start -->
										<div class='checkbox type2 fLeft'>
											<c:choose>
												<c:when test="${rentDto.rentStatus eq '보관'}">
													<input type="checkbox" id='chk${rentDto.no}' disabled="disabled">
													<label for="chk${rentDto.no}" style="cursor: default;"></label>
												</c:when>
												<c:otherwise>
													<input type="checkbox" id='chk${rentDto.no}' value="${rentDto.no}">
													<input type="hidden" id='chk${rentDto.bookNo}' value="${rentDto.bookNo}">
													<label for="chk${rentDto.no}"></label>
												</c:otherwise>
											</c:choose>
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
											<c:if test="${rentDto.returnSendFlag eq 'N'}">
												<c:choose>
													<c:when test="${rentDto.rentStatus eq '대출'}">
														<a href="#none" onclick="sendEmailFnc(this);">
															<input type="hidden" class='no' value="${rentDto.no}">
															<input type="hidden" class='userEmail' value="${rentDto.email}">
															<input type="hidden" class='memberName' value="${rentDto.mname}">
															<input type="hidden" class='bookName' value="${rentDto.bookName}">
															<img alt="이메일" src="<%=request.getContextPath()%>/resources/img/icon-mail.png" 
																style="width: 24px; vertical-align: middle;">
														</a>
													</c:when>
													<c:otherwise>
													 	<img alt="이메일" src="<%=request.getContextPath()%>/resources/img/icon-mail.png" 
													 		style="width: 24px; vertical-align: middle;">
													</c:otherwise>
												</c:choose>
											</c:if>
											${rentDto.email}
										</span>
									</td>
									<td>
										<input type="hidden" value="${rentDto.rentStatus}" name='rentStatus'>
										<c:choose>
											<c:when test="${rentDto.rentStatus eq '대출'}">
												<span class='textGreen'>${rentDto.rentStatus}</span>
											</c:when>
											<c:when test="${rentDto.rentStatus eq '연체'}">
												<span class='textGreen'>
													대출<i class='textRed' style="font-size: 12px;">(${rentDto.rentStatus})</i>
												</span>
											</c:when>
											<c:otherwise>
											 	<span>반납완료</span>
											</c:otherwise>
										</c:choose>
									</td>
									<td class='expireDate' style="text-align: center;">
										<span><fmt:formatDate value="${rentDto.expireDate}" pattern="yyyy/MM/dd "/></span>
									</td>
								</tr>
							</c:forEach>
							<!--  -->
						</tbody>
					</table>
				</div>
			</div>
			<!-- //테이블 목록 end -->
			
			<c:if test="${!empty rentList}">
				<jsp:include page="/WEB-INF/views/common/paging.jsp">
					<jsp:param value="${pagingInfo}" name="pagingMap"/>
				</jsp:include>
			</c:if>
			
			<form action="./list.do" id='pagingForm' method="post">
				<input type="hidden" id='curPage' name='curPage' value="${pagingInfo.curPage}">
				<input type="hidden" id='searchOption' name='searchOption' value="${searchMap.searchOption}">
				<input type="hidden" id='keyword' name='keyword' value="${searchMap.keyword}">
				<input type="hidden" id='status' name='status' value="${status}">
			</form>
			
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
	</div>

</body>

</html>