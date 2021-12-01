<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
			<tr>
			  <th>#번호</th>
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
				<td>${i.title}</td>
				<td>${i.writer}</td>
				<td><fmt:formatDate value="${i.reg_date}" pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>