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
	<h2>내가 가입한 그룹</h2>
	<div id="group">
		<table>
			<thead>
				<tr>
				  <th>no.</th>
				  <th>그룹이름</th>
				  <th></th>
	              <th></th>
				</tr>
			</thead>
			<c:forEach items="${myGroup}" var="i" varStatus="status"  begin="0" end='9'>
				<tr>
					<td>${status.count}</td>
					<td>${i.group_id}</td>
					<td></td>
					<td></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<h2>내정보</h2>
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
		<button onclick="location='/user/modify'">정보 수정</button>
	</div>
	<h2>내 게시물</h2>
	<div id="board">
		<ul>
			<li>
				스터디
				<table>
					<thead>
						<tr>
						  <th>no.</th>
						  <th>그룹 이름</th>
						  <th>제목</th>
			              <th>날짜</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${status.count}</td>
							<td>${i.group_name}</td>
							<td>${i.title}</td>
							<td>${i.regdate}</td>
						</tr>
					</tbody>
				</table>
			</li>
			<li>
				스터디 게시물
				<table>
					<thead>
						<tr>
						  <th>no.</th>
						  <th>그룹 이름</th>
						  <th>제목</th>
			              <th>날짜</th>
						</tr>
					</thead>
					<c:forEach items="${myBoard}" var="i" varStatus="status"  begin="0" end='9'>
						<tr>
							<td>${status.count}</td>
							<td>${i.group_name}</td>
							<td>${i.title}</td>
							<td>${i.regdate}</td>
						</tr>
					</c:forEach>
				</table>
			</li>
			<li>
				Q&A 게시물
				<table>
					<thead>
						<tr>
						  <th>no.</th>
						  <th>Q&A 제목</th>
			              <th>날짜</th>
						</tr>
					</thead>
					<c:forEach items="${myqna}" var="i" varStatus="status"  begin="0" end='9'>
						<tr>
							<td>${status.count}</td>
							<td>${i.title}</td>
							<td><fmt:formatDate value="${i.reg_date}" pattern="yyyy-MM-dd a hh:mm" /></td>
						</tr>
					</c:forEach>
				</table>
			</li>
		</ul>
	
	</div>
	
	<h2>내 댓글</h2>
	<div id="reply">
	<ul>
		<li>
		<table id="boardReply">
			<thead>
				<tr>
				  <th>no.</th>
				  <th>게시글 제목</th>
				  <th>댓글제목</th>
	              <th>날짜</th>
				</tr>
			</thead>
			<c:forEach items="${boardReply}" var="i" varStatus="status"  begin="0" end='9'>
				<tr>
					<td>${status.count}</td>
					<td></td>
					<td>${i.reply}</td>
					<td>${i.replydate}</td>
				</tr>
			</c:forEach>
		</table>
		</li>
		<li>
		<table id="qnaReply">
			<thead>
				<tr>
				  <th>no.</th>
				  <th>Q&A 제목</th>
				  <th>댓글제목</th>
	              <th>날짜</th>
				</tr>
			</thead>
			<c:forEach items="${qnaReply}" var="i" varStatus="status"  begin="0" end='9'>
				<tr>
					<td>${status.count}</td>
					<td></td>
					<td>${i.r_content}</td>
					<td>${i.r_reg_date}</td>
				</tr>
			</c:forEach>
		</table>
		</li>
	</ul>
	</div>
	
	<h2>쪽지</h2>
	<div id="letter">
		
	</div>
</body>
 <script>
 	$(document).ready(function () {
 		
 		/* 내가 가입한 스터디 list */
		$.getJSON(
		"/group/getGroupByUSer/${group_name}", (list) =>{
			console.log(list)
			console.log(loginUser)
			let joinCheck = list.find( user => user.user_id === loginUser)
			if(!joinCheck){
				alert("그룹 회원만 접근 가능한 페이지입니다")
				
			} 
		})
 	 })	
</script>
</html>