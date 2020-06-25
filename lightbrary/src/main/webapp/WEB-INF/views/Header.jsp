<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더 start -->
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
			<!-- 회원으로 로그인 start -->
			<li id='hBasket'>
<<<<<<< HEAD
				<a href="#none">
=======
				<a href="#none">
>>>>>>> branch 'master' of https://github.com/chajeongkyung/LightBrary.git
					<img alt="바구니" src="<%=request.getContextPath()%>/resources/img/icon-cart.png">
				</a>
			</li>
			<li>
				<a href="#none" id='myPageClick' class='hOptionsText'>
					<span>박상아</span> 님
					<img alt="화살표" src="<%=request.getContextPath()%>/resources/img/arrow.png" style="vertical-align: 2px">
				</a>
				<div id='myPageDrop' style="display:none">
					<h3>마이페이지</h3>
					<ul>
						<li>
							<a href="#none" class='fs0'>
								<img alt="내 정보" src="<%=request.getContextPath()%>/resources/img/icon-user.png">
								<span>내 정보</span>
							</a>
						</li>
						<li>
							<a href="#none" class='fs0'>
								<img alt="내 정보" src="<%=request.getContextPath()%>/resources/img/icon-single-book.png">
								<span>나의 대출 기록</span>
							</a>
						</li>
						<li>
							<a href="#none" class='fs0'>
								<img alt="내 정보" src="<%=request.getContextPath()%>/resources/img/icon-clock.png">
								<span>나의 예약 현황</span>
							</a>
						</li>
					</ul>
				</div>
			</li>
			<!-- //회원으로 로그인 end -->
			
			<!-- 관리자로 로그인 start -->
<!-- 					<li> -->
<!-- 						<a href="#none" class='hOptionsText'>관리자</a> -->
<!-- 					</li> -->
			<!-- //관리자로 로그인 end -->
			
			<li>
				<a href="#" id='logout' class='hOptionsText'>로그아웃</a>
			</li>
		</ul>
	</div>
	<!-- 네비 start -->
	<nav id='nav'>
		<ul class='fs0 tCenter'>
			<li><a href="/lightbrary/common.do">기본 템플릿</a></li>
			<li><a href="/lightbrary/pageLayout.do">기본 레이아웃</a></li>
			<li><a href="/lightbrary/bookList.do">도서 목록</a></li>
			<li><a href="/lightbrary/tableList.do">테이블 목록</a></li>
			<li><a href="/lightbrary/insertPage.do">도서 등록</a></li>
			<li><a href="/lightbrary/insertPageBoard.do">게시글 등록</a></li>
			<li><a href="/lightbrary/viewPage.do">도서 상세</a></li>
			<li><a href="/lightbrary/viewPageBoard.do">게시글 상세</a></li>
		</ul>
	</nav>
	<!-- //네비 end -->
</header>
<!-- //헤더 end -->