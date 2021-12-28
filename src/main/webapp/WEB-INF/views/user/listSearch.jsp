<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>회원 목록</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>
</head>
<body>
<div>
	<h1>회원 목록</h1>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>가입일</th>
			</tr>
		</thead>
		<c:forEach items="${list}" var = "list">
			<tr>
				<td><c:out value="${list.uno}" /></td>
				<td><a href="/user/view?uno=${list.uno}"><c:out value="${list.user_id}" /></td>
				<td><c:out value="${list.name}" /></td>
				<td><c:out value="${list.email}"/></td>
				<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>
	</table>
	
	<div class="search">
		<select name="searchType">
			<option value="d"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-------</option>
			<option value="u"<c:out value="${scri.searchType eq 'u' ? 'selected' : ''}"/>>아이디</option>
			<option value="n"<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>이름</option>
			<option value="e"<c:out value="${scri.searchType eq 'e' ? 'selected' : ''}"/>>이메일</option>
		</select>
		<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
		<button id="searchBtn">검색</button>
		
		<script>
		$(function(){
			$('#searchBtn').click(function(){
				self.location = "listSearch"
					+ '${pageMaker.makeQuery(1)}'
					+ "&searchType="
					+ $("select option:selected").val()
					+ "&keyword="
					+ encodeURIComponent($('#keywordInput').val());
			});
		});
		</script>
	</div>
	
	
	
	<div>
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li><a href="listSearch${pageMaker.makeQuery(pageMaker.startPage-1)}">이전</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li><a href="listSearch${pageMaker.makeQuery(idx)}">${idx}</a></li>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a href="listSearch${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
		</ul>
	</div>

</div>
</body>
</html>