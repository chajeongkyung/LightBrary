 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Lightbrary</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header.jsp" />
	
		<!-- 컨테이너 start -->
		<div id='container'>
			<div id='mainPageTitle'>${member.name} 님, 환영합니다 !</div>

			<c:if test="${member.gradeCode eq 0}">
<!-- 				<div class="bold textDark" style="font-size: 20px;">관리자메뉴</div> -->
				<ul id='adminLinks' class='fs0'>
					<li>
						<a href="/lightbrary/auth/list.do">회원관리</a>
					</li>
					<li>
						<a href="/lightbrary/rent/list.do">대출현황</a>
					</li>
					<li>
						<a href="/lightbrary/book/list.do">도서관리</a>
					</li>
					<li>
						<a href="/lightbrary/rent/overdue/list.do">연체도서</a>
					</li>
				</ul>
			</c:if>
			
			<c:if test="${member.gradeCode eq 1}">
				<div class="bold textDark" style="font-size: 20px;">인기도서  ${bookDtoList}</div>
				<div>
					<c:forEach var="bookDto" items="${bookDtoList}">
						<ul>
							<li>
								<div>
								<a href="#none"class="fLeft">
									<c:url var="imgUrl" value='/img/${bookDto.imageName}'/>
									<span class='bookImage bgCover' style="background-image: url('${imgUrl}');"></span>
								</a>
								사진 ${bookDto.imageNo}</div>
								<div>도서명 ${bookDto.name}</div>
								<div>작가 ${bookDto.writer}</div>
							</li>
							
						</ul>
					</c:forEach>
				</div>
			</c:if>
			
			<div class='overH' style="margin-bottom: 15px;">
				<div class="bold textDark fLeft" style="font-size: 20px; color: #464646;">공지게시판</div>
				
				<!--더보기버튼 -->
				<a class="bold textDark fRight" href="./notice/list.do" style="font-size: 24px; color: #707070;">+</a>
			</div>
			
			<div id='tableWrap'>
				<table id='table'>
					<colgroup>
						<col width="55px">
						<col width="302px">
						<col width="212px">
						<col width="192px">
					</colgroup>
							
					<thead>
						<tr>
							<th>종류</th>
							<th>제목</th>
							<th>기간</th>
							<th>작성일</th>
						</tr>
					</thead>
					
					<c:forEach var="noticeDto" items="${noticeDtoList}">
						
						<tbody>
							<tr>
								<td style="text-align: center;">
									<c:if test="${noticeDto.code == 0}">
										<span class= 'bold textDark'>
											<c:out value="공지" ></c:out>
										</span>
									</c:if>
									
									<c:if test="${noticeDto.code == 1}" >
										<span class='bold textGreen'>
											<c:out value="휴관"></c:out>
										</span>
									</c:if>
									
									<c:if test="${noticeDto.code == 2}" >
										<span class='bold textRed'>
											<c:out value="행사"></c:out>
										</span>
									</c:if>
									
								</td>
								
								<td>
										
									 <a href="#" class="ellipsis" onclick="listOnePageFnc(${noticeDto.no})">
											${noticeDto.title}
									 </a>	
									
								</td>
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
						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
	</div>

</body>

</html>