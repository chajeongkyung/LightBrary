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
					<form action='./addCtr.do' onsubmit="checkValidationFnc();" method='post' class='infoForm'>
						<div class='infoInputWrap'>
							<input type="text" class='infoInput infoName' name="name" placeholder="성함">
							<input type="text" style="margin-top: 20px;" class='infoInput infoPhone' name="phone" placeholder="연락처">
							<input type="text" style="margin-top: 20px;" class='infoInput infoEmail' name="email" placeholder="이메일">
							<input type="button" style="margin-top: 20px;" class='infoInput infoEmail' name="checkEmail" value="중복체크">
							<input type="password" style="margin-top: 20px;" class='infoInput infoPassword' name="password" placeholder="비밀번호">
							<input type="password" style="margin-top: 20px;" class='infoInput infoPassword' name="checkPassword" placeholder="비밀번호 재확인">
							<input type="text" style="margin-top: 20px;" class='infoInput infoLocation' name="address" placeholder="주소">
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
	
function validate() {
	
    var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
    var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    // 이메일이 적합한지 검사할 정규식

    var id = document.getElementById("id");
    var pw = document.getElementById("pw");
    var email = document.getElementById("email");
    var num1 = document.getElementById("num1");
    var num2 = document.getElementById("num2");


    // ------------ 이메일 까지 -----------

    if(!check(re,id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }

    if(!check(re,pw,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }

    if(join.pw.value != join.checkpw.value) {
        alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
        join.checkpw.value = "";
        join.checkpw.focus();
        return false;
    }

    if(email.value=="") {
        alert("이메일을 입력해 주세요");
        email.focus();
        return false;
    }

    if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
        return false;
    }

    if(join.name.value=="") {
        alert("이름을 입력해 주세요");
        join.name.focus();
        return false;
    }

    alert("회원가입이 완료되었습니다.");
}

function check(re, what, message) {
    if(re.test(what.value)) {
        return true;
    }
    alert(message);
    what.value = "";
    what.focus();
    //return false;
}

</script>

</html>

