<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Lightbrary : 예약 도서 상세</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header_temp.jsp" />
		
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>예약 도서 상세</h2>
			
			<!-- 상세페이지 start -->
			<div id='detailWrap'>
				<div id='bookImage' class='bgCover' style="background-image: url('<%=request.getContextPath()%>/resources/img/book-img1-limgaejang.jpg')"></div>
				<!--  -->
				<div class='detailTable'>
					<p class='text bold textDark'>도서정보</p>
					<table>
						<colgroup>
							<col width="214px">
							<col width="786px">
						</colgroup>
						<tbody>
							<tr>
								<th class='text bold textDark'>분류</th>
								<td class='text textGrey'>문학 한국문학 소설</td>
							</tr>
							<tr>
								<th class='text bold textDark'>제목</th>
								<td class='text textGrey'>임계장 이야기 길어질 때길어질 때길어질 때길어질 때길어질 때길어질 때길어질 때길어질 때길어질 때길어질 때길어질 때길어질 때</td>
							</tr>
							<tr>
								<th class='text bold textDark'>저자</th>
								<td class='text textGrey'>조정진</td>
							</tr>
							<tr>
								<th class='text bold textDark'>출판사</th>
								<td class='text textGrey'>휴마니터스</td>
							</tr>
							<tr>
								<th class='text bold textDark'>출판일</th>
								<td class='text textGrey'>2020.03.30</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!--  -->
				<div class='detailTable'>
					<p class='text bold textDark'>예약정보</p>
					<table>
						<colgroup>
							<col width="214px">
							<col width="786px">
						</colgroup>
						<tbody>
							<tr>
								<th class='text bold textDark'>방문일</th>
								<td class='text textGrey'>2020.06.11</td>
							</tr>
							<tr>
								<th class='text bold textDark'>예약상태</th>
								<td class='text textGrey'>예약</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<!--  -->
				<div class='detailTable'>
					<p class='text bold textDark'>회원정보</p>
					<table>
						<colgroup>
							<col width="214px">
							<col width="786px">
						</colgroup>
						<tbody>
							<tr>
								<th class='text bold textDark'>이름</th>
								<td class='text textGrey'>박상아</td>
							</tr>
							<tr>
								<th class='text bold textDark'>이메일</th>
								<td class='text textGrey'>sa@mail.com</td>
							</tr>
							<tr>
								<th class='text bold textDark'>연락처</th>
								<td class='text textGrey'>010-1234-5678</td>
							</tr>
							<tr>
								<th class='text bold textDark'>주소</th>
								<td class='text textGrey'>서울시 강남구 강남대로 43</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<!-- 상세페이지 버튼 start -->
				<div class='btnWrap viewBtns fs0 tCenter'>
					<a href="#none" class='btn grey'>대출 중으로 변경</a>
					<a href="./list.do" class='btn green'>뒤로</a>
				</div>
				<!-- //상세페이지 버튼 end -->
			</div>
			<!-- //상세페이지 end -->
			
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail_temp.jsp" />
	</div>

</body>

</html>