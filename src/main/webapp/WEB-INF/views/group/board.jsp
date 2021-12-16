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
  <h1> 스터디별 게시판 페이지</h1>
  <a href="/group/"> 메인 </a>
  <button class="create">입력</button>
    
    
    <div>
    	<form class="searchForm" >
    		<select name="type">
    			<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected' : ''}"/>> ====================== </option>
					<option value="T" <c:out value="${pageMaker.cri.type eq 'T'? 'selected' : ''}"/>> 제목 </option>
					<option value="W" <c:out value="${pageMaker.cri.type eq 'W'? 'selected' : ''}"/>> 작성자 </option>
					<option value="C" <c:out value="${pageMaker.cri.type eq 'C'? 'selected' : ''}"/>> 내용 </option>
					<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'? 'selected' : ''}"/>> 제목 OR 내용 </option>
					<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'? 'selected' : ''}"/>> 제목 OR 작성자</option>
					<option value="CW" <c:out value="${pageMaker.cri.type eq 'CW'? 'selected' : ''}"/>> 내용 OR 작성자  </option>
					<option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'? 'selected' : ''}"/>> 제목 OR 내용 OR 작성자 </option>
    		</select>
				<input type="text" name="keyword" />
				<button class="searchForm"> 검색 </button>
    	</form>
    </div>


    <c:forEach items="${board}" var="board">
      <div >
      	<span class="list"  data="${board.bno}"> ${board.title} </span>
      	<c:if test="${board.attachList !=null && board.attachList.size()>0 }">
      		<i class="fas fa-paperclip"></i>
      	</c:if>
      	<span> <i class="far fa-comment-dots"></i> ${board.replyCnt}</span>
      </div>
   	 	<div>

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
        let pageNum = "${cri.pageNum}"
        let amount = "${cri.amount}"
        
        let loginUser= "${user}"
        
				$.getJSON(
					"/group/getMemberlistByGroup/${name}", (list) =>{
						console.log(" 손을 봐야 해...")
						console.log(list.memberList)
						console.log(loginUser)
						let joinCheck = list.memberList.find( user => user.user_id === loginUser)
						if(!joinCheck){
							alert("그룹 회원만 접근 가능한 페이지입니다")
							location.href="/group/" 
					} 
				})
		
		
        $('.create').click(function(e){
        	location.href="/group/board/${name}/write"
        })
        $('.list').click(function (e) {
          bno = $(this).attr('data')
          let type = "${cri.type}"
         	let keyword =  "${cri.keyword}"
         	
         	let url = type && keyword ? `/group/board/${name}/\${bno}/\${pageNum}/\${amount}/\${type}/\${keyword}` 
         			:  `/group/board/${name}/\${bno}/\${pageNum}/\${amount}`
         	 
         	location.href = url  
        }) //list.click
        
        $('.pagenate a').click(function(e){
        	e.preventDefault()
        	let type = "${cri.type}"
        	let keyword =  "${cri.keyword}"
        	
        	let pageNum =$(this).attr('href')
        	let url = type && keyword ? `/group/board/${name}/\${pageNum}/\${amount}/\${type}/\${keyword}` 
        			:  `/group/board/${name}/\${pageNum}/\${amount}`
        	 
        	location.href = url 
        
        })// a click
				
        let searchForm = $('form.searchForm')
        $('button.searchForm').click((e) => {
        	e.preventDefault()
        	let type = searchForm.find("option:selected").val()
        	let keyword =  $('input[name="keyword"]').val()
        	if(!type){
        		alert("옵션 종류를 선택하세요 ") 
        	}else if (!keyword){
        		alert("검색 키워드를 입력하세요 ")
        	}else {
        		let url = `/group/board/${name}/\${pageNum}/\${amount}/\${type}/\${keyword}`
        		location.href = url 
        	}
        
        })// search button click
        
				

      }) //docu
    </script>
  </body>
</html>
