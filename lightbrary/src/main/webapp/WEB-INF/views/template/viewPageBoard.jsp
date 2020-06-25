<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>게시판 상세페이지</title>

<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
<link rel="stylesheet" type="text/css" href="resources/css/sub.css">

<script type="text/javascript" src="resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="resources/js/script.js"></script>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header.jsp" />
		
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>페이지 제목</h2>
			
			<!-- 상세페이지 start -->
			<div id='viewWrap'>
				<!--  -->
				<div class='viewTable'>
					<p class='text textGrey' style="text-align: right;">작성일 : 2020.06.11 오전 10:38</p>
					<table>
						<colgroup>
							<col width="214px">
							<col width="786px">
						</colgroup>
						<tbody>
							<tr>
								<th class='text bold textDark'>번호</th>
								<td class='text textGrey'>10</td>
							</tr>
							<tr>
								<th class='text bold textDark'>종류</th>
								<td class='text textGrey'>휴관</td>
							</tr>
							<tr>
								<th class='text bold textDark'>제목</th>
								<td class='text textGrey'>코로나로 인한 휴관일 안내드립니다.</td>
							</tr>
							<tr>
								<th class='text bold textDark'>내용</th>
								<td class='text textGrey'>
									신큐 코로나바이러스 (COVID-19)로 인한 정부 지침에 따라<br> 
									해당 기간 동안 잠시의 휴식기를 갖기로 했음을 알려드립니다.<br>
									회원님들 또한 사회적 거리두기에 함께 힘 써주시기를 부탁드리겠습니다.<br>
									감사합니다.
								</td>
							</tr>
							<tr>
								<th class='text bold textDark'>기간</th>
								<td class='text textGrey'>2020.06.17~2020.06.24</td>
							</tr>
							<tr>
								<th class='text bold textDark'>진행상황</th>
								<td class='text textRed'>진행 중</td>
							</tr>
						</tbody>
					</table>
					<div id='viewPaging' class='overH'>
						<a href="#none" class='viewPrevBtn fLeft'>이전 게시글</a>
						<a href="#none" class='viewNextBtn fRight'>다음 게시글</a>
					</div>
				</div>
				
				<!-- 상세페이지 버튼 start -->
				<div class='btnWrap viewBtns fs0 tCenter'>
					<a href="#none" class='btn grey'>수정</a>
					<a href="#none" class='btn green'>목록</a>
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