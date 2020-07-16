<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Lightbrary : 회원검색</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  


<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script> --%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/validation.js"></script>

<style type="text/css">
	th {
		text-align: center;
	}

</style>
<script type="text/javascript">
	$(document).ready(function() {
		// depth1 네비
		$('#depth1Ul > li:nth-child(1)').addClass('active');
		
		 $("a").hover(function(){
			    $(this).css("font-weight", "bold");
			    }, function(){
			    $(this).css("font-weight", "normal");
			  });
	});
	
	//다중 선택 회원 탈퇴
	function deleteBatchFnc() {
		var noObjArr = checkedObjArr();
		var noArr = new Array();
		
		for (var i = 0; i < noObjArr.length; i++) {
			noArr[i] = noObjArr[i].value;
		}
		
		var baseUrl = window.location.protocol + "//" + window.location.host + "/lightbrary/";
	
		$.ajax({
			type: "POST",
			url: baseUrl + '/auth/deleteBatch.do',
			data: "noArr=" + noArr,
			success:function(){
				alert('삭제되었습니다');
				$('#pagingForm').submit();
			},
			error: function(){
				alert('오류');
			}
		});
	}
	
	// 상세페이지로 이동
	function listOnePageFnc(obj, event){	
		var aTagObj = $(obj);
		   
		event.preventDefault();
		
		var noObj = '';
		
		noObj = aTagObj.parent().parent().children('td').children().eq(2);
		
		$('#pagingForm').attr("action", "<%=request.getContextPath()%>/auth/detail.do?no=" + noObj.html());
		$('#pagingForm').submit();
	}
	
	function clearDateFnc(obj){
		obj.previousElementSibling.value = "";
	}
	
	function memberListParamDtoSubmit(){
		if(isValidDateRange($('#joinDateStart').val(), $('#joinDateEnd').val())){
			$('#memberListParamDto').submit();
		} else{
			alert('시작 날짜가 끝 날짜보다 클 수 없습니다.');
		}
	}
</script>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header.jsp" />
		
			<!-- 컨테이너 start -->
			<div id='container'>
				<h2 id='pageTitle'>회원검색</h2>
				
				<div class='searchForm type1'>
	            <form id="memberListParamDto" name="memberListParamDto" action="./list.do" method="post">
	              	 <fieldset>
	                  <!-- 기본 인풋 start -->
	                  <div class='searchInputWrap fs0'>
	                     <span class='label text bold'>이름</span>
	                     <div class='searchInputBox'>
	                        <input type="text" id="name" name="name" class='searchInput' value='${memberListParamDto.name}'>
	                     </div>
	                  </div>
	                  <!-- 기본 인풋 end -->
	                  <!-- 기본 인풋 start -->
	                  <div class='searchInputWrap fs0'>
	                     <span class='label text bold'>이메일</span>
	                     <div class='searchInputBox'>
	                        <input type="text" id="email" name="email" class='searchInput' value='${memberListParamDto.email}'>
	                     </div>
	                  </div>
	                  <!-- 기본 인풋 end -->      
	                  <!-- 기간 범위 인풋 (달력) start -->
	                  <div class='searchInputWrap fs0'>
	                     <span class='label text bold'>가입일</span>
	                     <div class='searchInputBox overH'>
	                     	<div class='dateInputBox fLeft'>
		                        <input type="text" id="joinDateStart" name="joinDateStart"
		                        	class='searchInput searchDate fLeft datePicker' readonly="readonly"
		                        		value='${memberListParamDto.joinDateStart}'>
		                        <button type="button" class='clear' onclick='clearDateFnc(this);'></button>
							</div>	
	                        <span class='range fLeft text bold'>~</span>
	                        
	                        <div class='dateInputBox fRight'>								
		                        <input type="text" id="joinDateEnd" name="joinDateEnd"
		                        	class='searchInput searchDate fRight datePicker' readonly="readonly"
		                        		value='${memberListParamDto.joinDateEnd}'>
		                        <button type="button" class='clear' onclick='clearDateFnc(this);'></button>
	                    	</div>
	                     </div>
	                  </div>
	                  <!-- 기간 범위 인풋 (달력) end -->
	               </fieldset>
	               <div class='btnWrap searchBtnWrap fs0 tCenter'>
	                  <input type="button" onclick="memberListParamDtoSubmit();" class='btn green' value="검색">
	              </div>
	            </form>
	          	</div>
	        
    	    
				<!-- 테이블 목록 start -->
				<div id='tableListWrap'>
					<div class='listSettings overH'>
						<ul class='settings fLeft fs0'>
							<li class='active'>
								<a href="./list.do" class='text'>전체 회원 보기</a>
							</li>
							<li>
								<a href="./overdueMemberList.do" class='text'>연체 회원 보기</a>
							</li>
						</ul>
					</div>
					<div id='tableWrap'>
						<table id='table'>
							<colgroup>
								<col width="20px">
								<col width="50px">
								<col width="50px">
								<col width="70px">
								<col width="220px">
								<col width="80px">
							</colgroup>
							<thead>
								<tr>
									<th class='checkboxTd'>
										<!--기본 체크박스 전체선택 start -->
										<div class='selectAll checkbox type2 fLeft'>
											<input type="checkbox" id='all'>
											<label for="all"></label>
										</div>
										<!--기본 체크박스 전체선택 end -->
									</th>
									<th>회원번호</th>
									<th>이름</th>
									<th>연락처</th>
									<th>이메일</th>
									<th>가입일</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty memberDtoList}">
									
									<tr>
										<td colspan="6" style="text-align: center; padding: 56px 0px;">
											<span style="font-size: 16px; color: #686868;">검색하신 내용에 대한 결과가 없습니다.</span>
										</td>
									</tr>
								</c:if>
								
								<c:forEach var="memberDto" items="${memberDtoList}">
									<tr>
										<td class='checkboxTd'>
											<input type="hidden" value='${memberDto.no}' class='noObj'>
											<!--기본 체크박스 start -->
											<div class='checkbox type2 fLeft'>
												<input type="checkbox" name="box" id='chk${memberDto.no}' value='${memberDto.no}'>
												<label for="chk${memberDto.no}"></label>
											</div>
											<!--기본 체크박스 end -->
										</td>
										<td style="text-align: center;">
											<a href='#' onclick="listOnePageFnc(this, event);" class='ellipsis'>${memberDto.no}</a>
										</td>
										<td>
											<a href='#' onclick="listOnePageFnc(this, event);" class='ellipsis'>${memberDto.name}</a>
										</td>
										<td style="text-align: center;">
											<span class='ellipsis'>${memberDto.phone}</span>
										</td>
										<td>
											<a href='#' onclick="listOnePageFnc(this, event);" class='ellipsis'>${memberDto.email}</a>
										</td>
										<td>
											<span>
												<fmt:formatDate value="${memberDto.createdDate}" pattern="yyyy/MM/dd HH:mm:ss"/>
											</span>
										</td>
									</tr>
								</c:forEach>
								
							</tbody>
						</table>
					</div>
				</div>
				<!-- //테이블 목록 end -->
				
				<div class='listSettings overH'>
					<ul class='settings fLeft fs0'>
						<li>
							<a href="#" onclick="deleteBatchFnc();" class='text'>선택 회원 강퇴</a>
						</li>
					</ul>
				</div>
				
				<!-- 검색결과 없을 시 페이징 안보이기 start -->
				<c:if test="${!empty memberDtoList}">
					<jsp:include page="/WEB-INF/views/common/paging.jsp">
						<jsp:param value="${pagingInfo}" name="pagingMap"/>
					</jsp:include>
				</c:if>
				<!-- //검색결과 없을 시 페이징 안보이기 end -->
				
				<!-- 검색조건 컨트롤러에 전송 start -->
				<form id='pagingForm' name='memberListParamDto' method="post" action="./list.do">
					<input type="hidden" id="no" name="no" value="${memberListParamDto.no}">
					<input type="hidden" name="name" value="${memberListParamDto.name}">
					<input type="hidden" name="email" value="${memberListParamDto.email}">
					<input type="hidden" name="phone" value="${memberListParamDto.phone}">
					<input type="hidden" name="joinDateStart" value="${memberListParamDto.joinDateStart}">
					<input type="hidden" name="joinDateEnd" value="${memberListParamDto.joinDateEnd}">
					<input type="hidden" id='curPage' name='curPage' value="${memberListParamDto.curPage}">
				</form>
				<!-- //검색조건 컨트롤러에 전송 end -->
			</div>
    	    <!-- //컨테이너 end -->
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
	</div>

</body>

</html>