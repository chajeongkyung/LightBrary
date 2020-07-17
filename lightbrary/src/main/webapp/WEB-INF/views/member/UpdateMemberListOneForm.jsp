<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Lightbrary : 회원관리</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		// depth1 네비
		$('#depth1Ul > li:nth-child(1)').addClass('active');
	});
	
	function deleteMemberFnc() {
		
		var answer = confirm('해당 회원을 강퇴 시키겠습니까? \n해당 회원이 연체 도서가 있을 시 강퇴가 불가합니다.');
		
		if (answer) {
			
			$.ajax({
				url : "../member/checkRent.do",
				type : "GET",
				data : "no=" + '${memberDto.no}',
				success : function(data) {
					console.log(data);							
					
					if (data == 0) {
							alert('성공적으로 탈퇴 처리되었습니다');
			 				location.href = '../member/deleteCtr.do?no=${memberDto.no}'
						} else{
							alert('연체 도서가 남아 있어 탈퇴가 불가합니다');
						}
					}, error : function() {
							console.log("실패");
					}
				});
		}
	}
	
	function resetMemberPasswordFnc() {
		var answer = confirm('비밀번호 초기화를 진행하시겠습니까?');
		
		if (answer) {
			alert('비밀번호가 초기화 되었습니다');
			location.href = '<%=request.getContextPath()%>/sendEmail.do?email=${memberDto.email}';	
		}
	}

</script>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header.jsp" />
		
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>회원관리</h2>
			<!-- 상세페이지 start -->
			<div id='detailWrap'>
				<div class='detailTable'>
					<p class='text bold textDark'>계정정보</p>
					<table>
						<colgroup>
							<col width="214px">
							<col width="786px">
						</colgroup>
						<tbody>
							<tr>
								<th class='text bold textDark inputTh'>회원번호</th>
								<td class='text textGrey'>${memberDto.no}</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>이메일</th>
								<td class='text textGrey'>${memberDto.email}</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class='detailTable'>
					<p class='text bold textDark'>개인정보</p>
					<table>
						<colgroup>
							<col width="214px">
							<col width="786px">
						</colgroup>
						<tbody>
							<tr>
								<th class='text bold textDark inputTh'>이름</th>
								<td class='text textGrey'>${memberDto.name}</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>연락처</th>
								<td class='text textGrey'>${memberDto.phone}</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>주소</th>
								<td class='text textGrey'>${memberDto.address}</td>
							</tr>
							<tr>
								<th class='text bold textDark inputTh'>가입일</th>
								<td class='text textGrey'><fmt:formatDate value="${memberDto.createdDate}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
							</tr>
						</tbody>
					</table>
				</div>
					
				<!-- 상세페이지 버튼 start -->
				<div class='btnWrap viewBtns fs0 tCenter'>
					<a href="#" onclick="resetMemberPasswordFnc();" class='btn grey'>비밀번호 초기화</a>
					<a href="#" onclick="deleteMemberFnc();" class='btn grey'>강퇴</a>
					
					<c:if test="${listStatus == 'all'}"> 
						<form id='pagingForm' name='memberListParamDto' method="post" action="./list.do">
							<input type="submit" class='btn green' value="목록">
							<input type="hidden" id="no" name="no" value="${memberListParamDto.no}">
							<input type="hidden" name="name" value="${memberListParamDto.name}">
							<input type="hidden" name="email" value="${memberListParamDto.email}">
							<input type="hidden" name="phone" value="${memberListParamDto.phone}">
							<input type="hidden" name="joinDateStart" value="${memberListParamDto.joinDateStart}">
							<input type="hidden" name="joinDateEnd" value="${memberListParamDto.joinDateEnd}">
							<input type="hidden" id='curPage' name='curPage' value="${memberListParamDto.curPage}">
							<input type="hidden" id='listStatus' name='listStatus' value="${listStatus}">
						</form>
					</c:if>
					
					<c:if test="${listStatus == 'overdue'}"> 
						<form id='pagingForm' name='memberListParamDto' method="post" action="./overdueMemberList.do">
							<input type="submit" class='btn green' value="목록">
							<input type="hidden" id="no" name="no" value="${memberListParamDto.no}">
							<input type="hidden" name="name" value="${memberListParamDto.name}">
							<input type="hidden" name="email" value="${memberListParamDto.email}">
							<input type="hidden" name="phone" value="${memberListParamDto.phone}">
							<input type="hidden" name="joinDateStart" value="${memberListParamDto.joinDateStart}">
							<input type="hidden" name="joinDateEnd" value="${memberListParamDto.joinDateEnd}">
							<input type="hidden" id='curPage' name='curPage' value="${memberListParamDto.curPage}">
							<input type="hidden" id='listStatus' name='listStatus' value="${listStatus}">
						</form>
					</c:if>  	
					
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