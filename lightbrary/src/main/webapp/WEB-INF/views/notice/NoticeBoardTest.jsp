<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>테이블 목록</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

<script type="text/javascript">
	

	
</script>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header_temp.jsp" />
		
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>페이지 제목</h2>
			
			<!-- 테이블 목록 start -->
			<div id='tableListWrap'>
				<div class='listSettings'>
					<ul class='settings fs0'>
						<li class='active'>
							<a href="#none" class='text'>전체보기</a>
						</li>
						<li>
							<a href="#none" class='text'>공지</a>
						</li>
						<li>
							<a href="#none" class='text'>휴관</a>
						</li>
						<li>
							<a href="#none" class='text'>행사</a>
						</li>
					</ul>
				</div>
				<div id='tableWrap'>
					<table id='table'>
						<colgroup>
							<col width="52px">
							<col width="55px">
							<col width="52px">
							<col width="312px">
							<col width="172px">
							<col width="90px">
							<col width="92px">
							<col width="175px">
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
								<th>번호</th>
								<th>종류</th>
								<th>제목</th>
								<th>기간</th>
								<th>진행상황</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="noticeDto" items="${noticeList }">
								<tr>
									<td>
										<div class='checkbox type2 fLeft'>
											<input type="checkbox" id='chk1'>
											<label for="chk1"></label>
										</div>
									</td>
									<td>
										${noticeDto.no }
									</td>
									<td>
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
									
									<td>
										${noticeDto.title }
									</td>
									
									<td>
				
										<c:if test="${noticeDto.startDate == null }">
											<c:out value=""></c:out>
										</c:if>
										
										<c:if test="${noticeDto.startDate != null }">
											<fmt:formatDate value="${noticeDto.startDate}"
										 		pattern="yyyy.MM.dd"/> 
										 		<c:out value="~"/> 
											<fmt:formatDate value="${noticeDto.endDate}" 
										 		pattern="yyyy.MM.dd"/> 	
										</c:if>	
										
									</td>
									
									<td>
										
										<fmt:formatDate value="${noticeDto.startDate}" var = "startDate"
											pattern="yyyy.MM.dd"/> 
										<fmt:formatDate value="${noticeDto.endDate}" var = "endDate"
											pattern="yyyy.MM.dd"/> 	
								
										<c:if test="${serverTime.substring(0,10) > endDate.substring(0,10) }">
											<c:out value="진행 완료"></c:out>
										</c:if>
										
										<c:if test="${serverTime.substring(0,10) < startDate.substring(0,10) }">
											<span class='textGreen'>
												<c:out value="진행 예정"></c:out>
											</span>
										</c:if>
										
										<c:if test="${serverTime.substring(0,10) >= startDate.substring(0,10) && serverTime.substring(0,10) <= endDate.substring(0,10)}">
											<span class = 'textRed'>
												<c:out value="진행 중"></c:out>
											</span>
										</c:if>
								
									</td>
									
									<td>
									
										관리자 
	
									</td>
									
									<td>
							
										<c:choose>
											<c:when test="${fn:substring(noticeDto.createdDate, 11, 13) >= 12}">
												<fmt:formatDate value="${noticeDto.createdDate }"
 												pattern="yyyy.MM.dd 오후 HH.mm"/>
 											</c:when> 
										
											<c:otherwise> 
 												<fmt:formatDate value="${noticeDto.createdDate }" 
 													pattern="yyyy.MM.dd 오전 HH.mm"/> 
 											</c:otherwise> 
 										</c:choose> 
									
									</td>
								</tr>
								
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class='listSettings bottomSettings overH'>
					<ul class='settings fLeft'>
						<li>
							<a href="#none" class='text'>게시글 삭제</a>
						</li>
					</ul>
					<ul class='settings fRight'>
						<li>
							<a href="#none" class='text'>게시글 등록</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- //테이블 목록 end -->
			
<%-- 			<jsp:include page="/WEB-INF/views/common/paging.jsp" /> --%>
			
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail_temp.jsp" />
	</div>

</body>

</html>