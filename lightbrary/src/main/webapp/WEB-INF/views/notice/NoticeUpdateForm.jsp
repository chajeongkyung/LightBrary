<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>LightBrary : 게시판수정</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/noticeCategorySelect.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/validation.js"></script>

<script type="text/javascript">
	
	function clearDateFnc(obj){
		
		obj.previousElementSibling.value = "";
		
	}
	
	function deleteFnc() {
		
		var result = confirm("게시글을 삭제 하시겠습니까?");
		
		if(result){
			alert("게시글이 삭제 되었습니다.");
			location.href = "./deleteCtr.do?no=" + ${noticeDto.no};
		}else if(result == false){
			alert("취소되었습니다.");
		}
		
	}
	
	$(function(){
		
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
			$('input[id^=noticeDate]').removeClass('searchDate');
			$('input[id^=noticeDate]').css('background', '#BDBDBD');
			$('button').removeClass('clear');
		}
	}
	
	function onchangeFnc() {
		
		var noticeCategoryObj = document.getElementById('noticeCategory').value;
		
		var noticeDateStartObj = document.getElementById('noticeDateStart');
		
		var noticeDateEndObj = document.getElementById('noticeDateEnd');
		
		if (noticeCategoryObj == 0 || noticeCategoryObj == ""){
			$('input[id^=noticeDate]').attr('disabled', 'disabled');
			$('input[id^=noticeDate]').attr('value', '');
			$('input[id^=noticeDate]').removeClass('searchDate');
			$('input[id^=noticeDate]').css('background', '#BDBDBD');
			$('#noticeDateCheck').html('');
			$('button').removeClass('clear');
			
		}else {
			$('input[id^=noticeDate]').removeAttr('disabled');
			$('input[id^=noticeDate]').addClass('searchDate');
			$('input[id^=noticeDate]').css('background', '');
			$('button').addClass('clear');
		}
		
	}
	
	
	function registrationFnc() {
		
		var categoryValid = noticeCategoryValidFnc();
		var titleValid = titleValidFnc();
		var contentValid = contentValidFnc();
		var noticeDateStartValid = true;
		var noticeDateEndValid = true;
		var noticeDateValid = true;
		
		var noticeCategoryObj = $('#noticeCategory').val();
		var noticeDateStartObj = $('#noticeDateStart').val();
		var noticeDateEndObj = $('#noticeDateEnd').val();
		
		if (noticeCategoryObj == "" || (noticeDateStartObj == "" && noticeDateEndObj == "" 
				&& noticeCategoryObj != 0)) {
			$('#noticeDateCheck').html("날짜를 선택해주세요");
			$('#noticeDateCheck').css('color', 'red');
			return false;
		}else if(noticeCategoryObj != ""){
			$('#noticeDateCheck').html("");
		}
		
		if(noticeCategoryObj != 0){
			noticeDateStartValid = noticeDateStartValidFnc();
			if(noticeDateStartValid){
				noticeDateEndValid = noticeDateEndValidFnc();
				if(noticeDateEndValid){
					noticeDateValid = noticeDateValidFnc();
				}
			}
		}
		
		if(categoryValid && titleValid && contentValid && noticeDateStartValid 
					&& noticeDateEndValid && noticeDateValid){
			
			var registration = confirm("게시글을 수정 하시겠습니다?");
		
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
	
	function noticeDateValidFnc() {
		
		var noticeDateStartObj = $('#noticeDateStart').val();
		
		var noticeDateEndObj = $('#noticeDateEnd').val();
		
		var noticeCategoryObj = $('#noticeCategory').val();
		
		var noticeDateValid = isValidDateRange($('#noticeDateStart').val(), $('#noticeDateEnd').val());
		
		if(noticeDateValid && noticeCategoryObj != 0){
			return true;
		}else if(!noticeDateValid && noticeCategoryObj != 0){
			$('#noticeDateCheck').html("시작일이 종료일보다 클 수 없습니다.");
			$('#noticeDateCheck').css('color', 'red');
			return false;
		}		
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
		
		if(noticeDateStartObj == "") {
			 $('#noticeDateCheck').html("시작일을 선택해주세요.");
			 $('#noticeDateCheck').css('color', 'red');
			 return false;
		 }else if (noticeDateStartObj != "" || noticeCategoryObj == 0) {
			 $('#noticeDateCheck').html("");
			 return true;
		}
	}
	
	function noticeDateEndValidFnc() {
		
		var noticeCategoryObj = $('#noticeCategory').val();
		var noticeDateEndObj = $('#noticeDateEnd').val();
		
		if(noticeDateEndObj == "") {
			$('#noticeDateCheck').html("종료일을 선택해주세요.");
			$('#noticeDateCheck').css('color', 'red');
			return false;
		}else if (noticeDateEndObj != "" || noticeCategoryObj == 0) {
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
		
	});
	
	
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
			<h2 id='pageTitle'>게시글수정</h2>
			
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
											class='detailInput detailTextArea text textGrey' name='content'>${noticeDto.content }
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
											
											<div class='dateInputBox fLeft'>	
												<input type="text" id="noticeDateStart" 
													class='searchInput searchDate fLeft datePicker' 
													readonly="readonly" style="width: 345px;" name="startDate"  >
												<button type="button" class='clear' onclick='clearDateFnc(this);'>
													</button>
											</div>
												
											<span class='range fLeft text bold' style="padding-left: 10px;
												 padding-right: 10px;">~
											</span>
											
											<div class='dateInputBox fLeft'>
												<input type="text" id="noticeDateEnd" 
													class='searchInput searchDate fLeft datePicker'
														 readonly="readonly" style="width: 345px;" name="endDate" >
												<button type="button" class='clear' onclick='clearDateFnc(this);'>
												</button>	 
											</div>		 
										</div>
										<span id="noticeDateCheck">
										</span>
										<span id="noticeDateCheck2"></span>
									</td>
								</tr>
						
							</tbody>
						</table>
					</form>
				</div>
				
				<!-- 상세페이지 버튼 start -->
				<div class='btnWrap viewBtns fs0 tCenter'>
					
					<a href="./list.do" class='btn grey'>목록</a>
					<a href="#none" class='btn grey' onclick="deleteFnc()">삭제</a>
					<a href="#none" class='btn green' onclick="updateFnc()">등록</a>
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