<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Lightbrary : 로그인</title>

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
				<h2 id='pageTitle'>로그인</h2>
					<form action='./loginCtr.do' id="loginCtrForm" method='post' 
						class='infoForm' onkeydown="if(event.keyCode == 13) checkAccountFnc();">
						
						<!-- 입력폼 start -->
						<div class='infoInputWrap'>
						
							<!--이메일 찾고난 뒤 -->
							<c:if test="${!empty findEmail}">
								<div class='inputBgBlock'>
									<img alt="이메일 아이콘" src="<%=request.getContextPath()%>/resources/img/icon-email.png"
										 class='inputIcon'>
									<input type="text" class='infoInput infoEmail' id="email" name="email" placeholder="이메일" value="${findEmail}">
								</div>
							</c:if>
							
							<!--기본로그인Form -->
							<c:if test="${empty findEmail}">
								<div class='inputBgBlock' style="margin-top: 20px;">
									<img alt="이메일 아이콘" src="<%=request.getContextPath()%>/resources/img/icon-email.png"
										 class='inputIcon'>
									<input type="text" class='infoInput infoEmail' id="email" name="email" placeholder="이메일">
								</div>
							</c:if>
							
							<div class='inputBgBlock' style="margin-top: 20px;">
								<img alt="비밀번호 아이콘" src="<%=request.getContextPath()%>/resources/img/icon-padlock.png"
									 class='inputIcon'>
								<input type="password" class='infoInput infoPassword'
								 	id="password" name="password" placeholder="비밀번호">
							</div>
								
							<p style="margin-top: 20px;" id="alertNoAccountMsg"></p>
							
							<div class="fs0" style="margin-top: 30px; text-align: center;">	
								<a href="./findEmail.do" class="text bold">이메일 찾기</a>
								<span class="text bold" style="margin: -2px 10px 0px;">|</span>
								<a href="./findPassword.do" class="text bold">비밀번호 찾기</a>
							</div>
						</div>
						<!-- //입력폼 end -->
						
						<!-- 상세페이지 버튼 start -->
						<div class='btnWrap tCenter' style="margin-top: 20px;">
							<input type="button" onclick="checkAccountFnc();" class='btn green' value="로그인">
							<a href="/lightbrary/member/add.do" class="subBtn text bold">회원가입</a>
						</div>
						<!-- //상세페이지 버튼 end -->
					</form>
			</div>
		<!-- //컨테이너 end -->
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
	</div>
	

</body>

<script type="text/javascript">
	
	function checkAccountFnc() {

		var emailObj = $('#email').val();
		var passwordObj = $('#password').val();

		$.ajax({
			url : "/lightbrary/member/checkAccount.do",
			type : "post",
			data : {
				"email": emailObj,
				"password": passwordObj
			},
			success : function(data) {
				console.log("null=계정없음, !null=계정있음 "+ data);							
				
 				if (data == "") {
 						$('#alertNoAccountMsg').html("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다. 다시 확인해 주세요.");
 						$("#alertNoAccountMsg").attr('class', 'text textRed');
 						$("#alertNoAccountMsg").css('line-height', '140%');
 						$("#alertNoAccountMsg").css('font-size', '13px');
 					} else{
 						$('#alertNoAccountMsg').html("");
 						console.log(data);
 						$('#loginCtrForm').submit();
 					}
				}, error : function() {
						console.log("실패");
				}
			});
	}

</script>

</html>