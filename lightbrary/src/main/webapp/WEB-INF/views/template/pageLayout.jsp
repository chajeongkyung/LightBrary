<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>기본 페이지 레이아웃</title>

<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
<link rel="stylesheet" type="text/css" href="resources/css/sub.css">

<script type="text/javascript" src="resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="resources/js/script.js"></script>

</head>

<body>

	<div id='wrap'>
<<<<<<< HEAD
		<jsp:include page="/WEB-INF/views/Header_temp.jsp" />
	
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>페이지 제목</h2>
			
			<!-- 
			이안에 내용 작성 
			-->
			
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail_temp.jsp" />
=======
		<jsp:include page="/WEB-INF/views/Header.jsp" />
	
		<!-- 컨테이너 start -->
		<div id='container'>
			<h2 id='pageTitle'>페이지 제목</h2>
			
			<!-- 
			이안에 내용 작성 
			-->
			
		</div>
		<!-- //컨테이너 end -->
		
		<jsp:include page="/WEB-INF/views/Tail.jsp" />
>>>>>>> branch 'master' of https://github.com/chajeongkyung/LightBrary.git
	</div>

</body>

</html>