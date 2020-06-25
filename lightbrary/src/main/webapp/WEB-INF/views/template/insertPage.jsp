<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>상세페이지</title>

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
			<h2 id='pageTitle'>페이지 제목</h2>
			
			<!-- 도서 등록 start -->
			<div id='detailWrap'>
				<!--  -->
				<div class='detailTable'>
					<table>
						<colgroup>
							<col width="214px">
							<col width="786px">
						</colgroup>
						<tbody>
							<tr>
								<th class='text bold textDark'>이미지</th>
								<td class='overH'>
									<input type="file" class='fLeft'>
									<div id='bookImage' class='fRight bgCover' style="margin: 0px; background-image: url('<%=request.getContextPath()%>/resources/img/noimage.jpg')"></div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!--  -->
				<div class='detailTable detailInputTable'>
					<p class='text bold textDark'>도서정보</p>
					<table>
						<colgroup>
							<col width="214px">
							<col width="786px">
						</colgroup>
						<tbody>
							<tr>
								<th class='text bold textDark'>도서 코드</th>
								<td class='text textGrey'>823.5조.53</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>분류</th>
								<td class='fs0 inputTd'>
									<select class='detailSelect bigger text textGrey'>
										<option value="">대분류</option>
										<option value="문학">문학</option>
									</select>
									<select class='detailSelect bigger text textGrey'>
										<option value="">중분류</option>
										<option value="문학">한국문학</option>
									</select>
									<select class='detailSelect bigger text textGrey'>
										<option value="">소분류</option>
										<option value="문학">소설</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>제목</th>
								<td class='inputTd fs0'>
									<input type="text" class='detailInput detailInputTitle text textGrey'>
									<select class='detailSelect smaller text textGrey' style="margin-left: 10px;">
										<option value="">0</option>
									</select>
									<span class='text textGrey'>&nbsp;~&nbsp;</span>
									<select class='detailSelect smaller text textGrey'>
										<option value="">0</option>
									</select>
									<span class='text textGrey'>&nbsp;&nbsp;권</span>
								</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>저자</th>
								<td class='inputTd'>
									<input type="text" class='detailInput text textGrey'>
								</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>출판사</th>
								<td class='inputTd'>
									<input type="text" class='detailInput text textGrey'>
								</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>출판일</th>
								<td class='fs0 inputTd'>
									<select class='detailSelect text textGrey'>
										<option value="">년</option>
									</select>
									<select class='detailSelect text textGrey'>
										<option value="">월</option>
									</select>
									<select class='detailSelect text textGrey'>
										<option value="">일</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>상태</th>
								<td class='inputTd'>
									<select class='detailSelect text textGrey'>
										<option value="">상태</option>
										<option value="보관 중">보관 중</option>
										<option value="대출 중">대출 중</option>
										<option value="예약">예약</option>
										<option value="연체">연체</option>
										<option value="파손 ">파손</option>
										<option value="분실">분실</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<!-- 상세페이지 버튼 start -->
				<div class='btnWrap viewBtns fs0 tCenter'>
					<a href="#none" class='btn grey'>등록</a>
					<a href="#none" class='btn green'>목록</a>
				</div>
				<!-- //상세페이지 버튼 end -->
			</div>
			<!-- //도서등록 end -->
			
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail_temp.jsp" />
	</div>

</body>

</html>