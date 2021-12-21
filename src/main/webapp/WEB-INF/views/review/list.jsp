<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://kit.fontawesome.com/6584921572.js" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h1>후기 게시판</h1> 
<input type="hidden" id="userCheck" value='${login}'>
<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
</style>
<body>
<form role="form" method="get"></form>
	<ul>
		<c:forEach items="${list}" var="list">
			번호 : ${list.rno} / 작성자 : ${list.writer}  / 
			제목 : <a href="detailPage?no=${list.rno}">${list.title}</a>  [${list.reply_count}] / 작성일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${list.regdate}"/>
			/ 조회수 : ${list.view_count}  
			<c:if test="${list.attachedFile ne 0}">
					[ <i class="fas fa-save"></i> ]
			</c:if>
			<br>
		</c:forEach>
	</ul>
	<button type="button" id="register" >후기등록</button>
	<button type="button" onclick="location.href= '/review/list'">새로고침</button>
	
	<form method="get" action="/review/list" id="searchForm">
		<select name="type">
			<option value="" <c:out value="${pageMaker.cri.type==null?'selected':''}"/>>선택</option>
			<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ?'selected':''}"/> >제목</option>
			<option value="W" <c:out value="${pageMaker.cri.type eq 'W' ?'selected':''}"/>>작성자</option>			
			<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 또는 작성자</option>			
		</select>
		<input type="text" placeholder="검색어 입력" name="keyword"> 
		<input type="hidden" name="pageNum" value='${pageMarker.cri.pageNum}'>
        <input type="hidden" name="amount" value='${pageMarker.cri.amount}'>
              
		<button id="search">검색</button>
	</form>
	<div>
		<ul class="pagination">
			<c:if test="${pageMarker.prev}">
				<li class="paginate_btn previous"><a href="${pageMarker.startPage -1}">이전</a>
				</li>
			</c:if>
			<c:forEach var="num" begin="${pageMarker.startPage}" end="${pageMarker.endPage}">
				<li class="paginate_btn ${pageMarker.cri.pageNum==num ? "active": "" }">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMarker.next && pageMarker.endPage > 0}">
				<li class="paginate_btn next"><a href="${pageMarker.endPage +1}">다음</a></li>
			</c:if>
		</ul>
	</div>
	<form id='actionForm' action="/review/list" method="get" >
		<input type="hidden" name='pageNum' value='${pageMarker.cri.pageNum}'/>
		<input type="hidden" name='amount' value='${pageMarker.cri.amount}'/>
		<input type="hidden" name='type' value='${pageMarker.cri.type}'/>
		<input type="hidden" name='keyword' value='${pageMarker.cri.keyword}'/>
	</form>
</body>
<script type="text/javascript">

var user = $('#userCheck').val()
console.log(user)

$(document).ready(function () {

	$(".paginate_btn a").click(function(e){
		e.preventDefault();
		var thisis=$(this).attr("href")
		$("#actionForm").find("input[name='pageNum']").val(thisis)
		$("#actionForm").submit()
	})
	

	$("#searchForm button").click(function(e){
		if(!$("#searchForm").find("option:selected").val()){
			alert("검색 종류를 선택하세요")
			return false
		}
		if(!$("#searchForm").find("input[name='keyword']").val()){
			alert("검색어를 입력하세요")
			return false
		}
		$("#searchForm").find("input[name='pageNum']").val("1")
		
		 e.preventDefault();
		$("#searchForm").submit()
	})
	
	$('#register').click(function(e){
		console.log("버튼이 눌리다.")
		console.log(user)
		if(user == "cantLogin"){
			alert("로그인 후 이용해주세요")
			return false;
		}
		else location.href="/review/register"
	})
	
}) 

      
      
</script>
</html>
