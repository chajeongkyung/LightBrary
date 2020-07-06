<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>내 정보</title>

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
			<h2 id='pageTitle'>내 정보 수정</h2>
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
									<th class='text bold textDark inputTh'>이메일</th>
									<td class='text textGrey'>${member.email}</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>비밀번호 재설정</th>
									<td class='inputTd'>
										<input type="password" name="password" class='detailInput text textGrey'>
										<input type="hidden" name="no" value="${member.no}">
										<input type="hidden" name="email" value="${member.email}">
										<input type="hidden" name="createdDate"
											value="<fmt:formatDate value="${member.createdDate}" pattern="yyyy년 MM월 dd일 "/>">

									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>비밀번호 재확인</th>
									<td class='inputTd'>
										<input type="password" class='detailInput text textGrey'>
									</td>
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
									<td class='inputTd'>
										<input type="text" name="name" class='detailInput text textGrey' value="${member.name}">
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>연락처</th>
									<td class='inputTd'>
										<input type="text" name="phone" class='detailInput text textGrey' value="${member.phone}">
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>주소</th>
									<td class='inputTd'>
										<input type="text" name="address" class='detailInput text textGrey' value="${member.address}">
									</td>
								</tr>
								<tr>
									<th class='inputTd'>가입일</th>
									<td class='text textGrey'>
										<fmt:formatDate value="${member.createdDate}" pattern="yyyy년 MM월 dd일 "/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<!-- 상세페이지 버튼 start -->
					<div class='btnWrap viewBtns fs0 tCenter'>
						<a href="./detail.do" class='btn green'>뒤로</a>
						<a onclick="deleteMemberFnc();" class='btn grey'>탈퇴하기</a>
						<input type="submit" id="updateBtn" class='btn grey' value="적용">
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
			location.href = './deleteCtr.do?no=${member.no}';	
		}
	}
	function updateMemberFnc() {
		var answer = confirm('회원 정보를 수정하시겠습니까?');
		
		if (answer) {
			return true;
		}else {
			return false;
		}
	}
</script>

</html>