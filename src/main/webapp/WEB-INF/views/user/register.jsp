<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 	
 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>회원등록</title>
    
  </head>
  <script type="text/javascript">
		$(document).ready(function(){
			$("#submit").click(function(e){
				
				 if($("#user_id").val()==""){
					alert("아이디를 입력해주세요.");
					$("#user_id").focus();
					return false;
				}
				if($("#password").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#password").focus();
					return false;
				}
				if($("#name").val()==""){
					alert("이름을 입력해주세요.");
					$("#name").focus();
					return false;
				} 
				
				let res1 = $('.result .msg')[0].innerText
				let res2 = $('.result2 .msg2')[0].innerText
			 	if( res1 !== '사용 가능' || res2 !== "비밀번호 일치"){
			 	
			 		alert('아이디와 비밀번호를 확인하세요')
					return false
				}
				
			})
			

			$("#idCheck").click(function(){
				var query = {user_id : $("#user_id").val()};
				$.ajax({
					url : "/user/idCheck",
					type : "post",
					data : query,
					success : function(data){
						if($("#user_id").val() == ""){
							$(".result .msg").text("아이디를 입력해주세요")
							$(".result .msg").attr("style", "color:#f00")
							
						}
						else if(data == 1){
							$(".result .msg").text("아이디 중복")
							$(".result .msg").attr("style", "color:#f00")
							
						}
						else{
							$(".result .msg").text("사용 가능")
							$(".result .msg").attr("style", "color:#00f")
							
						}
					}
				})
			})
			$("#user_id").keyup(function(){
				$(".result .msg").text("아이디를 확인해주세요")
				$(".result .msg").attr("style", "color:#000")
				
			})
			$("#pwCheck").click(function(){
				if($("#password2").val() != $("#password").val()){
					$(".result2 .msg2").text("비밀번호가 일치하지 않습니다")
					$(".result2 .msg2").attr("style", "color:#f00")
					
				}
				else{
					$(".result2 .msg2").text("비밀번호 일치")
					$(".result2 .msg2").attr("style", "color:#00f")
				}
			})
			$("#password").keyup(function(){
				$(".result2 .msg2").text("비밀번호를 확인해주세요")
				$(".result2 .msg2").attr("style", "color:#000")
			})
			$("#password2").keyup(function(){
				$(".result2 .msg2").text("비밀번호를 확인해주세요")
				$(".result2 .msg2").attr("style", "color:#000")
			})
		})
  </script>
  <body>
    <h4>회원등록</h4>
      <form action="/user/register" method="post" class="register">
        <div class="form-group">
          <label for="user_id">아이디</label>
          <input type="text" class="form-control" name="user_id" id="user_id" />
          <button class="btn btn-primary" type="button" id="idCheck">아이디 확인</button>
          <p class="result">
          	<span class="msg">아이디를 확인해주세요</span>
          </p>
        </div>
        <div class="form-group">
          <label for="password">비밀번호</label>
          <input type="password" class="form-control" name="password" id="password" />
        </div>
        <div class="form-group">
          <label for="password2">비밀번호 재입력</label>
          <input type="password" class="form-control" name="password2" id="password2" />
          <button class="btn btn-primary" type="button" id="pwCheck">비밀번호 확인</button>
          <p class="result2">
          	<span class="msg2">비밀번호를 확인해주세요</span>
          </p>
        </div>
        <div class="form-group">
          <label for="name">이름</label>
          <input type="text" class="form-control" name="name" id="name" />
        </div>
        <div class="form-group">
          <label for="email">이메일</label>
          <input type="text" class="form-control" name="email" />
        </div>
        <button class="btn btn-success" id="submit" >가입</button>
        <button class="btn btn-warning" type="button" onclick="location.href='login' ">취소</button>
        
      </form>
  </body>
</html>