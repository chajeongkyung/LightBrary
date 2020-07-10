<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>LightBrary : 게시판등록</title>

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
	$(function(){
		$(".datePicker").datepicker({
			dateFormat: "yy/mm/dd",
			changeYear: true,
			showButtonPanel: true
		});
		
		noticeCategorySelect();
	});
	
	function noticeCategoryOnload(){
		initNoticeCategory();
	}
	
	
	window.onload = function() {
		if (noticeCategoryObj == ""){
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
			$('#noticeDateCheck').html('');
		}else {
			$('input[id^=noticeDate]').removeAttr('disabled');
		}
		
	}
	
	function noticeFormSubmitFnc() {
		
		if(registrationFnc()){
			$('#noticeForm').submit();
		}
		
// 		var noticeFormObj = document.getElementById('noticeForm');
// 		if(registrationFnc()){
// 			noticeFormObj.submit();
// 		}
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
			
			var registration = confirm("게시글을 등록하시겠습니다?");
		
			if (registration == true) {
				alert("게시글이 등록되었습니다.");
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
		
// 		if ((noticeDateStartObj == "" && noticeDateEndObj == "") && noticeCategoryObj != 0) {
// 			$('#noticeDateCheck').html("날짜를 선택해주세요");
// 			$('#noticeDateCheck').css('color', 'red');
// 			return false;
// 		}else{
// 			return true;
// 		}
		
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
		 
// 		 if (noticeDateStartObj > noticeDateEndObj && noticeDateEndObj != '') {
// 			 $('#noticeDateCheck').html("시작일이 종료일보다 클 수 없습니다.");
// 			 $('#noticeDateCheck').css('color', 'red');
// 			 return false;
// 		}else if(noticeDateStartObj <= noticeDateEndObj){
// 			$('#noticeDateCheck').html("");
// 			return true;
// 		}
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
		
// 		if (noticeDateStartObj > noticeDateEndObj && noticeDateEndObj != '') {
// 			$('#noticeDateCheck').html("시작일이 종료일보다 클 수 없습니다.");
// 			$('#noticeDateCheck').css('color', 'red');
// 			return false;
// 		}else if(noticeDateStartObj <= noticeDateEndObj){
// 			$('#noticeDateCheck').html("");
// 			return true;
// 		}
	}
	
$(document).ready(function() {
	
	$("#noticeCategory").on("change", noticeCategoryValidFnc);

	$("#title").on("blur", titleValidFnc);
	
	$("#content").on("change", contentValidFnc);
	
	$("#noticeDateStart").on("change", noticeDateStartValidFnc);
	
	$("#noticeDateEnd").on("change", noticeDateEndValidFnc);
	
	
	
	
	
});
	
	
	
		
	
</script>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header.jsp" />
		
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>게시글등록</h2>
			
			<!-- 도서 등록 start -->
			<div id='detailWrap'>
				<!--  -->
				<form action="./addCtr.do" method="post" id="noticeForm" name="noticeDto">
					<input type="hidden" name="memberNo" value="${member.no}">
					<div class='detailTable detailInputTable'>
						
						<table>
							<colgroup>
								<col width="214px">
								<col width="786px">
							</colgroup>
							
							<tbody>
						
								<tr>
									<th class='text bold textDark inputTh'>종류</th>
									<td class='inputTd'>
										<select id="noticeCategory" name="categoryCode" class='detailSelect text textGrey' 
											onchange = "onchangeFnc()">
											<option value="" id="type">종류</option>
										</select>
									<p id="typeCheck">
									</p>
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>제목</th>
									<td class='inputTd'>
										<input id="title" name="title" type="text"  class='detailInput text textGrey'>
									<p id="titleCheck">
									</p>
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>내용</th>
									<td class='inputTd'>
										<textarea id="content" name="content" rows="50" cols="20" class='detailInput detailTextArea 
											text textGrey'></textarea>
									<p id="contentCheck">
									</p>
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>기간</th>
									<td class='inputTd'>
										<div class='searchInputBox overH' style="width: 100%;">
											<input type="text" id="noticeDateStart" name="startDate" 
											class='searchInput searchDate fLeft datePicker' readonly="readonly" 
												style="width: 345px;" value="${noticeDto.startDate}">
											<span class='range fLeft text bold' style="padding-left: 10px; 
												padding-right: 10px;">
												~
											</span>
											<input type="text" id="noticeDateEnd" name="endDate" 
												class='searchInput searchDate fLeft datePicker' readonly="readonly"
													 style="width: 345px;" value="${noticeDto.endDate }">	
										</div>
										
									<p id="noticeDateCheck"></p>
										
									
									</td>
								</tr>
							</tbody>
						</table>
						
					</div>
				
					<!-- 상세페이지 버튼 start -->
					<div class='btnWrap viewBtns fs0 tCenter'>
						<a href="#none" class='btn grey' onclick="noticeFormSubmitFnc()">등록</a>
	<!-- 					./addCtr.do -->
						<a href="./list.do" class='btn green'>목록</a>
					</div>
				</form>
				</div>
				<!-- //상세페이지 버튼 end -->
			</div>
			<!-- //도서등록 end -->
			
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
	

</body>

<script type="text/javascript">










</script>

</html>