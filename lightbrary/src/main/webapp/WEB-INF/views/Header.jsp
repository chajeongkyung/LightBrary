<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 기본 헤더 start -->
<!-- <header> -->
<!-- 	<div id='headerTop'> -->
<!-- 		<h1 id='logo'> -->
<!-- 			<a href="#none"></a> -->
<!-- 		</h1> -->
<!-- 	</div> -->
<!-- </header> -->
<!-- //기본 헤더 end -->

<!-- 관리자 헤더 start -->
<header>
	<div  id='headerSearch'>
		<form action="">
			<input type="text" id='hSearchInput' name='hSearchInput' placeholder="도서 검색">
			<input type="submit" id='hSearchBtn' value="">
		</form>
	</div>
	<div id='headerTop'>
		<h1 id='logo'>
			<a href="#none"></a>
		</h1>
		<ul id='headerOptions' class='fs0'>
			<li>
				<a href="#none" class='hOptionsText'>관리자</a>
			</li>
			<li>
				<a href="#" id='logout' class='hOptionsText'>로그아웃</a>
			</li>
		</ul>
	</div>
	<!-- 네비 start -->
	<nav id='nav'>
		<ul id='depth1Ul' class='fs0 tCenter'>
			<li><a href="/lightbrary/">회원관리</a></li>
			<li id='rentNav' class='depthNav'>
				<a href="/lightbrary/">대출관리</a>
				<ul id='rentDepth2' class="depth2Ul fs0">
					<li>
						<a href="<%=request.getContextPath()%>/rent/list.do">대출현황</a>
					</li>
					<li>
						<a href="#none">연체현황</a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>/rent/reserve/list.do">예약현황</a>
					</li>
				</ul>
			</li>
			<li id='bookNav' class='depthNav'>
				<a href="<%=request.getContextPath()%>/book/list.do">도서관리</a>
				<ul id='bookDepth2' class="depth2Ul fs0">
					<li>
						<a href="<%=request.getContextPath()%>/book/list.do">도서조회</a>
					</li>
					<li>
						<a href="#none">단편 도서 등록</a>
					</li>
					<li>
						<a href="#none">시리즈 도서 등록</a>
					</li>
				</ul>
			</li>
			<li><a href="/lightbrary/">게시판관리</a></li>
		</ul>
	</nav>
	<!-- //네비 end -->
</header>
<!-- //관리자 헤더 end -->


<!-- 사용자 헤더 start -->
<!-- <header> -->
<!-- 	<div  id='headerSearch'> -->
<!-- 		<form action=""> -->
<!-- 			<input type="text" id='hSearchInput' name='hSearchInput' placeholder="도서 검색"> -->
<!-- 			<input type="submit" id='hSearchBtn' value=""> -->
<!-- 		</form> -->
<!-- 	</div> -->
<!-- 	<div id='headerTop'> -->
<!-- 		<h1 id='logo'> -->
<!-- 			<a href="#none"></a> -->
<!-- 		</h1> -->
<!-- 		<ul id='headerOptions' class='fs0'> -->
<!-- 			<li id='hBasket'> -->
<!-- 				<a href="#none"> -->
<%-- 					<img alt="바구니" src="<%=request.getContextPath()%>/resources/img/icon-cart.png"> --%>
<!-- 				</a> -->
<!-- 			</li> -->
<!-- 			<li> -->
<!-- 				<a href="#none" id='myPageClick' class='hOptionsText'> -->
<!-- 					<span>박상아</span> 님 -->
<%-- 					<img alt="화살표" src="<%=request.getContextPath()%>/resources/img/arrow.png" style="vertical-align: 2px"> --%>
<!-- 				</a> -->
<!-- 				<div id='myPageDrop' style="display:none"> -->
<!-- 					<h3>마이페이지</h3> -->
<!-- 					<ul> -->
<!-- 						<li> -->
<!-- 							<a href="#none" class='fs0'> -->
<%-- 								<img alt="내 정보" src="<%=request.getContextPath()%>/resources/img/icon-user.png"> --%>
<!-- 								<span>내 정보</span> -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 						<li> -->
<!-- 							<a href="#none" class='fs0'> -->
<%-- 								<img alt="내 정보" src="<%=request.getContextPath()%>/resources/img/icon-single-book.png"> --%>
<!-- 								<span>나의 대출 기록</span> -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 						<li> -->
<!-- 							<a href="#none" class='fs0'> -->
<%-- 								<img alt="내 정보" src="<%=request.getContextPath()%>/resources/img/icon-clock.png"> --%>
<!-- 								<span>나의 예약 현황</span> -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 			</li> -->
<!-- 			<li> -->
<!-- 				<a href="#" id='logout' class='hOptionsText'>로그아웃</a> -->
<!-- 			</li> -->
<!-- 		</ul> -->
<!-- 	</div> -->
<!-- 	<!-- 네비 start --> -->
<!-- 	<nav id='nav'> -->
<!-- 		<ul class='fs0 tCenter'> -->
<!-- 			<li><a href="/lightbrary/">도서조회</a></li> -->
<!-- 			<li><a href="/lightbrary/">공지게시판</a></li> -->
<!-- 		</ul> -->
<!-- 	</nav> -->
<!-- 	<!-- //네비 end --> -->
<!-- </header> -->
<!-- //사용자 헤더 end -->