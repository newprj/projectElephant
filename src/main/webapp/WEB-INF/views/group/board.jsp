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
      <div class="list" data="${board.bno}">
      ${board.title}
      </div>
   
   
    </c:forEach>
   

    <script>
      const showOne = (res) => {
        $('textarea[name="content"]').val(res.content)
        $('input[name="bno"]').val(res.bno)
        $('input[name="writer"]').val(res.writer)
        $('input[name="title"]').val(res.title)
      }
      
      $(document).ready(function () {
    	
        let board = {}
        let bno = -1
        $('.list').click(function (e) {
          bno = $(this).attr('data')
          location.href = "/group/board/${group_name}/"+bno
        }) //list.click
		
        

        $('.modify').click(function (e) {
          e.preventDefault()
          let modified = {
            ...board,
            title: $('input[name="title"]').val(),
            content: $('textarea[name="content"]').val(),
          }
          $.ajax({
            type: 'PUT',
            url: '/group/board/' + bno,
            data: JSON.stringify(modified),
            contentType: 'application/json; charset=utf-8',
            success: () => {
              //$('button[type="reset"]').trigger('click')
              location.reload()
            },
            error: (xhr, status, er) => {
              console.log(status)
            }, //error
          }) //ajax
        }) // modify c
      }) //docu
    </script>
  </body>
</html>
