<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<script
  src="https://code.jquery.com/jquery-3.6.0.js"></script>
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

.userList {
	width:50%;
	height:500px;
	float:left;
}

.study {
	width:50%;
	height:500px;
	float:left;
}

</style>
<title>Admin 페이지</title>

</head>
<body>
	<h1>Admin page</h1>
	<h3>타이틀 누르면 해당 페이지로 이동,받은 쪽지 리스트도 보이도록, 방문자 평균 그래프로 보이게</h3>
	<h5 id='today'>Today : 방문자수(가능하면)</h5>
	
	<div class='userList'>
		<h3>회원 리스트</h3>
		<h5>회원에게 쪽지, 정지기능</h5>
		<table>
			<thead>
				<tr>
				  <th>no.</th>
				  <th>아이디</th>
	              <th>이름</th>
	              <th>이메일</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="i" varStatus="status"  begin="1" end='10'>
				<tr>
					<td>${status.count}</td>
					<td>${i.user_id}</td>
					<td>${i.name}</td>
					<td>${i.email}</td>
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
	              <th>내용</th>
	              <th>인원</th>
				</tr>
			</thead>
			<c:forEach items="${group}" var="i" varStatus="status"  begin="1" end='10'>
				<tr>
					<td>${status.count}</td>
					<td>${i.group_name}</td>
					<td>${i.subject}</td>
					<td>${i.leader}</td>
					<td>${i.description}</td>
					<td>${i.member_number}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div class='qna'>
	<h3>Q&A 리스트</h3>
	<h5>a태그로 게시물로 가서 답변 달수 있도록/ admin은 private pwd 보이게 하기(작성자가 잊어버릴 경우를 위해)</h5>
		<table>
			<thead>
				<tr>
				  <th>no.</th>
	              <th>제목</th>
				  <th>공개유무</th>
	              <th>아이디</th>
	              <th>등록일</th>
				</tr>
			</thead>
			<c:forEach items="${qna}" var="i" varStatus="status" begin="1" end='10'>
				<tr>
					<td>${status.count}</td>
					<td>${i.title}</td>
					<td>${i.p_group}</td>
					<td>${i.writer}</td>
					<td>
						<c:choose>
							<c:when test="${i.up_date == null}"><fmt:formatDate value="${i.reg_date}" pattern="yyyy-MM-dd a hh:mm" /></c:when>
							<c:otherwise><fmt:formatDate value="${i.up_date}" pattern="yyyy-MM-dd a hh:mm" /></c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	
</body>
<script type="text/javascript">
	$(document).ready(function () {
		
		
		
	})

</script>
</html>