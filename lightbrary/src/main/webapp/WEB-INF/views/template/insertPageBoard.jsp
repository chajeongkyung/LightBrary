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
				<div class='detailTable detailInputTable'>
					<table>
						<colgroup>
							<col width="214px">
							<col width="786px">
						</colgroup>
						<tbody>
							<tr>
								<th class='text bold textDark inputTh'>종류</th>
								<td class='inputTd'>
									<select class='detailSelect text textGrey'>
										<option value="">종류</option>
										<option value="공지">공지</option>
										<option value="휴관">휴관</option>
										<option value="행사">행사</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>제목</th>
								<td class='inputTd'>
									<input type="text" class='detailInput text textGrey'>
								</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>내용</th>
								<td class='inputTd'>
									<textarea rows="50" cols="20" class='detailInput detailTextArea text textGrey'></textarea>
								</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>기간</th>
								<td class='inputTd'>
									<div class='searchInputBox overH' style="width: 100%;">
										<div class='dateInputBox fLeft' style="width: 345px;">
											<input type="text" id="bookPublishDateStart" class='searchInput searchDate' readonly="readonly" style="width: 345px;">
											<button type="button" class='clear'></button>
										</div>
										<span class='range fLeft text bold' style="padding-left: 10px; padding-right: 10px;">~</span>
										<div class='dateInputBox fLeft' style="width: 345px;">
											<input type="text" id="bookPublishDateEnd" class='searchInput searchDate' readonly="readonly" style="width: 345px;">
											<button type="button" class='clear'></button>
										</div>
									</div>
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