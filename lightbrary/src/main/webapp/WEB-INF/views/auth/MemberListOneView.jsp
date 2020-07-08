<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원 상세</title>

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
			<h2 id='pageTitle'>회원상세</h2>
			<!-- 상세페이지 start -->
			<div id='detailWrap'>
				<div class='detailTable'>
					<p class='text bold textDark'>계정정보</p>
					<table>
						<colgroup>
							<col width="214px">
							<col width="786px">
						</colgroup>
						<tbody>
							<tr>
								<th class='text bold textDark'>회원번호</th>
								<td class='text textGrey'>${member.no}</td>
							</tr>
							<tr>
								<th class='text bold textDark'>이메일</th>
								<td class='text textGrey'>${member.email}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!--  -->
				<div class='detailTable'>
					<p class='text bold textDark'>개인정보</p>
					<table>
						<colgroup>
							<col width="214px">
							<col width="786px">
						</colgroup>
						<tbody>
							<tr>
								<th class='text bold textDark'>이름</th>
								<td class='text textGrey'>${member.name}</td>
							</tr>
							<tr>
								<th class='text bold textDark'>연락처</th>
								<td class='text textGrey'>${member.phone}</td>
							</tr>
							<tr>
								<th class='text bold textDark'>주소</th>
								<td class='text textGrey'>${member.address}</td>
							</tr>
							<tr>
								<th class='text bold textDark'>가입일</th>
								<td class='text textGrey'>
									<fmt:formatDate value="${member.createdDate}" pattern="yyyy년 MM월 dd일 "/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<!-- 상세페이지 버튼 start -->
				<div class='btnWrap viewBtns fs0 tCenter'>
				<form action="./update.do" method="post">
					<input type="submit" class='btn grey' value="수정">
					
					<input type="hidden" id="no" name="no" value="${memberListParamDto.no}">
					<input type="hidden" name="name" value="${memberListParamDto.name}">
					<input type="hidden" name="email" value="${memberListParamDto.email}">
					<input type="hidden" name="phone" value="${memberListParamDto.phone}">
					<input type="hidden" name="address" value="${memberListParamDto.address}">
					<input type="hidden" name="createdDate" value="${memberListParamDto.createdDate}">
				</form>	
					<a href="<%=request.getContextPath()%>/member/list.do" class='btn green'>목록</a>
				</div>
				<!-- //상세페이지 버튼 end -->
			</div>
			<!-- //상세페이지 end -->
			
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
	</div>

</body>

</html>