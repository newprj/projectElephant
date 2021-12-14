<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>

<html>
  
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script src="//code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://kit.fontawesome.com/eab4c34ae3.js" crossorigin="anonymous"></script>
    <style>
    	.pagination{
    		display:flex;
    	}
      .pagenate{
        margin: 4px;
      }
    </style>
  </head>
  <body>
  <h1> 스터디별 게시판 페이지 </h1>
  <a href="/group/"> 메인 </a>
  <button class="create">입력</button>
    
    
    
    <c:forEach items="${board}" var="board">
      <div class="list"  data="${board.bno}">
      	<span> ${board.title} </span>
      	<c:if test="${board.attachList !=null && board.attachList.size()>0 }">
      		<i class="fas fa-paperclip"></i>
      	</c:if>
      	<span>[ ${board.replyCnt} ]</span>
      </div>
   	 	<div>
   <form id="actionForm" action="/group/board/${group_name}" method="get">
   		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
   		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
   		
   </form>
   	
   </div>
   
    </c:forEach>
   <div class="pagination">
   		<c:if test="${pageMaker.prev}">
   			<div class="pagenate prev"> <a href="${pageMaker.startPage-1}"> prev </a> </div>
   		</c:if>
   		<c:forEach var="num" begin="${pageMaker.startPage}"
   		end="${pageMaker.endPage}">
   		<div class="pagenate"><a href="${num}">${num}</a></div>
   		</c:forEach>
   		<c:if test="${pageMaker.next }">
   			<div class="pagenate next"><a href="${pageMaker.endPage+1}"> next </a></div>
   		</c:if>
   	</div>

    <script>
      
      
      $(document).ready(function () {
    	
    	let actionForm = $('#actionForm')
        let pageNum = actionForm.find('input[name="pageNum"]').val()
        let amount = actionForm.find('input[name="amount"]').val()
        
        let loginUser= "${user}"
        if(! loginUser){
			console.log('로그인안됨')
			alert("로그인 해야 접근 가능합니다")
			location.href="/group/"
		}else{
			$.getJSON(
				"/group/getMemberlistByGroup/${group_name}", (list) =>{
					console.log(list)
					console.log(loginUser)
					let joinCheck = list.find( user => user.user_id === loginUser)
					if(!joinCheck){
						alert("그룹 회원만 접근 가능한 페이지입니다")
						location.href="/group/"
					} 
				})
		}
		
        $('.create').click(function(e){
        	let group_name = '${cri}' ? "${cri.group_name}" : "${group_name}"
        	location.href="/group/board/"+group_name+"/write"
        })
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
