<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 페이징 start -->
<div id='pagingWrap'>
	<a href="#none" class='pagingStart'><img alt="맨처음" src="<%=request.getContextPath()%>/resources/img/paging-start.png"></a>
	<a href="#none" class='pagingPrev'><img alt="이전" src="<%=request.getContextPath()%>/resources/img/paging-prev.png"></a>
	<ul id='paging' class='fs0 tCenter'>
		<li class='active'>
			<a href="#none">1</a>
		</li>
		<li>
			<a href="#none">2</a>
		</li>
		<li>
			<a href="#none">3</a>
		</li>
		<li>
			<a href="#none">4</a>
		</li>
		<li>
			<a href="#none">5</a>
		</li>
	</ul>
	<a href="#none" class='pagingNext'><img alt="다음" src="<%=request.getContextPath()%>/resources/img/paging-next.png"></a>
	<a href="#none" class='pagingEnd'><img alt="맨마지막" src="<%=request.getContextPath()%>/resources/img/paging-end.png"></a>
</div>
<!-- //페이징 end -->