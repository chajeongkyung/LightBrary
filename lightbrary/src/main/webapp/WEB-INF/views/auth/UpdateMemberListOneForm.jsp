<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원관리</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header.jsp" />
		
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>회원관리</h2>
			<!-- 상세페이지 start -->
			<div id='detailWrap'>
				<form action="./updateCtr.do" onsubmit="return updateMemberFnc();" method='post'>
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
					<!--  -->
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
									<th class='inputTd'>가입일</th>
									<td class='text textGrey'><fmt:formatDate value="${memberDto.createdDate}" pattern="yyyy년 MM월 dd일 "/></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<!-- 상세페이지 버튼 start -->
					<div class='btnWrap viewBtns fs0 tCenter'>
						<a href="#" class='btn grey'>비밀번호 초기화</a>
						<a href="#" onclick="deleteMemberFnc();" class='btn grey'>강퇴</a>
						<a href="<%=request.getContextPath()%>/member/list.do" class='btn green'>목록</a>
					</div>
					<!-- //상세페이지 버튼 end -->
				</form>
			</div>
			<!-- //상세페이지 end -->
			
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
	</div>

</body>

<script type="text/javascript">
	
	function deleteMemberFnc() {
		var answer = confirm('정말 탈퇴하시겠습니까?');
		
		if (answer) {
			location.href = '<%=request.getContextPath()%>/member/deleteCtr.do?no=${memberDto.no}';	
		}
	}

</script>

</html>