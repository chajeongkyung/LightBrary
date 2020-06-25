<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>공통단 템플렛</title>

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
			
			<!-- 검색폼 버전2 start -->
			<div class='searchForm type1'>
				<form action="">
					<fieldset>
						<!-- 기본 인풋 start -->
						<div class='searchInputWrap fs0'>
							<span class='label text bold'>제목</span>
							<div class='searchInputBox'>
								<input type="text" id="bookName" class='searchInput'>
							</div>
						</div>
						<!-- //기본 인풋 end -->
						<!-- 기본 인풋 start -->
						<div class='searchInputWrap fs0'>
							<span class='label text bold'>저자</span>
							<div class='searchInputBox'>
								<input type="text" id="bookAuthor" class='searchInput'>
							</div>
						</div>
						<!-- //기본 인풋 end -->
						<!-- 기본 인풋 start -->
						<div class='searchInputWrap fs0'>
							<span class='label text bold'>출판사</span>
							<div class='searchInputBox'>
								<input type="text" id="bookPublish" class='searchInput'>
							</div>
						</div>
						<!-- //기본 인풋 end -->
						
						<!-- 기간 범위 인풋 (달력) start -->
						<div class='searchInputWrap fs0'>
							<span class='label text bold'>출판일</span>
							<div class='searchInputBox overH'>
								<input type="text" id="bookPublishDateStart" class='searchInput searchDate fLeft' readonly="readonly">
								<span class='range fLeft text bold'>~</span>
								<input type="text" id="bookPublishDateEnd" class='searchInput searchDate fRight' readonly="readonly">
							</div>
						</div>
						<!-- //기간 범위 인풋 (달력) end -->
						
						<!-- 분류 셀렉트 박스 start -->
						<div class='searchInputWrap fs0'>
							<span class='label text bold'>분류</span>
							<div class='searchInputBox overH'>
								<select id='bookCategory1' class='searchSelect fLeft dark text'>
									<option value="">대분류</option>
									<option value="">대분류</option>
									<option value="">대분류</option>
								</select>
								<select id='bookCategory2' class='searchSelect fLeft med text'>
									<option value="">중분류</option>
								</select>
								<select id='bookCategory3' class='searchSelect fLeft light text'>
									<option value="">소분류</option>
								</select>
							</div>
						</div>
						<!-- //분류 셀렉트 박스 end -->
					</fieldset>
					<div class='btnWrap searchBtnWrap fs0 tCenter'>
						<input type="submit" class='btn green' value="검색">
					</div>
				</form>
			</div>
			<!-- //검색폼 버전1 end -->
			
			<!-- 여백 (필요 없는거) -->
			<div style="padding: 50px 0px;"><hr></div>
			
			<!-- 검색폼 버전2 start -->
			<div class='searchForm type2'>
			
				<!-- 기간설정 탭 start -->
				<ul class='rangeTabs fs0 tCenter' style="margin-bottom: 22px;">
					<li class='active'>
						<a href="#none">최근 1주일</a>
					</li>
					<li>
						<a href="#none">1개월</a>
					</li>
					<li>
						<a href="#none">3개월</a>
					</li>
					<li>
						<a href="#none">6개월</a>
					</li>
				</ul>
				<!-- //기간설정 탭 end -->
				
				<!-- 기간 조회 start -->
				<form action="" id='viewWithinDates'>
					<fieldset>
						<div class='searchInputBox overH'>
							<input type="text" id="dateStart" class='searchInput searchDate fLeft' readonly="readonly">
							<span class='range fLeft text bold'>~</span>
							<input type="text" id="dateEnd" class='searchInput searchDate fLeft' readonly="readonly" style="margin-left:3px">
							<div class='btnWrap fs0 tCenter fRight'>
								<input type="submit" class='btn grey' value="조회">
							</div>
						</div>
					</fieldset>
				</form>
				<!-- //기간 조회 end -->
				
				<!-- 셀렉트 검색 start -->
				<form action="" id='selectSearch' style="margin-top: 65px;">
					<fieldset class="overH" style="height: 50px;">
						<select class='searchSelect fLeft text'>
							<option value="제목">제목</option>
							<option value="저자">저자</option>
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
			
			<!-- 여백 (필요 없는거) -->
			<div style="padding: 50px 0px;"><hr></div>
			
			<!-- 상세페이지 버튼 start -->
				<div class='btnWrap viewBtns fs0 tCenter'>
					<a href="#none" class='btn grey'>적용</a>
					<a href="#none" class='btn grey'>탈퇴하기</a>
					<a href="#none" class='btn green'>뒤로</a>
				</div>
				<!-- //상세페이지 버튼 end -->
			
			<!-- 여백 (필요 없는거) -->
			<div style="padding: 50px 0px;"><hr></div>
			
			<!-- 정보 입력 폼 start -->
			<form action="" class='infoForm'>
				<div class='infoInputWrap'>
					<input type="text" class='infoInput infoPwd' placeholder="비밀번호">
				</div>
				<div class='btnWrap tCenter' style="margin-top: 30px;">
					<input type="submit" class='btn green' value="확인">
					<a href="#none" class="subBtn text bold">뒤로</a>
				</div>
			</form>
			<!-- //정보 입력 폼 end -->
			
			<!-- 여백 (필요 없는거) -->
			<div style="padding: 50px 0px;"><hr></div>
			
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
	</div>

</body>

</html>