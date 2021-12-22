<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://kit.fontawesome.com/6584921572.js" crossorigin="anonymous"></script>

<link href="/resources/assets/css/bootstrap.css" rel="stylesheet">
<link href="/resources/assets/css/bootstrap-theme.css" rel="stylesheet">

<link href="/resources/assets/css/simple-line-icons.css" rel="stylesheet">
<link href="/resources/stylesheets/responsive-nav.css" rel="stylesheet">
<link href="/resources/stylesheets/responsive-nav.css" rel="stylesheet">
<link href="/resources/stylesheets/quotes.css" rel="stylesheet">
<link href="/resources/stylesheets/services.css" rel="stylesheet">
<link href="/resources/stylesheets/animate.css" rel="stylesheet">
<link href="/resources/stylesheets/effects.css" rel="stylesheet">
<link href="/resources/stylesheets/jquery.easy-pie-chart.css" rel="stylesheet">
<link href="/resources/stylesheets/sidemenu.css" rel="stylesheet">
<link href="/resources/stylesheets/slidingmenu.css" rel="stylesheet">
<link href="/resources/stylesheets/metro-panel.css" rel="stylesheet">
<link href="/resources/stylesheets/style.css" rel="stylesheet">
<script src="/resources/javascripts/modernizr.custom.menu.js"></script>
<script src="/resources/javascripts/modernizr.custom.quotes.js"></script>
<script src="/resources/javascripts/modernizr.custom.services.js"></script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<div class="row">
	    <article class="col-md-12 text-left">
	      <h2 class="page-heading">후기 게시판</h2>
	      <div class="liner"><span></span></div>
	    </article>
	</div>
	<hr/>
<input type="hidden" id="userCheck" value='${login}'>

<style>
/*---- Custom CSS ----*/
.search-box {
    margin: 100px auto;
}
.search-box .btn-light {
    border: 1px solid #ced4da;
}
li {list-style: none; float: left; padding: 6px;}
</style>
<body>
<div class="container">
			<section id="container">
				<form role="form" method="get">
					<table class="table table-hover">
						<thead>
							<tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th></tr>
						</thead>
						
						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out value="${list.rno}" /></td>
								<td>
									<a href="detailPage?no=${list.rno}">${list.title}</a>[${list.reply_count}] 
									<c:if test="${list.attachedFile ne 0}">
										[ <i class="fas fa-save"></i> ]
									</c:if>
								</td>
								<td><c:out value="${list.writer}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.regdate}"/></td>
								<td>${list.view_count} </td>
							</tr>
						</c:forEach>
					</table>
					<button type="button" id="register" class="btn btn-primary" >후기등록</button>
					<button type="button" class="btn btn-warning" onclick="location.href= '/review/list'">새로고침</button>
					<div class="search row">
						<div class="col-xs-2 col-sm-2">
							<select class="form-control" name="type">
								 <option value="" <c:out value="${pageMaker.cri.type==null?'selected':''}"/>>선택</option>
								<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ?'selected':''}"/> >제목</option>
								<option value="W" <c:out value="${pageMaker.cri.type eq 'W' ?'selected':''}"/>>작성자</option>			
								<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 또는 작성자</option>	
							</select>
						</div>
						 
						<div class="col-xs-10 col-sm-10">
							<div class="input-group">
								 <input type="text" class="form-control" placeholder="검색어 입력" name="keyword"> 
								<span class="input-group-btn">
									<button id="search" class="btn btn-primary" >검색</button>
									<input type="hidden" name="pageNum" value='${pageMarker.cri.pageNum}'>
							        <input type="hidden" name="amount" value='${pageMarker.cri.amount}'>	 	
								</span>
							</div>
						</div>
					</div>
					<div class="col-md-offset-3">
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
				</form>
			</section>
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
