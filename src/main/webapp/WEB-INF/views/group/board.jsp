<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>

<html>
  <script src="//code.jquery.com/jquery-3.6.0.js"></script>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
  <a href="/group/"> 메인 </a>
  <a href="/group/board/${group_name}/write"><button class="create">입력</button></a>
    
    
    
    <c:forEach items="${board}" var="board">
      <div class="list"  data="${board.bno}">
      ${board.title}
      </div>
   	 	<div>
   <form id="actionForm" action="/group/board/${group_name}" method="get">
   		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
   		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
   		
   </form>
   	
   </div>
   
    </c:forEach>
   <ul class="pagination">
   		<c:if test="${pageMaker.prev}">
   			<li class="pagenate prev"> <a href="${pageMaker.startPage-1}"> prev </a> </li>
   		</c:if>
   		<c:forEach var="num" begin="${pageMaker.startPage}"
   		end="${pageMaker.endPage}">
   		<li class="pagenate"><a href="${num}">${num}</a></li>
   		</c:forEach>
   		<c:if test="${pageMaker.next }">
   			<li class="pagenate next"><a href="${pageMaker.endPage+1}"> next </a></li>
   		</c:if>
   	</ul>

    <script>
      
      
      $(document).ready(function () {
    	 let actionForm = $('#actionForm')
        let pageNum = actionForm.find('input[name="pageNum"]').val()
        let amount = actionForm.find('input[name="amount"]').val()
        $('.list').click(function (e) {
          bno = $(this).attr('data')          
          location.href = "/group/board/${name}/"+bno+"/" +pageNum + "/" +amount
        }) //list.click
        
        $('.pagenate a').click(function(e){
        	e.preventDefault()
        	
        	let pageNum =$(this).attr('href')
        	location.href = "/group/board/${name}/"+pageNum + "/" +amount
        })
      }) //docu
    </script>
  </body>
</html>
