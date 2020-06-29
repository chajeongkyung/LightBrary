<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/validation.js"></script>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header_temp.jsp" />
	
		<!-- 컨테이너 start -->
			<div id='container'>
				<h2 id='pageTitle'>회원가입</h2>
					<form action='./addCtr.do' onsubmit="return checkValidationFnc();" method='post' class='infoForm'>
						<p id="alertNecessaryMsg"></p>
						<div class='infoInputWrap'>
							<input type="text" class='infoInput infoName' id="name" name="name" placeholder="성함">
							<p id="alertNameErrorMsg"></p>
							<input type="text" style="margin-top: 20px;" class='infoInput infoPhone' id="phone" name="phone" placeholder="연락처">
							<p id="alertPhoneErrorMsg"></p>
							<input type="text" style="margin-top: 20px;" class='infoInput infoEmail' id="email" name="email" placeholder="이메일">
							<p id="alertEmailErrorMsg"></p>
							<input type="password" style="margin-top: 20px;" class='infoInput infoPassword' id="password" name="password" placeholder="비밀번호">
							<p id="alertPasswordErrorMsg"></p>
							<input type="password" style="margin-top: 20px;" class='infoInput infoPassword' id="checkPassword" name="checkPassword" placeholder="비밀번호 재확인">
							<p id="alertcheckPasswordErrorMsg"></p>
							<input type="text" style="margin-top: 20px;" class='infoInput infoLocation' id="address" name="address" placeholder="주소">
							<p id="alertAddressErrorMsg"></p>
						</div>
						<div class='btnWrap tCenter' style="margin-top: 30px;">
							<input type="submit" class='btn green' value="가입하기">
							<a href="../login.do" class="subBtn text bold">로그인페이지</a>
						</div>
					</form>
			</div>
		<!-- //컨테이너 end -->
		<jsp:include page="/WEB-INF/views/Tail_temp.jsp" />
	</div>
	
</body>

<script type="text/javascript">	

$("#name").blur(function() {
	var nameObj = $('#name').val();
	
	 if(isNull(nameObj)) {
		 $('#alertNameErrorMsg').html("성함을 입력해 주세요.");
		 $('#alertNameErrorMsg').css('color', 'red');
	 }else if (!isValidName(nameObj)) {
		 $('#alertNameErrorMsg').html("한글과 영문 대 소문자를 사용하세요.<br>(특수기호, 공백 사용 불가)");
		 $('#alertNameErrorMsg').css('color', 'red');
	 }else {
		 $('#alertNameErrorMsg').html("");	
	}
});

$("#phone").blur(function() {
	var phoneObj = $('#phone').val();
	
	 if(isNull(phoneObj)) {
		 $('#alertPhoneErrorMsg').html("연락처를 입력해 주세요.");
		 $('#alertPhoneErrorMsg').css('color', 'red');
	}else if (!isValidPhone(phoneObj)) {
		 $('#alertPhoneErrorMsg').html("숫자만 입력해 주세요.");
		 $('#alertPhoneErrorMsg').css('color', 'red');
	}else {
		 $('#alertPhoneErrorMsg').html("");	
	}
});

$("#email").blur(function() {
	
	var emailObj = $('#email').val();
	
	$.ajax({
		url : "./checkEmail.do",
		type : "POST",
		data : "email=" + emailObj,
		success : function(data) {
			console.log("1 = 중복o / 0 = 중복x : "+ data);							
			
			if (data == 1) {
					$('#alertEmailErrorMsg').html("사용중인 이메일입니다.");
					$("#alertEmailErrorMsg").css("color", "red");
					
				} else if (data == 0){

					if(isNull(emailObj)){
						
						$('#alertEmailErrorMsg').html('이메일을 입력해주세요.');
						$('#alertEmailErrorMsg').css('color', 'red');
						
					} else if (!isValidEmail(emailObj)){
						
						$('#alertEmailErrorMsg').html('이메일 형식이 맞지 않습니다.');
						$('#alertEmailErrorMsg').css('color', 'red');
					} else{
						
						$('#alertEmailErrorMsg').html('사용가능한 이메일입니다.');
						$('#alertEmailErrorMsg').css('color', 'blue');						
					}	
				}
			}, error : function() {
					console.log("실패");
			}
		});
	});
	
$("#password").blur(function() {
	var passwordObj = $('#password').val();
	
	 if(isNull(passwordObj)) {
		 $('#alertPasswordErrorMsg').html("비밀번호를 입력해 주세요.");
		 $('#alertPasswordErrorMsg').css('color', 'red');
	}else if (!isValidPassword(passwordObj)) {
		 $('#alertPasswordErrorMsg').html("8~16자 영문 대 소문자,숫자,특수문자를 사용하세요.");
		 $('#alertPasswordErrorMsg').css('color', 'red');
	}else {
		 $('#alertPasswordErrorMsg').html("");	
	}
});

$("#checkPassword").blur(function() {
	var passwordObj = $('#password').val();
	var checkPasswordObj = $('#checkPassword').val();
	
	 if(isNull(checkPasswordObj)) {
		 $('#alertCheckPasswordErrorMsg').html("비밀번호를 확인해 주세요.");
		 $('#alertCheckPasswordErrorMsg').css('color', 'red');
	}else if (passwordObj != checkPasswordObj) {
		 $('#alertCheckPasswordErrorMsg').html("비밀번호가 일치하지 않습니다.");
		 $('#alertCheckPasswordErrorMsg').css('color', 'red');
	}else {
		 $('#alertCheckPasswordErrorMsg').html("");	
	}
});

$("#address").blur(function() {
	var addressObj = $('#address').val();
	
	 if(isNull(addressObj)) {
		 $('#alertAddressErrorMsg').html("주소를 입력해 주세요.");
		 $('#alertAddressErrorMsg').css('color', 'red');
	}else {
		 $('#alertAddressErrorMsg').html("");	
	}
});

function checkValidationFnc() {
	
    var nameObj = $('#name').val();
    var phoneObj = $('#phone').val();
    var emailObj = $('#email').val();
    var passwordObj = $('#password').val();
    var checkPasswordObj = $('#checkPassword').val();
    var addressObj = $('#address').val();
    
    
    if(isNull(nameObj)) {
    	$('#alertNecessaryMsg').html("모든 항목은 필수입니다.");
		$('#alertNecessaryMsg').css('color', 'red');
//         nameObj.focus();
        return false;
    }
    
 	if(isNull(phoneObj)) {
    	$('#alertNecessaryMsg').html("모든 항목은 필수입니다.");
		$('#alertNecessaryMsg').css('color', 'red');
//         phoneObj.focus();
        return false;
    }
 
    if(isNull(emailObj)) {
    	$('#alertNecessaryMsg').html("모든 항목은 필수입니다.");
		$('#alertNecessaryMsg').css('color', 'red');
//         emailObj.focus();
        return false;
    }

    if(isNull(passwordObj)) {
    	$('#alertNecessaryMsg').html("모든 항목은 필수입니다.");
		$('#alertNecessaryMsg').css('color', 'red');
//         passwordObj.focus();
        return false;
    }

    if(isNull(checkPasswordObj)) {
    	$('#alertNecessaryMsg').html("모든 항목은 필수입니다.");
		$('#alertNecessaryMsg').css('color', 'red');
//         checkPasswordObj.focus();
        return false;
    }
	
    if(isNull(addressObj)) {
    	$('#alertNecessaryMsg').html("모든 항목은 필수입니다.");
		$('#alertNecessaryMsg').css('color', 'red');
//         passwordObj.focus();
        return false;
    }
   
	    alert("회원가입이 완료되었습니다.");
    	return true;
	
}


</script>

</html>
