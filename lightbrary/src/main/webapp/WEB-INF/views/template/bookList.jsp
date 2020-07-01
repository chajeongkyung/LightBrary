<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>책 목록 레이아웃</title>

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
			
			<!-- 도서목록 start -->
			<div id='bookListWrap' style="margin-top: 45px;">
				<div class='listSettings overH'>
					<!-- 동그란 체크박스 전체선택 start -->
					<div class='selectAll checkbox type1 fLeft'>
						<input type="checkbox" id='all'>
						<label class='text bold' for="all">
							<span>전체선택</span>
						</label>
					</div>
					<!-- 동그란 체크박스 전체선택 end -->
					<ul class='settings fRight fs0'>
						<li>
							<a href="#none" class='text'>바구니 담기</a>
						</li>
						<li>
							<a href="#none" class='text'>대출 예약</a>
						</li>
					</ul>
				</div>
				<ul id='bookList'>
					<!--  -->
					<li>
						<!-- 동그란 체크박스 start -->
						<div class='checkbox type1'>
							<input type="checkbox" id='check1'>
							<label for="check1"></label>
						</div>
						<!-- //동그란 체크박스 end -->
						<span class='num'>1</span>
						<a href="#none" class="fLeft">
							<span class='bookImage bgCover' style="background-image: url('<%=request.getContextPath()%>/resources/img/book-img1-limgaejang.jpg');"></span>
						</a>
						<div class='bookInfo fLeft'>
							<p class='text'>823.5조.53</p>
							<a href="#none" class='bookTitle ellipsis'>임계장 이야기 제목이 길어졌을때제목이 길어졌을때제목이 길어졌을때제목이 길어졌을때제목이 길어졌을때제목이 길어졌을때제목이 길어졌을때</a>
							<p class='text ellipsis'>조정진 저 저자가 길어졌을때저자가 길어졌을때저자가 길어졌을때저자가 길어졌을때저자가 길어졌을때저자가 길어졌을때</p>
							<p class='text ellipsis'>휴머니터스 출판사가 길어졌을때출판사가 길어졌을때출판사가 길어졌을때출판사가 길어졌을때출판사가 길어졌을때</p>
							<p class='text'>2020.03.30</p>
						</div>
						<div class='listOptions fRight'>
							<ul class='listOptionsUl fs0'>
								<li>
									<a href="#none" class="text bold">바구니 담기</a> 
								</li>
								<li>
									<a href="#none" class="text bold">대출 예약</a> 
								</li>
							</ul>
							<p class='bookState text'>
								<span class="bold">상태 : </span>
								<span>보관 중</span>
							</p>
						</div>
					</li>
					<!--  -->
					<li>
						<div class='checkbox type1'>
							<input type="checkbox" id='check2'>
							<label for="check2"></label>
						</div>
						<span class='num'>2</span>
						<a href="#none" class="fLeft">
							<span class='bookImage bgCover' style="background-image: url('<%=request.getContextPath()%>/resources/img/book-img2-marshmallow.jpg');"></span>
						</a>
						<div class='bookInfo fLeft'>
							<p class='text'>823.5조.53</p>
							<a href="#none" class='bookTitle ellipsis'>임계장 이야기</a>
							<p class='text ellipsis'>조정진 저</p>
							<p class='text ellipsis'>휴머니터스</p>
							<p class='text'>2020.03.30</p>
						</div>
						<div class='listOptions fRight'>
							<ul class='listOptionsUl fs0'>
								<li>
									<a href="#none" class="text bold">바구니 담기</a> 
								</li>
<!-- 								<li> -->
<!-- 									<a href="#none" class="text bold">대출 예약</a>  -->
<!-- 								</li> -->
							</ul>
							<p class='bookState text'>
								<span class="bold">상태 : </span>
								<span class="textGreen">대출 중</span>
							</p>
						</div>
					</li>
					<!--  -->
					<li>
						<div class='checkbox type1'>
							<input type="checkbox" id='check3'>
							<label for="check3"></label>
						</div>
						<span class='num'>3</span>
						<a href="#none" class="fLeft">
							<span class='bookImage bgCover' style="background-image: url('<%=request.getContextPath()%>/resources/img/book-img3-lights.jpg');"></span>
						</a>
						<div class='bookInfo fLeft'>
							<p class='text'>823.5조.53</p>
							<a href="#none" class='bookTitle ellipsis'>임계장 이야기</a>
							<p class='text ellipsis'>조정진 저</p>
							<p class='text ellipsis'>휴머니터스</p>
							<p class='text'>2020.03.30</p>
						</div>
						<div class='listOptions fRight'>
							<ul class='listOptionsUl fs0'>
								<li>
									<a href="#none" class="text bold">바구니 담기</a> 
								</li>
<!-- 								<li> -->
<!-- 									<a href="#none" class="text bold">대출 예약</a>  -->
<!-- 								</li> -->
							</ul>
							<p class='bookState text'>
								<span class="bold">상태 : </span>
								<span class="textRed">연체</span>
							</p>
						</div>
					</li>
					<!--  -->
					<li>
						<div class='checkbox type1'>
							<input type="checkbox" id='check4'>
							<label for="check4"></label>
						</div>
						<span class='num'>4</span>
						<a href="#none" class="fLeft">
							<span class='bookImage bgCover' style="background-image: url('<%=request.getContextPath()%>/resources/img/book-img4-save.jpg');"></span>
						</a>
						<div class='bookInfo fLeft'>
							<p class='text'>823.5조.53</p>
							<a href="#none" class='bookTitle ellipsis'>임계장 이야기</a>
							<p class='text ellipsis'>조정진 저</p>
							<p class='text ellipsis'>휴머니터스</p>
							<p class='text'>2020.03.30</p>
						</div>
						<div class='listOptions fRight'>
							<ul class='listOptionsUl fs0'>
								<li>
									<a href="#none" class="text bold">바구니 담기</a> 
								</li>
<!-- 								<li> -->
<!-- 									<a href="#none" class="text bold">대출 예약</a>  -->
<!-- 								</li> -->
							</ul>
							<p class='bookState text'>
								<span class="bold">상태 : </span>
								<span class="textGreen">예약</span>
							</p>
						</div>
					</li>
					<!--  -->
					<li style="text-align: center; padding-top: 81px;">
						<span style="font-size: 16px; color: #686868;">검색하신 내용에 대한 결과가 없습니다.</span>
					</li>
					<!--  -->
				</ul>
				
				<jsp:include page="/WEB-INF/views/common/paging.jsp" />
			</div>
			<!-- //도서목록 end -->
			
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail_temp.jsp" />
	</div>

</body>

</html>