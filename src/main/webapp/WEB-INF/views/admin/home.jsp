<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<jsp:useBean id="today" class="java.util.Date" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#today {
	width:100%;
	height:10px;
	text-align:right;
}

.userList, .study,.qna , .letter{
	width:50%;
	height:500px;
	float:left;
	overflow:auto;
	
}



</style>
<title>Admin 페이지</title>

</head>
<body>
	<h1>Admin page</h1>
	<h3>받은 쪽지 리스트도 보이도록, 방문자 평균 그래프로 보이게</h3>
	<h5 id='today'><fmt:formatDate value="<%= today %>" pattern="yyyy-MM-dd" /> : 방문자수(가능하면)</h5>
	
	<div class='userList'>
		<h3>회원 리스트</h3>
		<h5>회원에게 쪽지, 정지기능</h5>
		<table>
			<thead>
				<tr>
				  <th>no.</th>
				  <th>아이디</th>
	              <th>이름</th>
	              <th>가입일</th>
	              <th>쪽지</th>
	              <th>회원 정지</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="i" varStatus="status"  begin="0" end='9'>
				<tr>
					<td>${status.count}</td>
					<td>${i.user_id}</td>
					<td>${i.name}</td>
					<td></td>
					<td><button>쪽지</button></td>
					<td><button>정지</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div class='study'>
	<h3>스터디 승인 리스트</h3>
	<h5>스터디 a태그로 누르면 전제 내용 띄우고 승인 버튼 스터디 테이블에 승인 컬럼 만들기</h5>
		<table>
			<thead>
				<tr>
				  <th>no.</th>
				  <th>스터디명</th>
	              <th>주제</th>
	              <th>스터디장</th>
	              <th>인원수</th>
	              <th>내용확인</th>
	              <th>승인여부</th>
				</tr>
			</thead>
			<c:forEach items="${group}" var="i" varStatus="status"  begin="0" end='9'>
				<tr>
					<td>${status.count}</td>
					<td>${i.group_name}</td>
					<td>${i.subject}</td>
					<td>${i.leader}</td>
					<td>${i.member_number}명</td>
					<td><a href='#'>확인</a></td>
					<td>Y/N</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div class='qna'>
	<h3><a href='/qna/list'>Q&A 리스트</a></h3>
	
		<table>
			<thead>
				<tr>
				  <th>no.</th>
	              <th>제목</th>
				  <th>비밀번호</th>
	              <th>아이디</th>
	              <th>등록일</th>
	              <th>조회수</th>
				</tr>
			</thead>
			<c:forEach items="${qna}" var="i" varStatus="status" begin="0" end='9'>
				<tr>
					<td>${status.count}</td>
					<td><a href="/qna/detail?qno=${i.qno}">${i.title}</a></td>
					<td>${i.pwd}</td>
					<td>${i.writer}</td>
					<td><fmt:formatDate value="${i.up_date}" pattern="yyyy-MM-dd a hh:mm" /></td>
					<td>만들기</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="letter">
		<h3>받은 쪽지</h3>
		
	</div>
	
</body>
<script type="text/javascript">
	
	$(document).ready(function () {
		
		
		
	})

</script>
</html>