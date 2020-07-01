<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 페이징 start -->
<script type="text/javascript">
	function goPageFnc(pageNumber){
		var curPage = $('#curPage');
		
		curPage.val(pageNumber);
		
		var pagingForm = $('#pagingForm');
		pagingForm.submit();
	}
	
	window.onload = function(){
		var curPage = document.getElementById('curPage');
		var pageButtonId = 'pageButton' + curPage.value;
		
		document.getElementById(pageButtonId)
			.setAttribute('class', 'active');
	}
</script>

<div id='pagingWrap'>
	<a href="#none" class='pagingStart'
		onclick="goPageFnc(1);"><img alt="맨처음" src="<%=request.getContextPath()%>/resources/img/paging-start.png"></a>
	<a href="#none" class='pagingPrev'
		onclick="goPageFnc(${pagingInfo.prevPage});"><img alt="이전" src="<%=request.getContextPath()%>/resources/img/paging-prev.png"></a>
	<ul id='paging' class='fs0 tCenter'>
		
		<c:forEach var="num" 
			begin="${pagingInfo.blockBegin}" 
			end="${pagingInfo.blockEnd}">
			
			<li id='pageButton${num}'>
				<a href="#" onclick="goPageFnc(${num});">
					<c:out value="${num}"/>
				</a>
			</li>
		</c:forEach>
	</ul>
	<a href="#none" class='pagingNext'
		onclick="goPageFnc(${pagingInfo.nextPage});"><img alt="다음" src="<%=request.getContextPath()%>/resources/img/paging-next.png"></a>
	<a href="#none" class='pagingEnd'
		onclick="goPageFnc(${pagingInfo.totPage});"><img alt="맨마지막" src="<%=request.getContextPath()%>/resources/img/paging-end.png"></a>
</div>
<!-- //페이징 end -->