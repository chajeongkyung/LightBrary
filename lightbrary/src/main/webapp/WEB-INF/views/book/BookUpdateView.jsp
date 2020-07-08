<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>LightBrary : 도서 수정</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bookCategorySelect.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bookStatusSelect.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/validation.js"></script>

<style type="text/css">
	.alertMsgBox {
		clear: left;
		font-size:13px;
		display: block;
	}
</style>

<script type="text/javascript">
	$(function(){
		bookCategorySelect();
		bookStatusSelect();
		
		$('#publishDate').datepicker("setDate", $('#hiddenPublishDate').val());
		$('#file').on("change", imageFileSelectFnc);
	});
	
	function selectCategorybySearchParam(){
		var categoryCode = $('#hiddenCategoryCode').val();
		var category1 = parseInt(categoryCode / 100) * 100;
		var category2 = parseInt(categoryCode / 10) * 10;
		var category3 = parseInt(categoryCode);
		
		$('#bookCategory1').val(bookCategoryObj[category1].code);
		$('#bookCategory1').trigger("change");
		$('#bookCategory2').val(bookCategoryObj[category2].code);
		$('#bookCategory2').trigger("change");
		$('#bookCategory3').val(bookCategoryObj[category3].code);
		
	}
	
	function bookCategoryOnload(){
		initBookCategory();
		selectCategorybySearchParam();
	}
	
	function bookStatusOnload(){
		$.each(bookStatusObj, function(idx, item){
			$appendStr = $('<option value="' + item.code + '">' + item.name + '</option>');
			$('#statusCode').append($appendStr);
		});
		
		$('#statusCode').val($('#hiddenStatusCode').val());
	}
	
	function bookInsertFormSubmit(){
		$('#bookInsertForm').submit();
	}
	
	function moveListFnc(){
		$('#bookListParamDto').submit();
	}
	
	function moveDetailFnc(){
		$('#bookListParamDto').attr("action", "./detail.do");
		$('#bookListParamDto').submit();
	}
	
	function updateBookFnc(){
		if(validateAll()){
			$appendStr = $('<form action="./updateCtr.do" id="bookUpdateForm" name="bookUpdateDto" method="post" enctype="multipart/form-data"></form>');
			$('#container').append($appendStr);
			
			$.each($('#bookDtoForm select[id^=bookCategory]'), function(idx, item){
				$appendStr = $('<input type="hidden" id="' + item.getAttribute("id")
						+'" name="' + item.getAttribute("name")
						+'" value="' + item.value + '">');
				$('#bookUpdateForm').append($appendStr);
			});
			$('#bookDtoForm input').clone().appendTo('#bookUpdateForm');
			$('#bookListParamDto input').clone().appendTo('#bookUpdateForm');
			$('#bookUpdateForm').attr('style', 'visibility: hidden');
			
			$('#bookUpdateForm').submit();
		}
	}
	
	function deleteBookFnc(){
		var baseUrl = window.location.protocol + "//" + window.location.host + "/lightbrary/";
		var no = $('#hiddenNo').val();
		$.ajax({
			type: "POST",
			url: baseUrl + 'book/delete.do',
			data: "no=" + no,
			success: function(data){
				alert('삭제되었습니다.');
				moveListFnc();
			},
			error: function(e){
				alert('오류');
			}
		});
	}
	
	function validateAll(){
		var categoryValid = !(isEmpty($('#bookCategory3').val()));
		if(categoryValid){
			$('#alertInvalidCategoryMsg').html('');
		} else{
			$('#alertInvalidCategoryMsg').html('분류를 모두 선택해 주세요');
		}
		
		var nameValid = !(isEmpty($('#name').val()));
		if(nameValid) {
			$('#alertInvalidNameMsg').html('');
		} else{
			$('#alertInvalidNameMsg').html('이름을 입력해 주세요');
		}
			
		var writerValid = !(isEmpty($('#writer').val()));
		if(writerValid){
			$('#alertInvalidWriterMsg').html('');
		} else{
			$('#alertInvalidWriterMsg').html('저자를 입력해 주세요');
		}
		
		var publishValid = !(isEmpty($('#publish').val()));
		if(publishValid){
			$('#alertInvalidPublishMsg').html('');
		} else{
			$('#alertInvalidPublishMsg').html('출판사를 입력해 주세요');
		}
		
		var publishDateValid = !(isEmpty($('#publishDate').val()));
		if(publishDateValid){
			$('#alertInvalidPublishDateMsg').html('');
		} else{
			$('#alertInvalidPublishDateMsg').html('출판일을 입력해 주세요');
		}
		return categoryValid && nameValid && writerValid && publishValid && publishDateValid;
	}	
	
	function imageDeleteFnc(){
		var imageStatusObj = $('#imageStatus');
		var imageStatus = $('#imageStatus').val();
		
		//imageStatus 0:default 1:modify 2:delete
		if (imageStatus == 0){
			initInputFile();
			$('#bookImage').css("background-image", $('#deletedFileUrlDefault').val());
			imageStatusObj.val(2);
		} else if(imageStatus == 1){
			initInputFile();
			$('#bookImage').css("background-image", $('#fileUrlDefault').val());
			imageStatusObj.val(0);
		}
	}
</script>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header.jsp" />
		
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>도서 수정</h2>
			
			<!-- 도서 수정 start -->
			<div id='detailWrap'>
				<!--  -->
				<form id='bookDtoForm' name='bookDto' action='./updateCtr.do' method="post" enctype="multipart/form-data">
					<input type="hidden" name="no" value="${bookDto.no}">
					<input type="hidden" name="imageNo" value="${bookDto.imageNo}">
					<div class='detailTable'>
						<table>
							<colgroup>
								<col width="214px">
								<col width="786px">
							</colgroup>
							<tbody>
								<tr>
									<th class='text bold textDark'>이미지</th>
									<td class='overH' style="position: relative;">
										<input type="file" id="file" name="file" class='fLeft'>
										<c:url var="imgUrl" value='/img/${bookDto.imageName}'/>
										<input type="hidden" id="fileUrlDefault" value="url('${imgUrl}')">
										<input type="hidden" id="deletedFileUrlDefault" value="url('<%=request.getContextPath()%>/resources/img/noimage.jpg')">
										<div id='bookImage' class='fRight bgCover' style="margin: 0px; background-image: url('${imgUrl}')"></div>
										<!-- imageStatus 0:default 1:modify 2:delete -->
										<input type="hidden" id="imageStatus" name="imageStatus" value="0">
										<a href="#none" onclick="imageDeleteFnc();" class="text textGrey" style="position: absolute; right: 34px; bottom: 5px; font-size: 14px;">
											이미지 삭제
										</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--  -->
					<div class='detailTable detailInputTable'>
						<p class='text bold textDark'>도서정보</p>
						<table>
							<colgroup>
								<col width="214px">
								<col width="786px">
							</colgroup>
							<tbody>
								<tr>
									<th class='text bold textDark inputTh'>분류</th>
									<td class='fs0 inputTd'>
										<input type="hidden" id="hiddenCategoryCode" value="${bookDto.categoryCode}">
										<select id='bookCategory1' name="bookCategory1" class='detailSelect bigger text textGrey'>
										</select>
										<select id='bookCategory2' name="bookCategory2" class='detailSelect bigger text textGrey'>
										</select>
										<select id='bookCategory3' name="bookCategory3" class='detailSelect bigger text textGrey'>
										</select>
										<div id="alertInvalidCategoryMsg" class="textRed alertMsgBox"></div>
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>제목</th>
									<td class='inputTd fs0'>
										<input type="text" id="name" name="name" class='detailInput text textGrey' value="${bookDto.name}">
										<div id="alertInvalidNameMsg" class="textRed alertMsgBox"></div>
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>저자</th>
									<td class='inputTd'>
										<input type="text" id="writer" name="writer" class='detailInput text textGrey' value="${bookDto.writer}">
										<div id="alertInvalidWriterMsg" class="textRed alertMsgBox"></div>
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>출판사</th>
									<td class='inputTd'>
										<input type="text" id="publish" name="publish" class='detailInput text textGrey' value="${bookDto.publish}">
										<div id="alertInvalidPublishMsg" class="textRed alertMsgBox"></div>
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>출판일</th>
									<td class='inputTd'>
										<fmt:formatDate var="fommatedPublishDate" value="${bookDto.publishDate}" pattern="yyyy/MM/dd"/>
										<input type="hidden" id="hiddenPublishDate" value="${fommatedPublishDate}">
										<input type="text" id="publishDate" name="publishDate" class='searchInput searchDate textGrey datePicker' readonly="readonly" style="height: 50px;">
										<div id="alertInvalidPublishDateMsg" class="textRed alertMsgBox"></div>
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>상태</th>
									<td class='inputTd'>
										<input type="hidden" id="hiddenStatusCode" value="${bookDto.statusCode}"> 
										<select id='statusCode' name='statusCode' class='detailSelect text textGrey'>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
				<!-- 상세페이지 버튼 start -->
				<div class='btnWrap viewBtns fs0 tCenter'>
					<a href="#none" onclick="updateBookFnc();" class='btn grey'>적용</a>
					<a href="#none" onclick="deleteBookFnc();" class='btn grey'>삭제</a>
					<a href="#none" onclick="moveListFnc();" class='btn green'>목록</a>
				</div>
				
				<form name="bookListParamDto" action="./list.do" id='bookListParamDto' method="post">
					<input type="hidden" id='hiddenNo' name='no' value="${bookDto.no}">
					<input type="hidden" name='curPage' value="${bookListParamDto.curPage}">
					<input type="hidden" name="searchName" value="${bookListParamDto.searchName}">
					<input type="hidden" name="searchWriter" value="${bookListParamDto.searchWriter}">
					<input type="hidden" name="searchPublish" value="${bookListParamDto.searchPublish}">
					<input type="hidden" name="publishDateStart" value="${bookListParamDto.publishDateStart}">
					<input type="hidden" name="publishDateEnd" value="${bookListParamDto.publishDateEnd}">
					<input type="hidden" name="searchCategory1" value="${bookListParamDto.searchCategory1}">
					<input type="hidden" name="searchCategory2" value="${bookListParamDto.searchCategory2}">
					<input type="hidden" name="searchCategory3" value="${bookListParamDto.searchCategory3}">
				</form>
				<!-- //상세페이지 버튼 end -->
			</div>
			<!-- //도서등록 end -->
			
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail_temp.jsp" />
	</div>

</body>

</html>