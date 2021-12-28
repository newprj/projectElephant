<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://kit.fontawesome.com/6584921572.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<link href="/resources/css/style.css" rel="stylesheet" />
<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />


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
	.search-box {
	    margin: 100px auto;
	}
	.search-box .btn-light {
	    border: 1px solid #ced4da;
	}
	
	.pagination{
		color : #F79A9A;
	}
	#selectOption{
		padding:0;
	}
	#searchForm{
		padding:0;
	}
	

	li {list-style: none; float: left; padding: 6px;}
</style>
<body>
<div class="container">
			<section id="container">
				<form role="form" method="get">
				<div class="search row" style="position :top-right;" >
						<div class="col-xs-2 col-sm-2" id="selectOption" >
							<select class="form-control" name="type">
								 <option value="" <c:out value="${pageMaker.cri.type==null?'selected':''}"/>>선택</option>
								<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ?'selected':''}"/> >제목</option>
								<option value="W" <c:out value="${pageMaker.cri.type eq 'W' ?'selected':''}"/>>작성자</option>			
								<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 또는 작성자</option>	
							</select>
						</div>
						<div class="col-xs-3 col-sm-3" id="searchForm">
							<div class="input-group" >
								<input type="text" class="form-control" placeholder="검색어 입력" name="keyword"> 
								<span class="input-group-btn">
									<button type="button" id="search" class="btn btn-outline-info" ><i class="fas fa-search"></i>검색</button>
									<input type="hidden" name="pageNum" value='${pageMarker.cri.pageNum}'>
							        <input type="hidden" name="amount" value='${pageMarker.cri.amount}'>	 	
								</span>
							</div>
						</div>
					</div>
					<table class="table table-striped">
						 <thead class="thead-dark">
							<tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th></tr>
						</thead>
						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out value="${list.rno}" /></td>
								<td>
									<a href="detailPage?no=${list.rno}">${list.title}</a>  <i class="fab fa-replyd"></i>(${list.reply_count})  
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
					<button type="button" id="register" class="btn btn-outline-info" ><i class="far fa-plus-square"></i>후기등록</button>
					<button type="button" class="btn btn-outline-info" onclick="location.href= '/review/list'"><i class="fas fa-redo"></i>새로고침</button>
					
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