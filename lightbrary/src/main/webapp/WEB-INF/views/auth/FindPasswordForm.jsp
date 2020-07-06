<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 찾기</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header_temp.jsp" />
	
		<!-- 컨테이너 start -->
			<div id='container'>
				<h2 id='pageTitle'>비밀번호 찾기</h2>
					<form action='./sendEmail.do' id="findPasswordForm" method='post' class='infoForm'>
						<div class='infoInputWrap'>
							<input type="text" class='infoInput infoName' id="email" name="email" placeholder="이메일">
								<p style="margin-bottom: 10px;" id="alertNoAccountMsg"></p>
								<div class="text" style="margin-top: 10px;">	
									고객님께서 회원가입 시 입력한 이메일 주소로 비밀번호를 재설정 할 수 있는
									링크를 보내드립니다.
								</div>
						</div>
						<div class='btnWrap tCenter' style="margin-top: 30px;">
							<input type="button" onclick="checkAccountFnc();" class='btn green' value="전송">
							<a href="./login.do" class="subBtn text bold">로그인으로 돌아가기</a>
						</div>
					</form>
			</div>
		<!-- //컨테이너 end -->
		<jsp:include page="/WEB-INF/views/Tail_temp.jsp" />
		
	</div>
	

</body>

<script type="text/javascript">
	
function checkAccountFnc() {

var emailObj = $('#email').val();
	
	$.ajax({
		url : "/lightbrary/member/checkEmail.do",
		type : "POST",
		data : "email=" + emailObj,
		success : function(data) {
			console.log("1 = 이메일o / 0 = 이메일x : "+ data);							
			
			if (data == 0) {
					$('#alertNoAccountMsg').html("가입되지 않은 이메일입니다. 다시 확인해 주세요.");
					$("#alertNoAccountMsg").css("color", "red");
					$("#alertNoAccountMsg").attr('class', 'text');
					
				} else if (data == 1){
					$('#alertNoAccountMsg').html("");
					$('#findPasswordForm').submit();
					alert('이메일을 전송하였습니다. 확인해보세요');
					//이메일로 전송을 해주는 로직!
				}
			}, error : function() {
					console.log("실패");
			}
		});
}

</script>

</html>