<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Lightbrary : 도서대출현황</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

<style type="text/css">
	.returned td>*{opacity: 0.5;}
</style>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header_temp.jsp" />
		
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>도서대출현황</h2>
			
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
							<tr class='returned'>
								<td class='checkboxTd'>
									<!-- 기본 체크박스 start -->
									<div class='checkbox type2 fLeft'>
										<input type="checkbox" id='check1' disabled="disabled">
										<label for="check1"></label>
									</div>
									<!-- //기본 체크박스 end -->
								</td>
								<td>
									<a href="#none" class='ellipsis'>임계장 이야기임계장 이야기임계장 이야기임계장 이야기</a>
								</td>
								<td>
									<span class='ellipsis'>조정진</span>
								</td>
								<td>
									<span class='ellipsis'>휴마니터스</span>
								</td>
								<td>
									<span class='ellipsis'>박상아</span>
								</td>
								<td>
									<span class='ellipsis'>
										sa@mail.com
									</span>
								</td>
								<td>
									<span>반납완료</span>
								</td>
								<td>
									<span>2020.06.27</span>
								</td>
							</tr>
							<!--  -->
							<tr>
								<td class='checkboxTd'>
									<!-- 기본 체크박스 start -->
									<div class='checkbox type2 fLeft'>
										<input type="checkbox" id='check2'>
										<label for="check2"></label>
									</div>
									<!-- //기본 체크박스 end -->
								</td>
								<td>
									<a href="#none" class='ellipsis'>임계장 이야기임계장 이야기임계장 이야기임계장 이야기</a>
								</td>
								<td>
									<span class='ellipsis'>조정진조정진조정진</span>
								</td>
								<td>
									<span class='ellipsis'>휴마니터스</span>
								</td>
								<td>
									<span class='ellipsis'>박상아</span>
								</td>
								<td>
									<span class='ellipsis'>
										<a href="#none">
											<img alt="이메일" src="<%=request.getContextPath()%>/resources/img/icon-mail.png" style="width: 24px; vertical-align: middle;">
										</a>
										sa@mail.com
									</span>
								</td>
								<td>
									<span class='textGreen'>대출 중</span>
								</td>
								<td>
									<span>2020.06.27</span>
								</td>
							</tr>
							<!--  -->
							<tr>
								<td class='checkboxTd'>
									<!-- 기본 체크박스 start -->
									<div class='checkbox type2 fLeft'>
										<input type="checkbox" id='check3'>
										<label for="check3"></label>
									</div>
									<!-- //기본 체크박스 end -->
								</td>
								<td>
									<a href="#none" class='ellipsis'>임계장 이야기임계장 이야기임계장 이야기임계장 이야기</a>
								</td>
								<td>
									<span class='ellipsis'>조정진조정진조정진</span>
								</td>
								<td>
									<span class='ellipsis'>휴마니터스</span>
								</td>
								<td>
									<span class='ellipsis'>박상아</span>
								</td>
								<td>
									<span class='ellipsis'>
										<a href="#none">
											<img alt="이메일" src="<%=request.getContextPath()%>/resources/img/icon-mail.png" style="width: 24px; vertical-align: middle;">
										</a>
										sa@mail.com
									</span>
								</td>
								<td>
									<span class='textGreen'>대출 중</span>
								</td>
								<td>
									<span>2020.06.27</span>
								</td>
							</tr>
							<!--  -->
							<tr>
								<td class='checkboxTd'>
									<!-- 기본 체크박스 start -->
									<div class='checkbox type2 fLeft'>
										<input type="checkbox" id='check4'>
										<label for="check4"></label>
									</div>
									<!-- //기본 체크박스 end -->
								</td>
								<td>
									<a href="#none" class='ellipsis'>임계장 이야기임계장 이야기임계장 이야기임계장 이야기</a>
								</td>
								<td>
									<span class='ellipsis'>조정진조정진조정진</span>
								</td>
								<td>
									<span class='ellipsis'>휴마니터스</span>
								</td>
								<td>
									<span class='ellipsis'>박상아</span>
								</td>
								<td>
									<span class='ellipsis'>
										<a href="#none">
											<img alt="이메일" src="<%=request.getContextPath()%>/resources/img/icon-mail.png" style="width: 24px; vertical-align: middle;">
										</a>
										sa@mail.com
									</span>
								</td>
								<td>
									<span class='textGreen'>대출 중</span>
								</td>
								<td>
									<span>2020.06.27</span>
								</td>
							</tr>
							<!--  -->
							
							<tr>
								<td class='checkboxTd'>
									<!-- 기본 체크박스 start -->
									<div class='checkbox type2 fLeft'>
										<input type="checkbox" id='check5'>
										<label for="check5"></label>
									</div>
									<!-- //기본 체크박스 end -->
								</td>
								<td>
									<a href="#none" class='ellipsis'>임계장 이야기임계장 이야기임계장 이야기임계장 이야기</a>
								</td>
								<td>
									<span class='ellipsis'>조정진조정진조정진</span>
								</td>
								<td>
									<span class='ellipsis'>휴마니터스</span>
								</td>
								<td>
									<span class='ellipsis'>박상아</span>
								</td>
								<td>
									<span class='ellipsis'>
										<a href="#none">
											<img alt="이메일" src="<%=request.getContextPath()%>/resources/img/icon-mail.png" style="width: 24px; vertical-align: middle;">
										</a>
										sa@mail.com
									</span>
								</td>
								<td>
									<span class='textGreen'>대출 중</span>
								</td>
								<td>
									<span>2020.06.27</span>
								</td>
							</tr>
							<!--  -->
							<tr>
								<td class='checkboxTd'>
									<!-- 기본 체크박스 start -->
									<div class='checkbox type2 fLeft'>
										<input type="checkbox" id='check6'>
										<label for="check6"></label>
									</div>
									<!-- //기본 체크박스 end -->
								</td>
								<td>
									<a href="#none" class='ellipsis'>임계장 이야기임계장 이야기임계장 이야기임계장 이야기</a>
								</td>
								<td>
									<span class='ellipsis'>조정진조정진조정진</span>
								</td>
								<td>
									<span class='ellipsis'>휴마니터스</span>
								</td>
								<td>
									<span class='ellipsis'>박상아</span>
								</td>
								<td>
									<span class='ellipsis'>
										<a href="#none">
											<img alt="이메일" src="<%=request.getContextPath()%>/resources/img/icon-mail.png" style="width: 24px; vertical-align: middle;">
										</a>
										sa@mail.comsa@mail.comsa@mail.com
									</span>
								</td>
								<td>
									<span class='textGreen'>대출 중</span>
								</td>
								<td>
									<span>2020.06.27</span>
								</td>
							</tr>
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