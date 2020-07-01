<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
							<!--  -->
							<tr>
								<td class='checkboxTd'>
									<!-- 기본 체크박스 start -->
									<div class='checkbox type2 fLeft'>
										<input type="checkbox" id='check1'>
										<label for="check1"></label>
									</div>
									<!-- //기본 체크박스 end -->
								</td>
								<td>10</td>
								<td>
									<span class='bold textDark'>공지</span>
								</td>
								<td>
									<a href="#none" class='ellipsis'>라이트브러리의 일부 공간 리뉴얼 안내드립니다.</a>
								</td>
								<td></td>
								<td></td>
								<td>관리자</td>
								<td>2020.06.11 오전 10:38</td>
							</tr>
							<!--  -->
							<tr>
								<td class='checkboxTd'>
									<div class='checkbox type2 fLeft'>
										<input type="checkbox" id='check2'>
										<label for="check2"></label>
									</div>
								</td>
								<td>9</td>
								<td>
									<span class='bold textDark'>공지</span>
								</td>
								<td>
									<a href="#none" class='ellipsis'>영업시간 조정 안내드립니다.</a>
								</td>
								<td></td>
								<td></td>
								<td>관리자</td>
								<td>2020.06.11 오전 10:38</td>
							</tr>
							<!--  -->
							<tr>
								<td class='checkboxTd'>
									<div class='checkbox type2 fLeft'>
										<input type="checkbox" id='check3'>
										<label for="check3"></label>
									</div>
								</td>
								<td>8</td>
								<td>
									<span class='bold textRed'>휴관</span>
								</td>
								<td>
									<a href="#none" class='ellipsis'>코로나로 인한 휴관일을 안내드립니다.</a>
								</td>
								<td>2020.06.17~2020.06.24</td>
								<td>
									<span class='textGreen'>진행 예정</span>
								</td>
								<td>관리자</td>
								<td>2020.06.11 오전 10:38</td>
							</tr>
							<!--  -->
							<tr>
								<td class='checkboxTd'>
									<div class='checkbox type2 fLeft'>
										<input type="checkbox" id='check4'>
										<label for="check4"></label>
									</div>
								</td>
								<td>7</td>
								<td>
									<span class='bold textGreen'>행사</span>
								</td>
								<td>
									<a href="#none" class='ellipsis'>펭수와 함께하는 온리인 신규책 소개.</a>
								</td>
								<td>2020.06.05~2020.06.05</td>
								<td>
									<span>진행 완료</span>
								</td>
								<td>관리자</td>
								<td>2020.06.11 오전 10:38</td>
							</tr>
							<!--  -->
							<tr>
								<td class='checkboxTd'>
									<div class='checkbox type2 fLeft'>
										<input type="checkbox" id='check5'>
										<label for="check5"></label>
									</div>
								</td>
								<td>6</td>
								<td>
									<span class='bold textRed'>휴관</span>
								</td>
								<td>
									<a href="#none" class='ellipsis'>코로나로 인한 휴관일을 안내드립니다.</a>
								</td>
								<td>2020.06.17~2020.06.24</td>
								<td>
									<span class="textRed">진행 중</span>
								</td>
								<td>관리자</td>
								<td>2020.06.11 오전 10:38</td>
							</tr>
							<!--  -->
							<tr>
								<td class='checkboxTd'>
									<div class='checkbox type2 fLeft'>
										<input type="checkbox" id='check6'>
										<label for="check6"></label>
									</div>
								</td>
								<td>5</td>
								<td>
									<span class='bold textRed'>휴관</span>
								</td>
								<td>
									<a href="#none" class='ellipsis'>코로나로 인한 휴관일을 안내드립니다.</a>
								</td>
								<td>2020.06.17~2020.06.24</td>
								<td>
									<span>진행 완료</span>
								</td>
								<td>관리자</td>
								<td>2020.06.11 오전 10:38</td>
							</tr>
							<!--  -->
							<tr>
								<td class='checkboxTd'>
									<div class='checkbox type2 fLeft'>
										<input type="checkbox" id='check7'>
										<label for="check8"></label>
									</div>
								</td>
								<td>4</td>
								<td>
									<span class='bold textRed'>휴관</span>
								</td>
								<td>
									<a href="#none" class='ellipsis'>코로나로 인한 휴관일을 안내드립니다.</a>
								</td>
								<td>2020.06.17~2020.06.24</td>
								<td>
									<span>진행 완료</span>
								</td>
								<td>관리자</td>
								<td>2020.06.11 오전 10:38</td>
							</tr>
							<!--  -->
							<tr>
								<td class='checkboxTd'>
									<div class='checkbox type2 fLeft'>
										<input type="checkbox" id='check8'>
										<label for="check8"></label>
									</div>
								</td>
								<td>3</td>
								<td>
									<span class='bold textRed'>휴관</span>
								</td>
								<td>
									<a href="#none" class='ellipsis'>코로나로 인한 휴관일을 안내드립니다.</a>
								</td>
								<td>2020.06.17~2020.06.24</td>
								<td>
									<span>진행 완료</span>
								</td>
								<td>관리자</td>
								<td>2020.06.11 오전 10:38</td>
							</tr>
							<!--  -->
							<tr>
								<td class='checkboxTd'>
									<div class='checkbox type2 fLeft'>
										<input type="checkbox" id='check9'>
										<label for="check9"></label>
									</div>
								</td>
								<td>2</td>
								<td>
									<span class='bold textRed'>휴관</span>
								</td>
								<td>
									<a href="#none" class='ellipsis'>코로나로 인한 휴관일을 안내드립니다.</a>
								</td>
								<td>2020.06.17~2020.06.24</td>
								<td>
									<span>진행 완료</span>
								</td>
								<td>관리자</td>
								<td>2020.06.11 오전 10:38</td>
							</tr>
							<!--  -->
							<tr>
								<td colspan="8" style="text-align: center; padding: 56px 0px;">
									<span style="font-size: 16px; color: #686868;">검색하신 내용에 대한 결과가 없습니다.</span>
								</td>
							</tr>
							<!--  -->
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
			
			<jsp:include page="/WEB-INF/views/common/paging.jsp" />
			
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail_temp.jsp" />
	</div>

</body>

</html>