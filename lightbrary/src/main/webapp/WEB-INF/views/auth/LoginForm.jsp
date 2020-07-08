<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>

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
					<form action='./loginCtr.do' id="loginCtrForm" method='post' class='infoForm'>
						<div class='infoInputWrap'>
							<input type="text" class='infoInput infoEmail' id="email" name="email" placeholder="이메일" value="">
							<input type="password" style="margin-top: 20px;" class='infoInput infoPassword'
								 id="password" name="password" placeholder="비밀번호" value="">
								<p style="margin-top: 20px;" id="alertNoAccountMsg"></p>
								<div style="margin-top: 20px;">	
									<a href="./findEmail.do" class="text bold">이메일 찾기 | </a>
									<a href="./findPassword.do" class="text bold">비밀번호 찾기</a>
								</div>
						</div>
						<div class='btnWrap tCenter' style="margin-top: 30px;">
							<input type="button" onclick="checkAccountFnc();" class='btn green' value="로그인">
							<a href="./member/add.do" class="subBtn text bold">회원가입</a>
						</div>
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
 						$("#alertNoAccountMsg").css("color", "red");
 						$("#alertNoAccountMsg").attr('class', 'text bold');
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