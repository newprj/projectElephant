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
	<button type="button" onclick="location.href= '/review/register'">후기등록</button>
	<button type="button" onclick="location.href= '/review/list'">새로고침</button>
  <div class="search">
    <select name="type">
			<option value="" <c:out value="${pageMaker.cri.type==null?'selected':''}"/>>선택</option>
			<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ?'selected':''}"/> >제목</option>
			<option value="W" <c:out value="${pageMaker.cri.type eq 'W' ?'selected':''}"/>>작성자</option>			
			<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 또는 작성자</option>			
	</select>
	<input type="hidden" name="pageNum" value='${pageMarker.cri.pageNum}'>
    <input type="hidden" name="amount" value='${pageMarker.cri.amount}'>
    <input type="text" name="keyword" id="keywordInput" value="${cri.keyword}"/>
    <button id="searchBtn" type="button">검색</button>
  </div>
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
			<c:if test="${pageMarker.next}">
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

$(document).ready(function () {
	$(".paginate_btn a").click(function(e){
		e.preventDefault();
		var thisis=$(this).attr("href")
		$("#actionForm").find("input[name='pageNum']").val(thisis)
		$("#actionForm").submit()
	})
	

}) 
 $(function(){
        $('#searchBtn').click(function() {
       	  if($('#keywordInput').val()=="") alert("검색어를 입력해 주세요")
       	  else{
          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&type=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
       	  } 
       	});
      });   
      
      
</script>
</html>
