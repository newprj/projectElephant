<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q & A 목록</title>
</head>
<body>
	<h1>Q&A 페이지 입니다.</h1>
	<h3>번호는 qno으로 받지말고 increase로 구현, 제목 누르면 상세페이지로 넘기기</h3>
	<form method="post" action="">
		<select class="searchField">
			<option value="0">선택</option>
			<option value="title">제목</option>
			<option value="writer">작성자</option>			
		</select>
		<input type="text" placeholder="검색어 입력" class="searchText"> 
		<button id="search">검색</button>
	</form>
	
	<table>
		<thead>
			<tr>
			  <th>번호</th>
			  <th>구분</th>
              <th>제목</th>
              <th>작성자</th>
              <th>작성일</th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="i">
			<tr>
				<td>${i.qno}</td>
				<td>${i.p_group}</td>
				<td><a class='detail' href='${i.qno}'>${i.title}</a></td>
				<td>${i.writer}</td>
				<td><fmt:formatDate value="${i.reg_date}" pattern="yyyy-MM-dd a hh:mm" /></td>
			</tr>
		</c:forEach>
	</table>
	
	<button onclick="location='/qna/write'">글쓰기</button>
</body>
<script type="text/javascript">
	
</script>
</html>