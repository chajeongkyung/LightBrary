<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Lightbrary : 이메일 찾기</title>

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
				<h2 id='pageTitle'>이메일 찾기</h2>
					<form action='./findEmailCtr.do' id="findEmailCtrForm" method='post' class='infoForm'>
						
						<!-- 입력폼 start -->
						<div class='infoInputWrap'>
							<input type="text" class='infoInput infoName' id="userName" name="userName" placeholder="성함">
							<input type="text" style="margin-top: 20px;" class='infoInput infoPhone'
								 id="phone" name="phone" placeholder="연락처">
								
								<p style="margin-bottom: 10px;" id="alertNoAccountMsg"></p>
								
								<div class="text" style="margin-top: 10px; line-height: 120%;">	
									고객님께서 회원가입 시 입력한 성함과 연락처를 입력해주시면, 이에 해당하는
									이메일 주소를 찾아드립니다.
								</div>
						</div>
						<!-- //입력폼 end -->
						
						<!-- 상세페이지 버튼 start -->
						<div class='btnWrap tCenter' style="margin-top: 30px;">
							<input type="button" onclick="checkAccountFnc();" class='btn green' value="입력">
							<a href="./login.do" class="subBtn text bold">로그인으로 돌아가기</a>
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

		var nameObj = $('#userName').val();
		var phoneObj = $('#phone').val();

		$.ajax({
			url : "/lightbrary/findEmailCtr.do",
			type : "post",
			data : {
				"userName": nameObj,
				"phone": phoneObj
			},
			success : function(data) {
				console.log("null=계정없음, !null=계정있음 "+ data);							
				
 				if (data == "") {
 						$('#alertNoAccountMsg').html("가입되지 않은 정보입니다. <br>다시 확인해 주세요.");
 						$("#alertNoAccountMsg").attr('class', 'textRed');
 					} else{
 						console.log(data);
 						$('#alertNoAccountMsg').html("");
 						alert("회원님의 이메일 주소는 \"" + data.email + "\" 입니다.");
 						
 						location.href = '/lightbrary/login.do?email='+ data.email;
 					}
				}, error : function() {
						console.log("실패");
				}
			});
	}

</script>

</html>