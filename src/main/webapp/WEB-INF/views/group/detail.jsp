<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script src="//code.jquery.com/jquery-3.6.0.js"></script>
  </head>
  <body>
  <h1> 스터디 모집 페이지 </h1>
  <div>
  <h3> 스터디 모집글이 들어갈 거에요</h5>
 -스터디 별 페이지는 로그인 => 자기가 가입된 소모임 에서 클릭하면 넘어가도록 구현 예정-<br/>
 - 지금은 로그인 기능이 없으므로 여기에서 페이지를 넘김-<br/>
 <a href="/group/${one.group_name}"> 스터디 별 페이지 </a>
 <p><a href="/group/"> 메인 </a></p>
 <p>
  </div>
  
   
	
    ${one.group_name}<br/>
    ${one.leader }<br/>
    ${one.subject }<br/>
    ${one.description }<br/>
    ${one.member_number }</br>
    
    <button class="delete"> 그룹 삭제</button>
    <div>
      <form>
        <div>
          <label>아이디 </label>
          <input type="text" name="user_id" />
        </div>
      </form>
    </div>
    <button class="signup">지원하기</button>
  </body>
  <script>
    const signupGroup = (data) => {
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
