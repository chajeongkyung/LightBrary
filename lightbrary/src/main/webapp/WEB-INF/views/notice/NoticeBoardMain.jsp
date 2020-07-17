<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>LightBrary : 공지게시판</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
 

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		if($('#gradeCode').val() == 0){
			$('#depth1Ul > li:nth-child(4)').addClass('active');
		} else{
			$('#depth1Ul > li:nth-child(2)').addClass('active');
		}
	});
	
	
	var value =	$('#hiddenNoticeCategory').val();
	
	
	function deleteBatchFnc() {
		var noObjArr = checkedObjArr();
		var noArr = new Array();
		
		for (var i = 0; i < noObjArr.length; i++) {
			noArr[i] = noObjArr[i].value;
		}
		
		var result = confirm("게시글을 삭제 하시겠습니까?");
		
		if (result) {
			var baseUrl = window.location.protocol + "//" + window.location.host + "/lightbrary/";
			$.ajax({
				type: "POST",
				url: baseUrl + '/notice/deleteBatch.do',
				data: "noArr=" + noArr,
				success:function(){
					alert('삭제되었습니다');
					$('#pagingForm').submit();
				},
				error: function(){
					alert('오류');
				}
			});
		}else if (result == false){
			alert("취소되었습니다.");
		}
		
	}
	
	function seachFnc() {
		
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		var hiddenNoticeCategoryObj = $('#hiddenNoticeCategory');
		var curPageObj = $('#curPage');
		
		var url = '';
		
		url += './list.do?';
		url += 'curPage=' + curPageObj.val();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		url += '&categoryCode=' + hiddenNoticeCategoryObj.val();
		
		location.href = url;
		
	}
	
	function listOnePageFnc(mNo, rnum){
		
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		var hiddenNoticeCategoryObj = $('#hiddenNoticeCategory');
		
		var url = '';
		
		url += './detailList.do?';
		url += 'no=' + mNo;
		url += '&rnum=' + rnum;
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		url += '&categoryCode=' + hiddenNoticeCategoryObj.val();
		
		location.href = url;

	}
		
	$(function(){
		
		clearFilterFnc();
		var hiddenNoticeCategoryObj = $('#hiddenNoticeCategory').val();
		if(hiddenNoticeCategoryObj == -1){
			$('#allNotice').parent().addClass('active');
		} else if(hiddenNoticeCategoryObj == 0){
			$('#noticeNotice').parent().addClass('active');
		} else if(hiddenNoticeCategoryObj == 1){
			$('#eventNotice').parent().addClass('active');
		} else if(hiddenNoticeCategoryObj == 2){
			$('#closedNotice').parent().addClass('active');
		}
	});
	
	function clearFilterFnc(){
		$('#allNotice').parent().removeClass("active");
		$('#noticeNotice').parent().removeClass("active");
		$('#closedNotice').parent().removeClass("active");
		$('#eventNotice').parent().removeClass("active");
	}
	
	function pageMoveCategoryAllFnc(){	
		$('#hiddenNoticeCategory').val(-1);
		$('#pagingForm').submit();
	}
	
	function pageMoveCategoryNoticeFnc(){
		$('#hiddenNoticeCategory').val(0);
		$('#pagingForm').submit();	
	}
	
	function pageMoveCategoryClosedFnc(){
		$('#hiddenNoticeCategory').val(2);
		$('#pagingForm').submit();
	}
	
	function pageMoveCategoryEventFnc(){
		$('#hiddenNoticeCategory').val(1);
		$('#pagingForm').submit();
	}
	
</script>

</head>

<body>

	

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header.jsp" />
		
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>공지게시판</h2>
			
			<div class='searchForm type2'>
				<form action="./list.do" method="post" id='selectSearch' name='selectSearch' 
					onsubmit='return false'>
					<fieldset class="overH" style="height: 50px;">
						<select class='searchSelect fLeft text' id="searchOption"
							name="searchOption">
							
							<c:choose>
								<c:when test="${searchMap.searchOption eq 'all'}">
									<option value="all" selected="selected">제목+내용</option>
									<option value="title">제목</option>
									<option value="content">내용</option>
								</c:when>
								
								<c:when test="${searchMap.searchOption eq 'title'}">
									<option value="all">제목+내용</option>
									<option value="title" selected="selected">제목</option>
									<option value="content">내용</option>
								</c:when>
					
								<c:when test="${searchMap.searchOption eq 'content'}">
									<option value="all">제목+내용</option>
									<option value="title">제목</option>
									<option value=content selected="selected">내용</option>
								</c:when>
								
							</c:choose>
							
							
						</select>
						
						<input type="text" class='searchInput fLeft' id="keyword"
							name="keyword" value="${searchMap.keyword}" placeholder="제목  or 내용 검색">
						<div class='btnWrap fs0 tCenter fRight'>
							<input type="button" class='btn green' value="검색" onclick="seachFnc();">
						</div>
					</fieldset>	
				</form>
			</div>
			
			<!-- 테이블 목록 start -->
			<div id='tableListWrap'>
				<div class='listSettings'>
					<ul class='settings fs0'>
						<li class='active'>
							<a href="#none" id="allNotice" onclick="pageMoveCategoryAllFnc();" class='text'>전체보기</a>
						</li>
						<li>
							<a href="#none" id="noticeNotice" onclick="pageMoveCategoryNoticeFnc();" class='text'>공지</a>
						</li>
						<li>
							<a href="#none" id="closedNotice" onclick="pageMoveCategoryClosedFnc();" class='text'>휴관</a>
						</li>
						<li>
							<a href="#none" id="eventNotice" onclick="pageMoveCategoryEventFnc();" class='text'>행사</a>
						</li>
						
					</ul>
				</div>
				
				<div id='tableWrap'>
					<table id='table'>
						<colgroup>
							<c:if test="${member.gradeCode eq 0}">
								<col width="52px">
							</c:if>
							<col width="55px">
							<col width="52px">
							<col width="312px">
							<c:if test="${searchMap.categoryCode != 0}">
							<col width="192px">
							<col width="80px">
							</c:if>
							<col width="82px">
							<col width="175px">
						</colgroup>
						
						<thead>
							<tr>
								<c:if test="${member.gradeCode eq 0}">
									<th class='checkboxTd' style="padding-left: 0px;">
										<!-- 기본 체크박스 전체선택 start -->
										<div class='selectAll checkbox type2'>
											<input type="checkbox" id='all'>
											<label for="all"></label>
										</div>
										<!-- //기본 체크박스 전체선택 end -->
									</th>
								</c:if>
								
								<th>번호</th>
								<th>종류</th>
								<th>제목</th>
								<c:if test="${searchMap.categoryCode != 0}">
								<th>기간</th>
								<th>진행상황</th>
								</c:if>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						
						<tbody>
							
							<c:choose>
								<c:when test="${empty noticeList }">
									<tr>
										<td colspan="8" style="text-align: center;">검색하신 결과가 없습니다.</td>
									</tr>
								</c:when>
								
								<c:otherwise>
								
									<c:forEach var="noticeDto" items="${noticeList }">
											<fmt:formatDate value="${noticeDto.startDate}" var = "startDate"
											pattern="yyyy/MM/dd"/> 
											<fmt:formatDate value="${noticeDto.endDate}" var = "endDate"
													pattern="yyyy/MM/dd"/> 	
											<fmt:formatDate value="${noticeDto.createdDate}" var = "createdDate"
													pattern="yyyy/MM/dd"/>
								<tr>
								
									<c:if test="${member.gradeCode eq 0}">
										<td style="padding-left: 0px;">
											<div class=' checkbox type2' style="text-align: center;">
												<input type="checkbox" name="box" id='chk${noticeDto.no}' 
													value='${noticeDto.no}'>
												<label for="chk${noticeDto.no}"></label>
											</div>
										</td>
									</c:if>
									
									<td style="text-align: center;">
										<input type="hidden" id="no" name="no" value="${noticeDto.no}"
											>	
										${noticeDto.no}
									</td>
									
									<td style="text-align: center;">
										<c:if test="${noticeDto.code == 0}">
											<span class= 'bold textDark'>
												<c:out value="공지" ></c:out>
											</span>
										</c:if>
										
										<c:if test="${noticeDto.code == 1}" >
											<span class='bold textGreen'>
												<c:out value="행사"></c:out>
											</span>
										</c:if>
										
										<c:if test="${noticeDto.code == 2}" >
											<span class='bold textRed'>
												<c:out value="휴관"></c:out>
											</span>
										</c:if>
									</td>
									
									<td style="text-align: left;">
	
										 <a href="#" class="ellipsis" onclick="listOnePageFnc(${noticeDto.no},
										 	 ${noticeDto.rnum})">
												${noticeDto.title}
										 </a>
																
									</td>
									
<%-- 									<c:if test="${value != 0}"> --%>
<%-- 									<c:if test="$('#hiddenNoticeCategory').val() != 0"> --%>
									<c:if test="${searchMap.categoryCode != 0}">
									
									<td style="text-align: center;">
										<div style="text-align: center;">
											<c:if test="${noticeDto.startDate != null }">
												<fmt:formatDate value="${noticeDto.startDate}"
											 		pattern="yyyy/MM/dd"/> 
											 		<c:out value="~"/> 
												<fmt:formatDate value="${noticeDto.endDate}" 
											 		pattern="yyyy/MM/dd"/> 	
											</c:if>	
										</div>
									</td>
									
									<td style="text-align: center;">
										
										<fmt:formatDate value="${noticeDto.startDate}" var = "startDate"
											pattern="yyyy/MM/dd"/> 
										<fmt:formatDate value="${noticeDto.endDate}" var = "endDate"
											pattern="yyyy/MM/dd"/> 	
										<fmt:formatDate value="${noticeDto.createdDate}" var = "createdDate"
											pattern="yyyy/MM/dd"/>
										
										<c:if test="${serverTime.substring(0,10) > endDate.substring(0,10) }">
											<c:out value="진행 완료"></c:out>
										</c:if>
										
										<c:if test="${serverTime.substring(0,10) < startDate.substring(0,10) }">
											<span class='textGreen'>
												<c:out value="진행 예정"></c:out>
											</span>
										</c:if>
										
										<c:if test="${serverTime.substring(0,10) >= startDate.substring(0,10) 
											&& serverTime.substring(0,10) <= endDate.substring(0,10)}">
											<span class = 'textRed'>
												<c:out value="진행 중"></c:out>
											</span>
										</c:if>
									</td>
									</c:if>
									
									<td style="text-align: center;">
										관리자
									</td>
									
									<td style="text-align: center;">
										<c:choose>
											<c:when test="${fn:substring(noticeDto.createdDate, 11, 13) >= 12}">
												<fmt:formatDate value="${noticeDto.createdDate }"
 												pattern="yyyy/MM/dd 오후 HH:mm"/>
 											</c:when> 
										
											<c:otherwise> 
 												<fmt:formatDate value="${noticeDto.createdDate }" 
 													pattern="yyyy/MM/dd 오전 HH:mm"/> 
 											</c:otherwise> 
 										</c:choose> 
									</td>
								
								</tr>
								</c:forEach>
								</c:otherwise>
							</c:choose>	
						</tbody>
					</table>
				</div>
				
				<c:if test="${member.gradeCode eq 0}">
					<div class='listSettings bottomSettings overH'>
						<ul class='settings fLeft'>
							<li>
	 							<a href="#none" class='text' onclick="deleteBatchFnc()">게시글 삭제</a>
							</li>
						</ul>
						<ul class='settings fRight'>
							<li>
								<a href="./add.do" class='text'>게시글 등록</a>
							</li>
						</ul>
					</div>
				</c:if>
			</div>
			<!-- //테이블 목록 end -->
			
		<jsp:include page="/WEB-INF/views/common/paging.jsp">
			<jsp:param value="${pagingInfo}" name="pagingInfo"/>
		</jsp:include>
		
		<form action="./list.do" id='pagingForm' method="get">
			<input type="hidden" id='curPage' name='curPage' 
				value="${pagingInfo.curPage}">
			<input type="hidden" class='searchInput fLeft' id="pageKeyword"
				name="keyword" value="${searchMap.keyword}">
			<input type="hidden" class='searchInput fLeft' id="pageSearchOption"
				name="searchOption" value="${searchMap.searchOption}">
			<input type="hidden" id="hiddenNoticeCategory" name="categoryCode" value="${searchMap.categoryCode}">
		</form>
			
		
		<input type="hidden" name="gradeCode" id='gradeCode' value="${member.gradeCode}">
		
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
	</div>

</body>

</html>