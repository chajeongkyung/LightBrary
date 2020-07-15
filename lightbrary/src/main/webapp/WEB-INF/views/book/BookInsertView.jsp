<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>LightBrary : 도서 등록</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
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
		$('#file').on("change", imageFileSelectFnc);
		$('#bookNav').addClass('active');
		$('#bookDepth2 > li:nth-child(2)').addClass('active');
	});
	
	function selectCategorybySearchParam(){
		var category1 = $('#hiddenBookCategory1').val();
		var category2 = $('#hiddenBookCategory2').val();
		var category3 = $('#hiddenBookCategory3').val();
		
		$('#bookCategory1').val(category1);
		$('#bookCategory1').trigger("change");
		$('#bookCategory2').val(category2);
		$('#bookCategory2').trigger("change");
		$('#bookCategory3').val(category3);
		
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
	}
	
	function bookInsertFormSubmit(){
		if(validateAll()){
			$('#bookInsertForm').submit();
		}
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
</script>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header.jsp" />
		
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>단편 도서 등록</h2>
			
			<!-- 도서 등록 start -->
			<div id='detailWrap'>
				<!--  -->
				<form id='bookInsertForm' name='bookDto' action='./insertCtr.do' method="post" enctype="multipart/form-data">
					<div class='detailTable'>
						<table>
							<colgroup>
								<col width="214px">
								<col width="786px">
							</colgroup>
							<tbody>
								<tr>
									<th class='text bold textDark'>이미지</th>
									<td class='overH'>
										<input type="file" id="file" name="file" class='fLeft' accept="image/*">
										<input type="hidden" id="fileUrlDefault" value="url('<%=request.getContextPath()%>/resources/img/noimage.jpg')">
										<div id='bookImage' class='fRight bgCover' style="margin: 0px; background-image: url('<%=request.getContextPath()%>/resources/img/noimage.jpg')"></div>
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
										<input type="hidden" id="hiddenBookCategory1" value="">
										<select id='bookCategory1' name="bookCategory1" class='detailSelect bigger text textGrey'>
										</select>
										<input type="hidden" id="hiddenBookCategory2" value="">
										<select id='bookCategory2' name="bookCategory2" class='detailSelect bigger text textGrey'>
										</select>
										<input type="hidden" id="hiddenBookCategory3" value="">
										<select id='bookCategory3' name="bookCategory3" class='detailSelect bigger text textGrey'>
										</select>
										<div id="alertInvalidCategoryMsg" class="textRed alertMsgBox"></div>
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>제목</th>
									<td class='inputTd fs0'>
										<input type="text" id="name" name="name" class='detailInput text textGrey'>
										<div id="alertInvalidNameMsg" class="textRed alertMsgBox"></div>
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>저자</th>
									<td class='inputTd'>
										<input type="text" id="writer" name="writer" class='detailInput text textGrey'>
										<div id="alertInvalidWriterMsg" class="textRed alertMsgBox"></div>
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>출판사</th>
									<td class='inputTd'>
										<input type="text" id="publish" name="publish" class='detailInput text textGrey'>
										<div id="alertInvalidPublishMsg" class="textRed alertMsgBox"></div>
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>출판일</th>
									<td class='inputTd'>
										<input type="text" id="publishDate" name="publishDate" class='searchInput searchDate textGrey datePicker' readonly="readonly" value='' style="height: 50px;">
										<div id="alertInvalidPublishDateMsg" class="textRed alertMsgBox"></div>
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>상태</th>
									<td class='inputTd'>
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
					<a href="./list.do" class='btn grey'>목록</a>
					<a href="#none" onclick="bookInsertFormSubmit();" class='btn green'>등록</a>
				</div>
				<!-- //상세페이지 버튼 end -->
			</div>
			<!-- //도서등록 end -->
			
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail_temp.jsp" />
	</div>

</body>

</html>