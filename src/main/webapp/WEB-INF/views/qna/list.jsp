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
ul li {
	list-style-type:none
}
</style>
<title>Q & A 목록</title>
</head>
<body>
	<h1>Q&A 페이지 입니다.</h1>
	<h3>로그인 연결되면 수정,삭제 작성자에게만 보이기</h3>
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
              <th></th>
              <th></th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="i" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${i.p_group}</td>
				<td><a class='detail' href='detail?qno=${i.qno}' data-password='${i.pwd}'>${i.title}</a></td>
				<td>${i.writer}</td>
				<td><fmt:formatDate value="${i.reg_date}" pattern="yyyy-MM-dd a hh:mm" /></td>
				<td><button onclick="location='/qna/modify?qno=${i.qno}'" id="writeMod">수정</button></td>
				<td><button onclick="location='/qna/remove?qno=${i.qno}'" id="writeRemove">삭제</button></td>
			</tr>
		</c:forEach>
	</table>
	<div>
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li><button>이전</button>
				</li>
			</c:if>
			
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li><button>${num}</button></li>
			</c:forEach>
			
			<c:if test="${pageMaker.next}">
				<li><button>다음</button></li>
			</c:if>
		</ul>
	</div>
	
	<button onclick="location='/qna/write'">글쓰기</button>
</body>
<script type="text/javascript">
	$(document).ready(function () {
		
		$(".detail").on("click",function(e){
			if($(this).parent().prev().text()=="private"){
				var inputPwd=prompt("비밀번호를 입력해주세요")
				
				if(inputPwd == $(this).data("password")){
					console.log(inputPwd)
					console.log($(this).data("password"))
					$(".detail").attr('href');
					return true
				}
				else{
					alert("잘목입력하셨습니다. 다시 입력해주세요.")
					return false
				}
				
			}
		})
		
		
	})

</script>
</html>