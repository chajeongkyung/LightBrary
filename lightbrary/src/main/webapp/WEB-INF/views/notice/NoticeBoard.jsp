<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

#wholeDiv{
	width: 1024px;
	border: 1px solid black;
}

</style>

<script type="text/javascript">

	var loginMove = function() {
		location.href = '/lightbrary/notice/list.do';
	}
</script>

</head>

<body>

	<div onclick="loginMove();">
		관리자 게시판 페이지로 이동
	</div>
	
	
			

</body>

</html>