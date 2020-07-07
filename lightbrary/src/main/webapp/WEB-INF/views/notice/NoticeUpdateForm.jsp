<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>상세페이지</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/noticeCategorySelect.js"></script>

<script type="text/javascript">
	
	$(function(){
		
		$(".datePicker").datepicker({
			dateFormat: "yy/mm/dd",
			changeYear: true,
			showButtonPanel: true
		});
		
		$("#noticeDateStart").datepicker("setDate", $("#hiddenNoticeDateStart").val());
		$("#noticeDateEnd").datepicker("setDate", $("#hiddenNoticeDateEnd").val());
	
		noticeCategorySelect();
	});
	
	function noticeCategoryOnload(){
		initNoticeCategory();
		var noticeCategoryObj = $('#hiddenNoticeCategory').val();
		$('#noticeCategory').val(noticeCategoryObj);
		
		if (noticeCategoryObj == 0){
			$('input[id^=noticeDate]').attr('disabled', 'disabled');
		}
	}
	
	
	
	function onchangeFnc() {
		
		var noticeCategoryObj = document.getElementById('noticeCategory').value;
		
		var noticeDateStartObj = document.getElementById('noticeDateStart');
		
		var noticeDateEndObj = document.getElementById('noticeDateEnd');
		
		if (noticeCategoryObj == 0 || noticeCategoryObj == ""){
			$('input[id^=noticeDate]').attr('disabled', 'disabled');
			$('#noticeDateStart').attr('value','');
			$('#noticeDateEnd').attr('value','');
		}else {
			$('input[id^=noticeDate]').removeAttr('disabled');
		}
		
	}
	
	
	function registrationFnc() {
		
		var categoryValid = noticeCategoryValidFnc();
		var titleValid = titleValidFnc();
		var contentValid = contentValidFnc();
		var noticeDateStartValid = noticeDateStartValidFnc();
		var noticeDateEndValid = noticeDateEndValidFnc();
		
		if(categoryValid && titleValid && contentValid && noticeDateStartValid && noticeDateEndValid){
			var registration = confirm("게시글을 수정 하시겠습니다??");
		
			if (registration == true) {
				alert("게시글이 수정되었습니다.");
			}else if(registration == false){
				alert("취소되었습니다.");
				return false;
			}
		   	return true;
		}
		return false;
	}
		
	function noticeCategoryValidFnc() {
		var noticeCategoryObj = $('#noticeCategory').val();
		
		 if(noticeCategoryObj == "") {
			 $('#typeCheck').html("종류를 선택해주세요.");
			 $('#typeCheck').css('color', 'red');
			 return false;
		 }else if (noticeCategoryObj != "") {
			 $('#typeCheck').html("");
			 return true;
		 }
		
	}
	
	function titleValidFnc() {
		
		
		var titleObj = $('#title').val();
		
		 if(titleObj == "") {
			 $('#titleCheck').html("제목을 입력해 주세요.");
			 $('#titleCheck').css('color', 'red');
			 return false;
		 }else if (titleObj != "") {
			 $('#titleCheck').html("");
			 return true;
		 }
	}
	
	function contentValidFnc() {
		var contentObj = $('#content').val();
		
		 if(contentObj == "") {
			 $('#contentCheck').html("내용을 입력해주세요.");
			 $('#contentCheck').css('color', 'red');
			 return false;
		 }else if (contentObj != "") {
			 $('#contentCheck').html("");
			 return true;
		 }
	}

	function noticeDateStartValidFnc() {
		
		var noticeCategoryObj = $('#noticeCategory').val();
		
		var noticeDateStartObj = $('#noticeDateStart').val();
		
		var noticeDateEndObj = $('#noticeDateEnd').val();
		
		if(noticeCategoryObj != 0 && noticeDateStartObj == "") {
			 $('#noticeDateCheck').html("시작일을 선택해주세요.");
			 $('#noticeDateCheck').css('color', 'red');
			 return false;
		 }else if (noticeDateStartObj != "") {
			 $('#noticeDateCheck').html("");
			 
		 }
		 
		 if (noticeDateStartObj > noticeDateEndObj && noticeDateEndObj != '') {
			 $('#noticeDateCheck').html("시작일이 종료일보다 클 수 없습니다.");
			 $('#noticeDateCheck').css('color', 'red');
			 return false;
		}else if(noticeDateStartObj <= noticeDateEndObj){
			$('#noticeDateCheck').html("");
			return true;
		}
	}
	
	function noticeDateEndValidFnc() {
		
		var noticeCategoryObj = $('#noticeCategory').val();
		var noticeDateEndObj = $('#noticeDateEnd').val();
		var noticeDateStartObj = $('#noticeDateStart').val();
		
		if(noticeCategoryObj != 0 && noticeDateEndObj == "") {
			$('#noticeDateCheck').html("종료일을 선택해주세요.");
			$('#noticeDateCheck').css('color', 'red');
			return false;
		}else if (noticeDateEndObj != "") {
			$('#noticeDateCheck').html("");	
			
		}
		
		if (noticeDateStartObj > noticeDateEndObj && noticeDateEndObj != '') {
			$('#noticeDateCheck').html("시작일이 종료일보다 클 수 없습니다.");
			$('#noticeDateCheck').css('color', 'red');
			return false;
		}else if(noticeDateStartObj <= noticeDateEndObj){
			$('#noticeDateCheck').html("");
			return true;
		}
	}
	
$(document).ready(function() {
	
	$("#noticeCategory").on("change", noticeCategoryValidFnc);

	$("#title").on("blur", titleValidFnc);
	
	$("#content").on("change", contentValidFnc);
	
	$("#noticeDateStart").on("change", noticeDateStartValidFnc);
	
	$("#noticeDateEnd").on("change", noticeDateEndValidFnc);
	
	
})
	
	
	
	function updateFnc() {
		
		var updateCtrDtoObj = document.getElementById('updateCtrDto');
		
		if(registrationFnc()){
			updateCtrDtoObj.submit();
		}
		
		
	}
		
	
	
	
	
	
	
</script>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header.jsp" />
		
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>페이지 제목</h2>
			
			<!-- 도서 등록 start -->
			<div id='detailWrap'>
				<!--  -->
				<div class='detailTable detailInputTable'>
					<form id="updateCtrDto" name="noticeDto" action="./updateCtr.do" method="post">
						<table>
							<colgroup>
								<col width="214px">
								<col width="786px">
							</colgroup>
							<tbody>
							
								<tr>
									<th class='text bold textDark inputTh'>종류</th>
									<td class='inputTd'>
										<input type="hidden" value="${noticeDto.no}" name="no">
										<input type="hidden" value="${noticeDto.name}" name="name">
										<input id="hiddenNoticeCategory" type="hidden" name="code" 
											value="${noticeDto.code}">
										<select id="noticeCategory" name="categoryCode" 
											class='detailSelect text textGrey' onchange = "onchangeFnc()">
											
										</select>
										<p id="typeCheck">
										</p>
									</td>
								</tr>
								
								<tr>
									<th class='text bold textDark inputTh'>제목</th>
									<td class='inputTd'>
										<input id="title" type="text" name="title" 
											class='detailInput text textGrey' value="${noticeDto.title }">
										<p id="titleCheck">
										</p>	
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>내용</th>
									<td class='inputTd'>
										<textarea id="content" rows="50" cols="20" 
											class='detailInput detailTextArea text textGrey' name='content'>
										${noticeDto.content }
										</textarea>
										<p id="contentCheck">
										</p>
									</td>
								</tr>
								
								<fmt:formatDate value="${noticeDto.startDate}" var = "startDate"
 									pattern="yyyy/MM/dd"/>  
 								<fmt:formatDate value="${noticeDto.endDate}" var = "endDate" 
 									pattern="yyyy/MM/dd"/>  
								
								<tr id="test">
									<th class='text bold textDark inputTh'>기간</th>
									<td class='inputTd'>
										<div class='searchInputBox overH' style="width: 100%;">
										
											<input type="hidden" id="hiddenNoticeDateStart" 
												value="${startDate}" >
												
											<input type="hidden" id="hiddenNoticeDateEnd" 
												value="${endDate}" >
												
											<input type="text" id="noticeDateStart" 
												class='searchInput searchDate fLeft datePicker' 
												readonly="readonly" style="width: 345px;" name="startDate"  >
												
											<span class='range fLeft text bold' style="padding-left: 10px;
												 padding-right: 10px;">~
											</span>
											
											<input type="text" id="noticeDateEnd" 
												class='searchInput searchDate fLeft datePicker'
													 readonly="readonly" style="width: 345px;" name="endDate" >
										</div>
										<p id="noticeDateCheck">
										</p>
									</td>
								</tr>
						
							</tbody>
						</table>
					</form>
				</div>
				
				<!-- 상세페이지 버튼 start -->
				<div class='btnWrap viewBtns fs0 tCenter'>
					
					<a href="#none" class='btn grey' onclick="updateFnc()">등록</a>
					<a href="./deleteCtr.do?no=${noticeDto.no}" class='btn green'>삭제</a>
					<a href="./list.do" class='btn green'>목록</a>
				</div>
				
				</div>
				<!-- //상세페이지 버튼 end -->
			</div>
			<!-- //도서등록 end -->
			
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
	

</body>

</html>