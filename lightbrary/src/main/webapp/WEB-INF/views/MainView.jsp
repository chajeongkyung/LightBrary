<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>기본 페이지 레이아웃</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header.jsp" />
	
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>페이지 제목</h2>
			
			<!-- 
			이안에 내용 작성
			-->
			<c:if test="${member.gradeCode eq 0}">
				<h3>관리자메뉴</h3>
				<div>
					<button></button>
					<button></button>
					<button></button>
					<button></button>
				</div>
			</c:if>
			
			<c:if test="${member.gradeCode eq 1}">
				<h3>인기도서</h3>
				<div>
					<c:forEach var="bookDto" items="${bookDtoList}">
						
					</c:forEach>
				</div>
			</c:if>
			
			<h3>공지게시판</h3>
			<div>
				<c:forEach var="noticeDto" items="${noticeDtoList }">
				
				</c:forEach>
			</div>
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
	</div>

</body>

</html>