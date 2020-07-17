<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Lightbrary : 내 정보</title>

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
				<h2 id='pageTitle'>내 정보</h2>
					<form action='./update.do' id="findPasswordForm" method="post" class='infoForm'
						onkeydown="if(event.keyCode == 13) checkPasswordFnc();">
						
						<!-- 입력폼 start -->
						<div class='infoInputWrap'>
							<div class='inputBgBlock' style="margin-top: 20px;">
								<img alt="비밀번호 아이콘" src="<%=request.getContextPath()%>/resources/img/icon-padlock.png"
									 class='inputIcon'>
								<input type="password" class='infoInput infoPassword' 
									id="inputPassword" name="inputPassword" placeholder="비밀번호">
							</div>
								
							<p style="margin: 5px 0px 10px 0px;" id="alertNoPasswordMsg"></p>
							
							<div class="text" style="margin-top: 10px;">	
								본인 확인을 위해서 비밀번호를 입력해 주세요.
							</div>
						</div>
						<!-- //입력폼 end -->
						
						<!-- 상세페이지 버튼 start -->
						<div class='btnWrap tCenter' style="margin-top: 30px;">
							<input type="button" class='btn green' value="확인" onclick="checkPasswordFnc();">
							<input hidden="hidden" class='btn green' value="submit방지">
							<a href="./detail.do" class="subBtn text bold">뒤로</a>
						</div>
						<!-- //상세페이지 버튼 end -->
					</form>
			</div>
		<!-- //컨테이너 end -->
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
		
	</div>
	
</body>

<script type="text/javascript">
	
	
	function checkPasswordFnc() {
		var passwordObj = $('#inputPassword').val();
		var emailObj = "${member.email}";
		var loginData = { "email": emailObj, "password": passwordObj }
		var baseUrl = window.location.protocol + "//" + window.location.host + "/lightbrary/";
		$.ajax({
			type: "POST",
			url: baseUrl + 'passwordChk.do',
			data: loginData, 
			success: function(data){
				if(data == "true"){
					$('#alertNoPasswordMsg').html("");
					$('#findPasswordForm').submit();
// 					return true;
				} else{
					$('#alertNoPasswordMsg').html("비밀번호가 틀립니다. 다시 확인해 주세요.");
					$("#alertNoPasswordMsg").css("color", "#E92222");
					$("#alertNoPasswordMsg").css("font-size", "13px");
					$("#alertNoPasswordMsg").attr('class', 'text');
// 					return false;
				}
			},
			error: function(e){
				alert('오류');
	// 			return false;
			}
		});
	}

</script>

</html>