<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Lightbrary : 나의 대출 상세</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bookCategorySelect.js"></script>

<script type="text/javascript">
	function moveListFnc(){
		$('#bookListParamDto').submit();
	}
</script>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header.jsp" />
		
		<!-- 컨테이너 start -->
		<div id='container'>
			<p class='text' style="padding-top: 350px; font-size: 20px; text-align: center;">
				죄송합니다. 이미 예약된 도서입니다.<br><br>
				<a href="#none" onclick="moveListFnc();" 
					style="font-size: 15px; text-decoration: underline;">
					도서 목록으로 돌아가기
				</a>
			</p>
		</div>
		<!-- //컨테이너 end -->
		
		<form name="bookListParamDto" action="<%=request.getContextPath()%>/book/list.do" id='bookListParamDto' method="post">
			<input type="hidden" id="no" name="no" value="${bookDto.no}">
			<input type="hidden" id='curPage' name='curPage' value="${bookListParamDto.curPage}">
			<input type="hidden" id="searchName" name="searchName" value="${bookListParamDto.searchName}">
			<input type="hidden" id="searchWriter" name="searchWriter" value="${bookListParamDto.searchWriter}">
			<input type="hidden" id="searchPublish" name="searchPublish" value="${bookListParamDto.searchPublish}">
			<input type="hidden" id="publishDateStart" name="publishDateStart" value="${bookListParamDto.publishDateStart}">
			<input type="hidden" id="publishDateEnd" name="publishDateEnd" value="${bookListParamDto.publishDateEnd}">
			<input type="hidden" id="searchCategory1" name="searchCategory1" value="${bookListParamDto.searchCategory1}">
			<input type="hidden" id="searchCategory2" name="searchCategory2" value="${bookListParamDto.searchCategory2}">
			<input type="hidden" id="searchCategory3" name="searchCategory3" value="${bookListParamDto.searchCategory3}">
			<input type="hidden" id="searchStatus" name="searchStatus" value="${bookListParamDto.searchStatus}">
		</form>
		
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
	</div>

</body>

</html>