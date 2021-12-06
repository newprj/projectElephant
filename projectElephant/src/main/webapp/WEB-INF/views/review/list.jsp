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
<h1>후기 게시판</h1>
<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
</style>
<body>
	<ul>
		<c:forEach items="${list}" var="list">
		번호 : ${list.rno} / 모임명 : ${list.group_name}  / 제목 : <a href="detailPage?no=${list.rno}">${list.title}</a>
		<br>
		</c:forEach>
	</ul>
	<button type="button" id="registerReview">후기등록</button>
<div>
  <ul>
    <c:if test="${pageMaker.prev}">
    	<li><a href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>
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
