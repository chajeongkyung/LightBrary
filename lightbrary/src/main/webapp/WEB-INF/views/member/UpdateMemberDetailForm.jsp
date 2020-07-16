<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Lightbrary : 내 정보</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/validation.js"></script>

<style type="text/css">
	.alertMsgBox {
		padding-top:10px;
		font-size:13px;
		display: block;
	}
</style>

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
										<input type="password" id="password" name="password" class='detailInput text textGrey'>
										<input type="hidden" name="no" value="${member.no}">
										<input type="hidden" name="email" value="${member.email}">
										<input type="hidden" name="createdDate"
											value="<fmt:formatDate value="${member.createdDate}" pattern="yyyy/MM/dd HH:mm:ss"/>">
										<div id="alertPasswordErrorMsg" class="textRed alertMsgBox"></div>
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>비밀번호 재확인</th>
									<td class='inputTd'>
										<input type="password" id="checkPassword" class='detailInput text textGrey'>
										<div id="alertcheckPasswordErrorMsg" class="textRed alertMsgBox"></div>
									</td>
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
									<td class='inputTd'>
										<input type="text" id="name" name="name" class='detailInput text textGrey' value="${member.name}">
										<div id="alertNameErrorMsg" class="textRed alertMsgBox"></div>
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>연락처</th>
									<td class='inputTd'>
										<input type="text" id="phone" name="phone" class='detailInput text textGrey' value="${member.phone}">
										<div id="alertPhoneErrorMsg" class="textRed alertMsgBox"></div>
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>주소</th>
									<td class='inputTd'>
										<input type="text" id="address" name="address" class='detailInput text textGrey' value="${member.address}">
										<div id="alertAddressErrorMsg" class="textRed alertMsgBox"></div>
									</td>
								</tr>
								<tr>
									<th class='text bold textDark inputTh'>가입일</th>
									<td class='text textGrey'>
										<fmt:formatDate value="${member.createdDate}" pattern="yyyy/MM/dd HH:mm:ss"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<!-- 상세페이지 버튼 start -->
					<div class='btnWrap viewBtns fs0 tCenter'>
						<a href="./detail.do" class='btn grey'>뒤로</a>
						<a onclick="deleteMemberFnc();" class='btn grey'>탈퇴하기</a>
						<input type="submit" id="updateBtn" class='btn green' value="적용">
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

	var nameValCnt = 0; 
	var phoneValCnt = 0; 
	var passwordValCnt = 0; 
	var passwordCheckValCnt = 0; 
	var addressValCnt = 0; 
	
	function deleteMemberFnc() {
		var answer = confirm('정말 탈퇴하시겠습니까?\n(연체 도서가 남아 있을 시 탈퇴가 불가합니다)');
		
		if (answer) {
			
			$.ajax({
				url : "./checkRent.do",
				type : "GET",
				data : "no=" + '${member.no}',
				success : function(data) {
					console.log(data);							
					
					if (data == 0) {
							alert('성공적으로 탈퇴 처리되었습니다');
			 				location.href = './deleteCtr.do?no=${member.no}'
						} else{
							alert('연체 도서가 남아 있어 탈퇴가 불가합니다');
						}
					}, error : function() {
							console.log("실패");
					}
				});

		}
	}
	function updateMemberFnc() {
		var totalValCnt = nameValCnt + phoneValCnt 
			+ passwordValCnt + passwordCheckValCnt + addressValCnt;

		if (totalValCnt == 0) {
			var answer = confirm('회원 정보를 수정하시겠습니까?');
			
			if (answer) {
				alert('성공적으로 수정되었습니다.');
				return true;
			}else {
				return false;
			}
		}else {
			alert('다시 확인해주세요');
			return false;
		}
	}
	
	$("#name").blur(function() {
		var nameObj = $('#name').val();
		
		 if(isNull(nameObj)) {
			 $('#alertNameErrorMsg').html("성함을 입력해 주세요.");
			 nameValCnt++;
		 }else if (!isValidName(nameObj)) {
			 $('#alertNameErrorMsg').html("한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
			 nameValCnt++;
		 }else {
			 $('#alertNameErrorMsg').html("");
			 nameValCnt = 0;
		}
	});

	$("#phone").blur(function() {
		var phoneObj = $('#phone').val();
		
		 if(isNull(phoneObj)) {
			 $('#alertPhoneErrorMsg').html("연락처를 입력해 주세요.");
			 phoneValCnt++;
		}else if (!isValidPhone(phoneObj)) {
			 $('#alertPhoneErrorMsg').html("숫자만 입력해 주세요.");
			 phoneValCnt++;
		}else {
			 $('#alertPhoneErrorMsg').html("");
			 phoneValCnt = 0;
		}
	});
	
	$("#password").blur(function() {
		var passwordObj = $('#password').val();
		
		 if(isNull(passwordObj)) {
			 $('#alertPasswordErrorMsg').html("비밀번호를 입력해 주세요.");
			 passwordValCnt++;
		 }else if (!isValidPassword(passwordObj)) {
			 $('#alertPasswordErrorMsg').html("8~16자 영문,숫자,특수문자를 사용하세요.");
			 passwordValCnt++;
		}else {
			 $('#alertPasswordErrorMsg').html("");
			 passwordValCnt = 0;
		}
	});

	$("#checkPassword").blur(function() {
		
		var passwordObj = $('#password').val();
		var checkPasswordObj = $('#checkPassword').val();
		
		 if(isNull(checkPasswordObj)) {
			 $('#alertcheckPasswordErrorMsg').html("비밀번호를 확인해 주세요.");
			 passwordCheckValCnt++;
		}else if (passwordObj != checkPasswordObj) {
			 $('#alertcheckPasswordErrorMsg').html("비밀번호가 일치하지 않습니다.");
			 passwordCheckValCnt++;
		}else {
			 $('#alertcheckPasswordErrorMsg').html("");	
			 passwordCheckValCnt = 0;
		}
	});

	$("#address").blur(function() {
		var addressObj = $('#address').val();
		
		 if(isNull(addressObj)) {
			 $('#alertAddressErrorMsg').html("주소를 입력해 주세요.");
			 addressValCnt++;
		}else {
			 $('#alertAddressErrorMsg').html("");
			 addressValCnt = 0;
		}
	});


</script>

</html>