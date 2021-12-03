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
  <a href="/group/main"> 메인 </a>
    <c:forEach items="${board}" var="board">
      <div class="list" data="${board.bno}">${board.title}</div>
    </c:forEach>
    <h1>여기 게시물 표시</h1>
    <div class="board">
      <form>
        <div>
          <label>bno</label>
          <input name="bno" />
        </div>
        <div>
          <label>title</label>
          <input name="title" />
        </div>
        <div>
          <label>writer</label>
          <input name="writer" />
        </div>
        <div>
          <label> content </label>
          <textarea name="content"></textarea>
        </div>
        <button class="modify">수정</button>
        <button class="create">입력</button>
        <button class="delete">삭제</button>
        <button type="reset">리셋</button>
      </form>
    </div>
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
          $.getJSON('/group/temp/' + bno, { bno }, (res) => {
            showOne(res)
            board = res
          }) //getJson
        }) //list.click
		$('.create').click(function(e){
			e.preventDefault()
			
			board = {
				title: $('input[name="title"]').val(),
	            content: $('textarea[name="content"]').val(),
	            writer : $('input[name="writer"]').val(),
	            group_name:'${name}'
			}
			$.ajax({
				type:'post',
				url : "/group/temp/",
				data : JSON.stringify(board),
				contentType: 'application/json; charset=utf-8',
				success : () => location.reload(),
				error:(xhr, staturs, er) =>{
					console.log(xhr)

				}

			})//ajax
		})//click
        $('.delete').click(function (e) {
          e.preventDefault()
          $.ajax({
            type: 'delete',
            url: '/group/temp/' + bno,
            success: () => {
              location.reload()
            },
            error: (xhr, status, er) => {
              console.log(status)
            },
          }) //ajax
        }) //delete click

        $('.modify').click(function (e) {
          e.preventDefault()
          let modified = {
            ...board,
            title: $('input[name="title"]').val(),
            content: $('textarea[name="content"]').val(),
          }
          $.ajax({
            type: 'PUT',
            url: '/group/temp/' + bno,
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
