<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<jsp:include page="/WEB-INF/views/Header_temp.jsp" />
	
		<!-- 컨테이너 start -->
			<div id='container'>
				<h2 id='pageTitle'>로그인</h2>
					<form action='./loginCtr.do' method='post' class='infoForm'>
						<div class='infoInputWrap'>
							<input type="text" class='infoInput infoEmail' name="email" placeholder="이메일">
							<input type="password" style="margin-top: 20px;" class='infoInput infoPwd' name="password" placeholder="비밀번호">
						</div>
						<div class='btnWrap tCenter' style="margin-top: 30px;">
							<input type="submit" class='btn green' value="로그인">
							<a href="./member/add.do" class="subBtn text bold">회원가입</a>
						</div>
					</form>
			</div>
		<!-- //컨테이너 end -->
		<jsp:include page="/WEB-INF/views/Tail_temp.jsp" />
	</div>
	

</body>
</html>