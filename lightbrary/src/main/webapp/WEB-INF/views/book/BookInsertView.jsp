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

<script type="text/javascript">
	$(function(){
		bookCategorySelect();
		bookStatusSelect();
		
		$(".datePicker").datepicker({
			dateFormat: "yy/mm/dd",
			changeYear: true,
			showButtonPanel: true
		});
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
		$('#bookInsertForm').submit();
	}
</script>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header_temp.jsp" />
		
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>도서 등록</h2>
			
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
										<input type="file" id="file" name="file" class='fLeft'>
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
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>제목</th>
									<td class='inputTd fs0'>
										<input type="text" id="name" name="name" class='detailInput text textGrey'>
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>저자</th>
									<td class='inputTd'>
										<input type="text" id="writer" name="writer" class='detailInput text textGrey'>
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>출판사</th>
									<td class='inputTd'>
										<input type="text" id="publish" name="publish" class='detailInput text textGrey'>
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>출판일</th>
									<td class='inputTd'>
										<input type="text" id="publishDate" name="publishDate" class='searchInput searchDate textGrey datePicker' readonly="readonly" value='' style="height: 50px;">
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
					<a href="#none" onclick="bookInsertFormSubmit();" class='btn grey'>등록</a>
					<a href="./list.do" class='btn green'>목록</a>
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