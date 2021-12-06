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
ul {
	list-style:none;
}
li {
	float:left;
}

.paginate_btn a {
    display:block;
    width:30px;
    line-height:30px;
    text-align:center;
    background-color: #1f75d9;
    color:#fff;
}
 

</style>
<title>Q & A 목록</title>
</head>
<body>
	<h1>Q&A 페이지 입니다.</h1>
	<h3>로그인 연결되면 수정,삭제 작성자에게만 보이기/ 수정일 있으면 작성일 수정일로 보이게하기</h3>
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
				<td><a class='detail' href='${i.qno}' data-password='${i.pwd}'>${i.title}</a></td>
				<td>${i.writer}</td>
				<td><fmt:formatDate value="${i.reg_date}" pattern="yyyy-MM-dd a hh:mm" /></td>
				<td><button data-qno='${i.qno}' id="writeMod">수정</button></td>
				<td><button onclick="location='/qna/remove?qno=${i.qno}'" id="writeRemove">삭제</button></td>
			</tr>
		</c:forEach>
	</table>
	<button class="writeBtn" onclick="location='/qna/write'">글쓰기</button>
	<div>
		<ul class="pagination">
			<c:if test="${pageMarker.prev}">
				<li><button>이전</button>
				</li>
			</c:if>
			
			<c:forEach var="num" begin="${pageMarker.startPage}" end="${pageMarker.endPage}">
				<li class="paginate_btn ${pageMarker.cri.pageNum==num ? "active": "" }">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMarker.next}">
				<li><button>다음</button></li>
			</c:if>
		</ul>
	</div>
	
	<form id='actionForm' action="/qna/list" method="get" >
		<input type="hidden" name='pageNum' value='${pageMarker.cri.pageNum}'/>
		<input type="hidden" name='amount' value='${pageMarker.cri.amount}'/>
	</form>
</body>
<script type="text/javascript">
	$(document).ready(function () {
		
		$(".paginate_btn a").click(function(e){
			e.preventDefault();
			
			var thisis=$(this).attr("href")
			console.log(thisis)
			
			$("#actionForm").find("input[name='pageNum']").val(thisis)
			$("#actionForm").submit()
		})
		
		$(".detail").on("click",function(e){
			
			if($(this).parent().prev().text()=="private"){
				var inputPwd=prompt("비밀번호를 입력해주세요")
				
				if(inputPwd == $(this).data("password")){
					console.log(inputPwd)
					console.log($(this).data("password"))
					$(".detail").attr('href');
					$("#actionForm").append("<input type='hidden' name='qno' value='"+$(this).attr("href")+"'>")
					$("#actionForm").attr("action","/qna/detail")
					$("#actionForm").submit()
				}
				else{
					alert("잘목입력하셨습니다. 다시 입력해주세요.")
					return false
				}
			}
			e.preventDefault();
			$(".detail").attr('href');
			$("#actionForm").append("<input type='hidden' name='qno' value='"+$(this).attr("href")+"'>")
			$("#actionForm").attr("action","/qna/detail")
			$("#actionForm").submit()
			
			
		})
		$("#writeMod").click(function(e){
			$("#actionForm").append("<input type='hidden' name='qno' value='"+$(this).data("qno")+"'>")
			$("#actionForm").attr("action","/qna/modify")
			$("#actionForm").submit()
		})
		
	})

</script>
</html>