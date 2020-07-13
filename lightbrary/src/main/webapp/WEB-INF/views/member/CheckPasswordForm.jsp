<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
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
				<h2 id='pageTitle'>내 정보</h2>
					<form action='./update.do' onsubmit="return checkPasswordFnc();"  
						id="findPasswordForm" method="post" class='infoForm'>
						<div class='infoInputWrap'>
							<input type="password" class='infoInput infoPassword' 
								id="inputPassword" name="inputPassword" placeholder="비밀번호">
								<p style="margin: 10px 0px 10px 0px;" id="alertNoPasswordMsg"></p>
								<div class="text" style="margin-top: 10px;">	
									본인 확인을 위해서 비밀번호를 입력해 주세요.
								</div>
						</div>
						<div class='btnWrap tCenter' style="margin-top: 30px;">
							<input type="submit" class='btn green' value="확인">
							<a href="./detail.do" class="subBtn text bold">뒤로</a>
						</div>
					</form>
			</div>
		<!-- //컨테이너 end -->
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
		
	</div>
	
</body>

<script type="text/javascript">
	
	
	function checkPasswordFnc() {
		
		var passwordObj = $('#inputPassword').val();
		
		if (passwordObj != '${member.password}') {
			$('#alertNoPasswordMsg').html("비밀번호가 틀립니다. 다시 확인해 주세요.");
			$("#alertNoPasswordMsg").css("color", "#EC8686");
			$("#alertNoPasswordMsg").attr('class', 'text');
			return false;
		}else {
			$('#alertNoPasswordMsg').html("");
			return true;
		}
	
	}

</script>

</html>