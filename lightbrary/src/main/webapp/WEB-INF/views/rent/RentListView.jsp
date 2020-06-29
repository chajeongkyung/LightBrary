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
	
</script>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header_temp.jsp" />
		
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>도서대출현황</h2>
			
			<!-- 검색폼 버전2 start -->
			<div class='searchForm type2'>
				
				<!-- 셀렉트 검색 start -->
				<form action="" id='selectSearch'>
					<fieldset class="overH" style="height: 50px;">
						<select class='searchSelect fLeft text'>
							<option value="도서 제목">도서 제목</option>
							<option value="저자">저자</option>
							<option value="회원명">회원명</option>
							<option value="이메일">이메일</option>
						</select>
						<input type="text" class='searchInput fLeft'>
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
						<li class='active'>
							<a href="#none" class='text'>전체 현황 보기</a>
						</li>
						<li>
							<a href="#none" class='text'>대출 중</a>
						</li>
						<li>
							<a href="#none" class='text'>반납완료</a>
						</li>
					</ul>
					<ul class='settings fRight fs0'>
						<li>
							<a href="#none" class='text'>반납처리</a>
						</li>
						<li>
							<a href="#none" class='text'>반납일 안내 이메일 발송</a>
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
							<col width="192px">
							<col width="100px">
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
								<th>반납일</th>
							</tr>
						</thead>
						<tbody>
							<!--  -->
							<c:forEach var="rentDto" items="${rentList}">
								<c:choose>
									<c:when test="${rentDto.bookStatus eq '보관'}">
										<tr class='returned'>
									</c:when>
									<c:otherwise>
										<tr>
									</c:otherwise>
								</c:choose>
									<td class='checkboxTd'>
										<!-- 기본 체크박스 start -->
										<div class='checkbox type2 fLeft'>
											<c:choose>
												<c:when test="${rentDto.bookStatus eq '보관'}">
													<input type="checkbox" id='check${rentDto.no}' disabled="disabled">
													<label for="check${rentDto.no}" style="cursor: default;"></label>
												</c:when>
												<c:otherwise>
													<input type="checkbox" id='check${rentDto.no}'>
													<label for="check${rentDto.no}"></label>
												</c:otherwise>
											</c:choose>
										</div>
										<!-- //기본 체크박스 end -->
									</td>
									<td>
										<a href="#none" class='ellipsis'> ${rentDto.bookName}</a>
									</td>
									<td>
										<span class='ellipsis'> ${rentDto.writer}</span>
									</td>
									<td>
										<span class='ellipsis'>${rentDto.publish}</span>
									</td>
									<td>
										<span class='ellipsis'>${rentDto.mname}</span>
									</td>
									<td>
										<span class='ellipsis'>
											<c:choose>
												<c:when test="${rentDto.bookStatus eq '대출'}">
													<a href="#none">
														<img alt="이메일" src="<%=request.getContextPath()%>/resources/img/icon-mail.png" style="width: 24px; vertical-align: middle;">
													</a>
												</c:when>
												<c:otherwise>
												 	<img alt="이메일" src="<%=request.getContextPath()%>/resources/img/icon-mail.png" style="width: 24px; vertical-align: middle;">
												</c:otherwise>
											</c:choose>
											${rentDto.email}
										</span>
									</td>
									<td>
										<c:choose>
											<c:when test="${rentDto.bookStatus eq '대출'}">
												<span class='textGreen'>${rentDto.bookStatus}</span>
											</c:when>
											<c:otherwise>
											 	<span>${rentDto.bookStatus}</span>
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<span>
											<fmt:formatDate value="${rentDto.returnDate}" 
						pattern="yyyy.MM.dd "/>
										</span>
									</td>
								</tr>
							</c:forEach>
							<!--  -->
						</tbody>
					</table>
				</div>
			</div>
			<!-- //테이블 목록 end -->
			
			<jsp:include page="/WEB-INF/views/common/paging.jsp" />
			
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail_temp.jsp" />
	</div>

</body>

</html>