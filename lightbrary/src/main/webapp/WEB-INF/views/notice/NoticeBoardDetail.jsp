<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>게시판 상세페이지</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

<script type="text/javascript">
//이전글 

$("#preDoc").on("click",function(){
	_this.preNextDoc('pre');
}); 
	
//다음글 
$("#nxtDoc").on("click",function(){ 
	_this.preNextDoc('next');
}); 

// preNextDoc : function(flag){
// 	var _this = this; 
// 	var params = {
// 			docnum : _this.docnum,
// 			brdCode : _this.brdCode,
// 			brdType : _this.brdType,
// 			flag : flag, //pre,nxt
// 			viewFlag : _this.viewFlag
			
// 	} $.ajax({ 
// 	ype:"POST",
// 	url: ePortalConfig.boardContext+"/preNextDoc",
// 	dataType: "json",
// 	data : params, cache : false,
// 	success : function(res){ 
// 		//이하 생략
// 	}
	
// 	}
// }

	function pageMoveListFnc(){
		var noObj = $('#no');
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		
	
		var url = '';
		
		url += './list.do?';
		url += 'no=' + noObj.val();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		
		location.href = url;
	}

	
// 	//이전글
// 	$("#preDoc").on("click",function(){
// 		_this.preNextDoc('pre'); 
// 	});
	
// 	//다음글 
// 	$("#nxtDoc").on("click",function(){
// 		_this.preNextDoc('next'); 
// 	});

// 	preNextDoc : function(flag){
// 		var _this = this;
// 		var params = { 
// 					docnum : _this.docnum,
// 					brdCode : _this.brdCode,
// 					brdType : _this.brdType,
// 					flag : flag, //pre,nxt
// 					viewFlag : _this.viewFlag 
// 		} 
		
// 		$.ajax({ 
// 			type:"POST",
// 			url: ePortalConfig.boardContext+"/preNextDoc",
// 			dataType: "json", data : params, cache : false,
// 			success : function(res){ 
// 				//이하 생략
// 		}
// 		}
// 	}

	function nextPageFnc(obj, event){
		
		var noticeNoObj = '';
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		
		
		noticeNoObj = $('#no').val();
		
		alert(noticeNoObj);
		var url = '';
		
		if (noticeNoObj < 23) {
			url += './detailList.do?';
			url += 'no=' + (parseInt(noticeNoObj) + 1);
			url += '&keyword=' + keywordObj.val();
			url += '&searchOption=' + searchOptionObj.val();
				
			location.href = url;
			return false;
			
		}else{
			return true;			
		}
		

	}	
	
	function previousPageFnc() {
		
		var noticeNoObj = '';
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		
		noticeNoObj = $('#no').val();
		
		var url = '';
		
		url += './detailList.do?';
		url += 'no=' + (parseInt(noticeNoObj) - 1);
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		
		location.href = url;

		return false;
		
	}
	

</script>


</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header.jsp" />
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>페이지 제목</h2>
			
			<!-- 상세페이지 start -->

			
			<div id='detailWrap'>
				<!--  -->
				<div class='detailTable'>
					<p class='text textGrey' style="text-align: right;">
						<c:choose>
							<c:when test="${fn:substring(noticeDto.createdDate, 11, 13) >= 12}">
								<fmt:formatDate value="${noticeDto.createdDate }"
									pattern="yyyy/MM/dd 오후 HH:mm"/>
								</c:when> 
						
							<c:otherwise> 
									<fmt:formatDate value="${noticeDto.createdDate }" 
										pattern="yyyy/MM/dd 오전 HH:mm"/> 
								</c:otherwise> 
						</c:choose>
					</p>
					
			
					
					<table>
						<colgroup>
							<col width="214px">
							<col width="786px">
						</colgroup>
						<tbody>
							<tr>
								<th class='text bold textDark'>번호</th>

								<td class='text textGrey'>${noticeDto.no }</td>
							</tr>
							<tr>
								<th class='text bold textDark'>종류</th>
								<td class='text textGrey'>${noticeDto.name}</td>
							</tr>
							<tr>
								<th class='text bold textDark'>제목</th>
								<td class='text textGrey'>${noticeDto.title }</td>
							</tr>
							<tr>
								<th class='text bold textDark'>내용</th>
								<td class='text textGrey'>
									${noticeDto.content}
								</td>
							</tr>
							<tr>
								<th class='text bold textDark'>기간</th>
								<td class='text textGrey'>
								
									<c:if test="${noticeDto.startDate == null }">
											<c:out value=""></c:out>
									</c:if>
										
									<c:if test="${noticeDto.startDate != null }">
										<fmt:formatDate value="${noticeDto.startDate}"
									 		pattern="yyyy/MM/dd"/> 
									 		<c:out value="~"/> 
										<fmt:formatDate value="${noticeDto.endDate}" 
									 		pattern="yyyy/MM/dd"/> 	
									</c:if>	
									
								</td>
							</tr>
							
							<tr>
								<th class='text bold textDark'>진행상황</th>
								<td class='text textRed'>
									
									<fmt:formatDate value="${noticeDto.startDate}" var = "startDate"
											pattern="yyyy/MM/dd"/> 
									<fmt:formatDate value="${noticeDto.endDate}" var = "endDate"
											pattern="yyyy/MM/dd"/> 	
											
									
								
									<c:if test="${serverTime.substring(0,10) > endDate.substring(0,10) }">
										<c:out value="진행 완료"></c:out>
									</c:if>
									
									<c:if test="${serverTime.substring(0,10) < startDate.substring(0,10) }">
										<span class='textGreen'>
											<c:out value="진행 예정"></c:out>
										</span>
									</c:if>
									
									<c:if test="${serverTime.substring(0,10) >= startDate.substring(0,10) && serverTime.substring(0,10) <= endDate.substring(0,10)}">
										<span class = 'textRed'>
											<c:out value="진행 중"></c:out>
										</span>
									</c:if>
									
								</td>
							</tr>
						</tbody>
					</table>
					<div id='viewPaging' class='overH'>
					
						<a id="preDoc" href="#none" class='viewPrevBtn fLeft' onclick="previousPageFnc()" >이전 게시글</a>
						<a id="nxtDoc" href="#none" class='viewNextBtn fRight' onclick="nextPageFnc()">다음 게시글</a>
						
<!-- 						<a id="preDoc" href="#none" class='viewPrevBtn fLeft'>이전 게시글</a> -->
<!-- 						<a id="nxtDoc" href="#none" class='viewNextBtn fRight'>다음 게시글</a> -->
						
					</div>
				</div>
				
				<!-- 상세페이지 버튼 start -->
				<div class='btnWrap viewBtns fs0 tCenter'>
				
					<input type="hidden" id='no' name="no" value="${noticeDto.no}">
						<input type="hidden" id='searchOption' 
						name="searchOption" value="${searchOption}">
						<input type="hidden" class='searchInput fLeft' id="keyword"
							name="keyword" value="${keyword}">
						<input type="hidden" id='count' name='count' value="${count}">
					
					<a href="./update.do?no=${noticeDto.no}" class='btn grey'>수정</a>
					<a href="#" class='btn green' onclick="pageMoveListFnc()">목록</a>
				</div>
				<!-- //상세페이지 버튼 end -->
			</div>
			<!-- //상세페이지 end -->
			
		</div>
		<!-- //컨테이너 end -->
		
	
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
	</div>

</body>

</html>