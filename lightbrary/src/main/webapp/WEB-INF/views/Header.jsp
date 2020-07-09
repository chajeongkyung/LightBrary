<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 기본 헤더 start -->
<c:if test="${member.gradeCode eq null}">
<header>
	<div id='headerTop'>
		<h1 id='logo'>
			<a href="#none"></a>
		</h1>
	</div>
</header>
</c:if>
<!-- //기본 헤더 end -->

<!-- 관리자 헤더 start -->
<c:if test="${member.gradeCode eq 0}">
<header>
	<div id='headerSearch'>
		<form name="bookListParamDto" action="/lightbrary/book/list.do" method="post">
			<input type="text" id='hSearchInput' name='searchName' placeholder="도서 검색">
			<input type="submit" id='hSearchBtn' value="">
		</form>
	</div>
	<div id='headerTop'>
		<h1 id='logo'>
			<a href="#none"></a>
		</h1>
		<ul id='headerOptions' class='fs0'>
			<li>
				<a href="/lightbrary/member/detail.do" class='hOptionsText'>관리자</a>
			</li>
			<li>
				<a href="/lightbrary/logout.do" id='logout' class='hOptionsText'>로그아웃</a>
			</li>
		</ul>
	</div>
	<!-- 네비 start -->
	<nav id='nav'>
		<ul id='depth1Ul' class='fs0 tCenter'>
			<li><a href="/lightbrary/auth/list.do">회원관리</a></li>
			<li id='rentNav' class='depthNav'>
				<a href="/lightbrary/rent/list.do">대출관리</a>
				<ul id='rentDepth2' class="depth2Ul fs0">
					<li>
						<a href="/lightbrary/rent/list.do">대출현황</a>
					</li>
					<li>
						<a href="/lightbrary/rent/overdue/list.do">연체현황</a>
					</li>
					<li>
						<a href="/lightbrary/rent/reserve/list.do">예약현황</a>
					</li>
				</ul>
			</li>
			<li id='bookNav' class='depthNav'>
				<a href="/lightbrary/book/list.do">도서관리</a>
				<ul id='bookDepth2' class="depth2Ul fs0">
					<li>
						<a href="/lightbrary/book/list.do">도서조회</a>
					</li>
					<li>
						<a href="/lightbrary/book/insert.do">단편 도서 등록</a>
					</li>
					<li>
						<a href="/lightbrary/book/insertBatch.do">시리즈 도서 등록</a>
					</li>
				</ul>
			</li>
			<li><a href="/lightbrary/notice/list.do">게시판관리</a></li>
		</ul>
	</nav>
	<!-- //네비 end -->
</header>
</c:if>
<!-- //관리자 헤더 end -->


<!-- 사용자 헤더 start -->
<c:if test="${member.gradeCode eq 1}">
<header>
	<div id='headerSearch'>
		<form name="bookListParamDto" action="/lightbrary/book/list.do" method="post">
			<input type="text" id='hSearchInput' name='searchName' placeholder="도서 검색">
			<input type="submit" id='hSearchBtn' value="">
		</form>
	</div>
	<div id='headerTop'>
		<h1 id='logo'>
			<a href="#none"></a>
		</h1>
		<ul id='headerOptions' class='fs0'>
			<li id='hBasket'>
				<a href="#">
					<img alt="바구니" src="<%=request.getContextPath()%>/resources/img/icon-cart.png">
				</a>
			</li>
			<li>
				<a href="#" id='myPageClick' class='hOptionsText'>
					<span>${member.name}</span> 님
					<img alt="화살표" src="<%=request.getContextPath()%>/resources/img/arrow.png" style="vertical-align: 2px">
				</a>
				<div id='myPageDrop' style="display:none">
					<h3>마이페이지</h3>
					<ul>
						<li>
							<a href="<%=request.getContextPath()%>/member/detail.do" class='fs0'>
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
							<a href="#none" class='fs0' onclick="moveToMyReserveFnc();">
								<input type="hidden" id="headerMyNo" name="headerMyNo" value="${member.no}">
								<img alt="내 정보" src="<%=request.getContextPath()%>/resources/img/icon-clock.png">
								<span>나의 예약 현황</span>
							</a>
						</li>
					</ul>
				</div>
			</li>
			<li>
				<a href="<%=request.getContextPath()%>/logout.do" id='logout' class='hOptionsText'>로그아웃</a>
			</li>
		</ul>
	</div>
	<!-- 네비 start -->
	<nav id='nav'>
		<ul id='depth1Ul' class='fs0 tCenter'>
			<li><a href="/lightbrary/book/list.do">도서조회</a></li>
			<li><a href="/lightbrary/notice/list.do">공지게시판</a></li>
		</ul>
	</nav>
	<!-- //네비 end -->
</header>
</c:if>
<!-- //사용자 헤더 end -->