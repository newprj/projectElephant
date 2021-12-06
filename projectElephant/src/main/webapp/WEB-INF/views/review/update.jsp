<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h1>후기 수정 페이지</h1>
<body>
	<form action="/review/modify" method="post">
		번호 <input type="text" name="rno" value = "${read.rno}"readonly/><br>		
		그룹명 <input type="text" name="group_name" value="${read.group_name}" /><br>
		제목 <input type="text" name="title" value="${read.title}"/><br>
		내용 <input type="text" name="content" value="${read.content}"/><br>
		작성자 <input type="text" name="writer" value="${read.writer}" />	<br>
		<button type="submit">수정완료</button>
	</form>
</body>
</html>