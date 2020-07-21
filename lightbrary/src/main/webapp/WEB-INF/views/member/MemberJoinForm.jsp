<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Lightbrary : 회원가입</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/validation.js"></script>

<style type="text/css">
	.alertMsgBox {
		padding-top:5px; 
		font-size:13px;
		line-height: 130%;
	}
</style>

</head>

<body>

	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/Header.jsp" />
	
		<!-- 컨테이너 start -->
			<div id='container'>
				<h2 id='pageTitle'>회원가입</h2>
					<form action='./addCtr.do' onsubmit="return checkValidationFnc();" method='post' class='infoForm'>
						
						<p id="alertNecessaryMsg" class="textRed bold alertMsgBox" style="margin-top: 10px;"></p>
					
						<!-- 입력폼 start -->
						<div class='infoInputWrap' style="margin-top: 10px;">
							<div class='inputBgBlock'>
								<img alt="유저 아이콘" src="<%=request.getContextPath()%>/resources/img/icon-name.png"
									 class='inputIcon'>
								<input type="text" class='infoInput infoName' id="name" name="name" placeholder="성함">
							</div>
							<p id="alertNameErrorMsg" class="textRed alertMsgBox"></p>
							
							<div class='inputBgBlock' style="margin-top: 20px;">
								<img alt="핸드폰 아이콘" src="<%=request.getContextPath()%>/resources/img/icon-phone.png"
									 class='inputIcon'>
								<input type="text" class='infoInput infoPhone' id="phone" name="phone" placeholder="연락처 ex) 01012345678">
							</div>
							<p id="alertPhoneErrorMsg" class="textRed alertMsgBox"></p>
							
							<div class='inputBgBlock' style="margin-top: 20px;">
								<img alt="이메일 아이콘" src="<%=request.getContextPath()%>/resources/img/icon-email.png"
									 class='inputIcon'>
								<input type="text" class='infoInput infoEmail' id="email" name="email" placeholder="이메일">
							</div>
							<p id="alertEmailErrorMsg" class="textRed alertMsgBox"></p>
							
							<div class='inputBgBlock' style="margin-top: 20px;">
								<img alt="비밀번호 아이콘" src="<%=request.getContextPath()%>/resources/img/icon-padlock.png"
									 class='inputIcon'>
								<input type="password" class='infoInput infoPassword' id="password" name="password" placeholder="비밀번호">
							</div>
							<p id="alertPasswordErrorMsg" class="textRed alertMsgBox"></p>
							
							<div class='inputBgBlock' style="margin-top: 20px;">
								<img alt="비밀번호 아이콘" src="<%=request.getContextPath()%>/resources/img/icon-padlock.png"
									 class='inputIcon'>
								<input type="password" class='infoInput infoPassword' id="checkPassword" name="checkPassword" placeholder="비밀번호 재확인">
							</div>
							<p id="alertcheckPasswordErrorMsg" class="textRed alertMsgBox"></p>
							
							<div class='inputBgBlock' style="margin-top: 20px;">
								<img alt="위치 아이콘" src="<%=request.getContextPath()%>/resources/img/icon-location.png"
									 class='inputIcon'>
								<input type="text" class='infoInput infoLocation' id="address" name="address" placeholder="주소">
							</div>
							<p id="alertAddressErrorMsg" class="textRed alertMsgBox"></p>
						</div>
						<!-- //입력폼 end -->
						
						<!-- 상세페이지 버튼 start -->
						<div class='btnWrap tCenter' style="margin-top: 30px;">
							<input type="submit" class='btn green' value="가입하기">
							<a href="../login.do" class="subBtn text bold">로그인페이지</a>
						</div>
						<!-- //상세페이지 버튼 end -->
					</form>
			</div>
		<!-- //컨테이너 end -->
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
	</div>
	
</body>

<script type="text/javascript">	

var checkValCnt = 0;

$("#name").blur(function() {
	var nameObj = $('#name').val();
	
	 if(isNull(nameObj)) {
		 $('#alertNameErrorMsg').html("성함을 입력해 주세요.");
		 checkValCnt++;
	 }else if (!isValidName(nameObj)) {
		 $('#alertNameErrorMsg').html("한글과 영문 대 소문자를 사용하세요.<br>(특수기호, 공백 사용 불가)");
		 checkValCnt++;
	 }else {
		 $('#alertNameErrorMsg').html("");	
		 checkValCnt = 0;
	}
});


$("#phone").blur(function() {
	
	var phoneObj = $('#phone').val();
	
	$.ajax({
		url : "./checkPhone.do",
		type : "POST",
		data : "phone=" + phoneObj,
		success : function(data) {
			console.log("1 = 핸드폰 번호 중복 / 0 = 핸드폰 번호 중복x : " + data);							
			
			if (data == 1) {
					$('#alertPhoneErrorMsg').css('color', '#E92222');	
					$('#alertPhoneErrorMsg').html("사용중인 핸드폰번호입니다.");
					checkValCnt++;
				} else if (data == 0){

					if(isNull(phoneObj)){
						$('#alertPhoneErrorMsg').css('color', '#E92222');	
						$('#alertPhoneErrorMsg').html('연락처를 입력해 주세요.');
						checkValCnt++;
					} else if (!isValidPhone(phoneObj)){
						$('#alertPhoneErrorMsg').css('color', '#E92222');	
						$('#alertPhoneErrorMsg').html('숫자만 입력해 주세요.');
						checkValCnt++;
					} else{
						$('#alertPhoneErrorMsg').css('color', 'blue');						
						$('#alertPhoneErrorMsg').html('');
						checkValCnt = 0;
					}	
				}
			}, error : function() {
					console.log("실패");
			}
		});
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
					$('#alertEmailErrorMsg').css('color', '#E92222');	
					$('#alertEmailErrorMsg').html("사용중인 이메일입니다.");
					checkValCnt++;
				} else if (data == 0){

					if(isNull(emailObj)){
						$('#alertEmailErrorMsg').css('color', '#E92222');	
						$('#alertEmailErrorMsg').html('이메일을 입력해주세요.');
						checkValCnt++;
					} else if (!isValidEmail(emailObj)){
						$('#alertEmailErrorMsg').css('color', '#E92222');	
						$('#alertEmailErrorMsg').html('이메일 형식이 맞지 않습니다.');
						checkValCnt++;
					} else{
						$('#alertEmailErrorMsg').css('color', '#2B9447');						
						$('#alertEmailErrorMsg').html('사용가능한 이메일입니다.');
						checkValCnt = 0;
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
		 checkValCnt++;
	}else if (!isValidPassword(passwordObj)) {
		 $('#alertPasswordErrorMsg').html("8~16자 영문,숫자,특수문자를 사용하세요.");
		 checkValCnt++;
	}else {
		 $('#alertPasswordErrorMsg').html("");	
		 checkValCnt = 0;
	}
});

$("#checkPassword").blur(function() {
	
	var passwordObj = $('#password').val();
	var checkPasswordObj = $('#checkPassword').val();
	
	 if(isNull(checkPasswordObj)) {
		 $('#alertcheckPasswordErrorMsg').html("비밀번호를 확인해 주세요.");
		 checkValCnt++;
	}else if (passwordObj != checkPasswordObj) {
		 $('#alertcheckPasswordErrorMsg').html("비밀번호가 일치하지 않습니다.");
		 checkValCnt++;
	}else {
		 $('#alertcheckPasswordErrorMsg').html("");
		 checkValCnt = 0;
	}
});

$("#address").blur(function() {
	var addressObj = $('#address').val();
	
	 if(isNull(addressObj)) {
		 $('#alertAddressErrorMsg').html("주소를 입력해 주세요.");
		 checkValCnt++;
	}else {
		 $('#alertAddressErrorMsg').html("");	
		 checkValCnt = 0;
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
        return false;
    }
    
 	if(isNull(phoneObj)) {
    	$('#alertNecessaryMsg').html("모든 항목은 필수입니다.");
        return false;
    }
 
    if(isNull(emailObj)) {
    	$('#alertNecessaryMsg').html("모든 항목은 필수입니다.");
        return false;
    }

    if(isNull(passwordObj)) {
    	$('#alertNecessaryMsg').html("모든 항목은 필수입니다.");
        return false;
    }

    if(isNull(checkPasswordObj)) {
    	$('#alertNecessaryMsg').html("모든 항목은 필수입니다.");
        return false;
    }
	
    if(isNull(addressObj)) {
    	$('#alertNecessaryMsg').html("모든 항목은 필수입니다.");
        return false;
    }
    if(checkValCnt >= 0){
        alert("다시 한번 확인해 주세요");
    	return false; 
        
    }
    alert("회원가입이 완료되었습니다.");
   	return true;
	
}


</script>

</html>
