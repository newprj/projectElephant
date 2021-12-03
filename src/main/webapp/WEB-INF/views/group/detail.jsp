<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script src="//code.jquery.com/jquery-3.6.0.js"></script>
  </head>
  <body>
    <div>
      <form>
        <div>
          <label>아이디 </label>
          <input type="text" name="user_id" />
        </div>
      </form>
    </div>
    <div>
   		<a href="board/${one.group_name}">
   			
   			 게시판 
   			</a>
   		</form>
    </div>
    <button class="a"> 일정 </button>
	<p> <a href="/group/"> 메인 </a></p>
	
    ${one}
    <button class="delete">삭제</button>
    <button class="signup">지원하기</button>
  </body>
  <script>
    const signupGroup = (data) => {
    	console.log()
      $.ajax({
        type: 'post',
        url: '/group/',
        data: JSON.stringify(data),
        contentType: 'application/json; charset=utf-8',
        success: (res) => console.log(res),
        error: (xhr, status, er) => {
          
          console.log(xhr)
          
        },
      })
    }

    $(document).ready(function (e) {
      
      $('.a').click(function(e){
        location.href = '/group/test/' + '${one.group_name}'
      })
      
      $('.delete').click(function (e) {
        $.ajax({
          type: 'delete',
          url: '/group/' + '${one.group_name}',
          success: () => {
            location.href = '/group/'
          },
          error: (xhr, status, er) => {
            console.log(status)
            
          },
        }) //ajax
      }) //delete button
      let signupform = {}
      $('.signup').click(function (e) {
        signupform = {
          user_id: $('input[name="user_id"]').val(),
          group_name: '${one.group_name}',
        }
       
        signupGroup(signupform)
      })
    })
  </script>
</html>
