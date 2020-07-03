<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>내 정보</title>

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
			<h2 id='pageTitle'>내 정보 수정</h2>
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
								<th class='text bold textDark inputTh'>이메일</th>
								<td class='text textGrey'>${memberDto.email}</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>비밀번호 재설정</th>
								<td class='inputTd'>
									<input type="password" class='detailInput text textGrey'>
								</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>비밀번호 재확인</th>
								<td class='inputTd'>
									<input type="password" class='detailInput text textGrey'>
								</td>
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
								<th class='text bold textDark inputTh'>이름</th>
								<td class='inputTd'>
									<input type="text" class='detailInput text textGrey' value="${memberDto.name}">
								</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>연락처</th>
								<td class='inputTd'>
									<input type="text" class='detailInput text textGrey' value="${memberDto.phone}">
								</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>주소</th>
								<td class='inputTd'>
									<input type="text" class='detailInput text textGrey' value="${memberDto.address}">
								</td>
							</tr>
							<tr>
								<th class='inputTd'>가입일</th>
								<td class='text textGrey'>${memberDto.createdDate}</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<!-- 상세페이지 버튼 start -->
				<div class='btnWrap viewBtns fs0 tCenter'>
					<a href="./updateCtr.do" class='btn grey'>적용</a>
					<a href="#none" class='btn grey'>탈퇴하기</a>
					<a href="#none" class='btn green'>뒤로</a>
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