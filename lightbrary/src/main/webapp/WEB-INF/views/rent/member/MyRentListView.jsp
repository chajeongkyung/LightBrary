<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Lightbrary : 나의예약현황</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">

<style type="text/css">
	.returned td>*{opacity: 0.5;}
</style>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		// 마이페이지 메뉴 활성화
		$('#myPageDrop ul > li:nth-child(3)').addClass('active');
	});
	
	// 상세페이지로 이동
	function listOnePageFnc(clickObj){	
		var reserveNoObj = '';
		var myNoObj = $('#myNo');
		var searchOptionObj = $('#searchOption');
		var keywordObj = $('#keyword');
		
		reserveNoObj = $(clickObj).parent().parent().find('.no');
		
		var url = '';
		
		url += './detail.do?';
		url += 'no=' + reserveNoObj.val();
		url += '&myNo=' + myNoObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		url += '&keyword=' + keywordObj.val();
		
		location.href = url;
	
		return false;
	}
	
	//다중 반납일 연장
	function extendRentBatchFnc() {
		var noObjArr = checkedObjArr();
		var noArr = new Array();
		
		for (var i = 0; i < noObjArr.length; i++) {
			noArr[i] = noObjArr[i].value;
		}
		if(noObjArr.length > 0){
			var baseUrl = window.location.protocol + "//" + window.location.host + "/lightbrary/";
			$.ajax({
				type: "POST",
				url: baseUrl + '/rent/member/extendRentBatch.do',
				data: "noArr=" + noArr,
				success:function(){
					alert('도서의 반납일이 3일 연장되었습니다.\n반납일 연장은 총 한번만 허용됨을 알려드립니다.');
					$('#pagingForm').submit();
				},
				error: function(){
					alert('오류');
				}
			});
		} else{
			alert('선택된 도서가 없습니다.');
		}
		
	}
	
	//반납일 연장
	function extendRentFnc(clickObj) {
		var noObj = $(clickObj).parent().find('.no');
		var myNoObj = $('#myNo');
		var searchOptionObj = $('#searchOption');
		var keywordObj = $('#keyword');
		
		var url = '';
		url += './statusUpdateCtr.do?';
		url += 'no=' + noObj.val();
		url += '&myNo=' + myNoObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		url += '&keyword=' + keywordObj.val();
		
		if(confirm('선택 도서의 반납일을 3일 연장하시겠습니까?')){
			alert('도서의 반납일이 3일 연장되었습니다.\n반납일 연장은 총 한번만 허용됨을 알려드립니다.');
			
			location.href = url;
			
			return;
		} else{
			return false;
		}
	}
	
	
</script>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header.jsp" />
		
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>나의대출현황</h2>
			
			<!-- 검색폼 버전2 start -->
			<div class='searchForm type2'>
				<!-- 셀렉트 검색 start -->
				<form action="./list.do" id='selectSearch' method="post">
					<fieldset class="overH" style="height: 50px;">
						<select id='searchOption' name='searchOption' class='searchSelect fLeft text'>
							<c:choose>
								<c:when test="${searchMap.searchOption eq 'all'}">
									<option value="all" selected="selected">전체 검색</option>
									<option value="bookName">도서 제목</option>
									<option value="writer">저자</option>
									<option value="publish">출판사</option>
								</c:when>
								
								<c:when test="${searchMap.searchOption eq 'bookName'}">
									<option value="all">전체 검색</option>
									<option value="bookName" selected="selected">도서 제목</option>
									<option value="writer">저자</option>
									<option value="publish">출판사</option>
								</c:when>
					
								<c:when test="${searchMap.searchOption eq 'writer'}">
									<option value="all">전체 검색</option>
									<option value="bookName">도서 제목</option>
									<option value="writer" selected="selected">저자</option>
									<option value="publish">출판사</option>
								</c:when>
								
								<c:when test="${searchMap.searchOption eq 'publish'}">
									<option value="all">전체 검색</option>
									<option value="bookName">도서 제목</option>
									<option value="writer">저자</option>
									<option value="publish" selected="selected">출판사</option>
								</c:when>
							</c:choose>
						</select>
						<input type="text" id='keyword' class='searchInput fLeft' name="keyword" value="${searchMap.keyword}">
						<input type="hidden" id='myNo' name="myNo" value="${member.no}">
						<div class='btnWrap fs0 tCenter fRight'>
							<input type="submit" class='btn green' value="검색">
						</div>
					</fieldset>
				</form>
				<!-- //셀렉트 검색 end -->
			</div>
			<!-- //검색폼 버전2 end -->
			
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
							<a href="#none" class='text' onclick="extendRentBatchFnc();">선택 대출 연장하기</a>
						</li>
					</ul>
				</div>
				<ul id='bookList'>
					<!--  -->
					<c:if test="${empty myRentList}">
						<li style="text-align: center; padding-top: 81px;">
							<span style="font-size: 16px; color: #686868;">대출 도서가 없습니다.</span>
						</li>
					</c:if>
					<!--  -->
					<c:forEach var="rentDto" items="${myRentList}">
						<li style="position: relative;">
							<!-- 동그란 체크박스 start -->
							<div class='checkbox type1'>
								<c:choose>
									<c:when test="${rentDto.expireDays le 7}">
										<input type="checkbox" id='chk${rentDto.no}' value="${rentDto.no}">
										<label for="chk${rentDto.no}"></label>
									</c:when>
									<c:otherwise>
										<input type="checkbox" id='chk${rentDto.no}' value="${rentDto.no}" disabled="disabled">
										<label for="chk${rentDto.no}" style="opacity: 0.3; cursor: default;"></label>
									</c:otherwise>
								</c:choose>
							</div>
							<!-- //동그란 체크박스 end -->
							<span class='num'>${rentDto.rnum}</span>
							<a href="#none" onclick="listOnePageFnc(this);" class="fLeft">
								<c:url var="imgUrl" value='/img/${rentDto.imageName}'/>
								<span class='bookImage bgCover' 
									style="background-image: url('${imgUrl}');">
								</span>
							</a>
							<input type="hidden" name="no" class='no' value="${rentDto.no}">
							<div class='bookInfo fLeft'>
								<a href="#none" onclick="listOnePageFnc(this);" class='bookTitle ellipsis'>${rentDto.bookName}</a>
								<p class='text ellipsis'>${rentDto.writer}</p>
								<p class='text ellipsis'>${rentDto.publish}</p>
								<p class='text'>
									<fmt:formatDate value="${rentDto.publishDate}" pattern="yyyy/MM/dd "/>
								</p>
							</div>
							<c:if test="${rentDto.expireDays le 7}">
								<div class='listOptions fRight'>
									<ul class='listOptionsUl fs0'>
										<li>
											<input type="hidden" name="no" class='no' value="${rentDto.no}">
											<input type="hidden" name="bookNo" class='bookNo' value="${rentDto.bookNo}">
											<a href="#none" class="text bold" onclick="extendRentFnc(this);">대출 연장하기</a>
										</li>
									</ul>
								</div>
							</c:if>
							<ul class='overH' style="position: absolute; right: 24px; bottom: 30px;">
								<li class="fLeft text bold" style="margin-right: 24px;">
									상태 : 
									<c:if test="${rentDto.rentStatus eq '대출'}">
										<span class="textGreen">${rentDto.rentStatus}</span>
									</c:if>
									<c:if test="${rentDto.rentStatus eq '연체'}">
										<span class="textRed">${rentDto.rentStatus}</span>
									</c:if>
								</li>
								<li class="fLeft text" style="margin-right: 24px;">
									<span class='bold'>대출 일 :</span>
									<fmt:formatDate value="${rentDto.rentDate}" pattern="yyyy/MM/dd "/>
								</li>
								<li class="fLeft text">
									<span class='bold'>반납 일 :</span>
									<fmt:formatDate value="${rentDto.expireDate}" pattern="yyyy/MM/dd "/>
								</li>
							</ul>
						</li>
						<!--  -->
					</c:forEach>
				</ul>
			</div>
			<!-- //도서목록 end -->
			
			<c:if test="${!empty myRentList}">
				<jsp:include page="/WEB-INF/views/common/paging.jsp">
					<jsp:param value="${pagingInfo}" name="pagingMap"/>
				</jsp:include>
			</c:if>
			
			<form action="./list.do" id='pagingForm' method="post">
				<input type="hidden" id='curPage' name='curPage' value="${pagingInfo.curPage}">
				<input type="hidden" id='searchOption' name='searchOption' value="${searchMap.searchOption}">
				<input type="hidden" id='keyword' name='keyword' value="${searchMap.keyword}">
				<input type="hidden" id="myNo" name="myNo" value="${member.no}">
			</form>
			
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
	</div>

</body>

</html>