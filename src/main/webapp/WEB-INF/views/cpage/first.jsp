<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>그룹명</h1>
	
	<p>그룹명을 입력</p>
	<form action="/cpage/list" method="post">
		<input type="text" name = "input">
		<button type="submit">확인</button>
	</form>
</body>
</html>