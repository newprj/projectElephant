<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<c:forEach items="${list}" var="list">
		번호 : ${list.rno} / 모임명 : ${list.group_name}  / 제목 : <a href="detailPage?no=${list.rno}">${list.title}</a>
		<br>
		</c:forEach>
	</ul>
	<button type="button" id="registerReview">후기등록</button>
</body>
<script type="text/javascript">

$(document).ready(function () {
	$('#registerReview').click(function () {
		console.log("버튼이 눌림")
	    self.location = '/review/register'
	 })
}) 
</script>
</html>
