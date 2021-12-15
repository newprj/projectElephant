<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<div id="group">
		
	</div>
	<div id="info">
		<table>
			<thead>
				<tr>
				  <th>아이디</th>
	              <th>이름</th>
	              <th>이메일</th>
	              <th>가입일</th>
				</tr>
			</thead>
				<tr>
					<td>${user.user_id}</td>
					<td >${user.name}</td>
					<td>${user.email}</td>
					<td></td>
				</tr>
		</table>
	</div>
	<div id="board">
	</div>
	<div id="reply">
		
	</div>
	<div id="letter">
		
	</div>
</body>
</html>