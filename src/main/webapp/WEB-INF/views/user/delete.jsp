<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 	
 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>회원탈퇴</title>

  </head>
  <script type="text/javascript">
		$(document).ready(function(){
			$("#submit").on("click", function(){
				if($("#password").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#password").focus();
					return false;
				}
			})
			$("#pwCheck").click(function(){
				if($("#password2").val() != $("#password").val()){
					$(".result2 .msg2").text("비밀번호가 일치하지 않습니다")
					$(".result2 .msg2").attr("style", "color:#f00")
					$("#submit").attr("disabled", "disabled")
				}
				else{
					$(".result2 .msg2").text("비밀번호 일치")
					$(".result2 .msg2").attr("style", "color:#00f")
					$("#submit").removeAttr("disabled")
				}
			})
			$("#password").keyup(function(){
				$(".result2 .msg2").text("비밀번호를 확인해주세요")
				$(".result2 .msg2").attr("style", "color:#000")
				$("#submit").attr("disabled", "disabled")
			})
			$("#password2").keyup(function(){
				$(".result2 .msg2").text("비밀번호를 확인해주세요")
				$(".result2 .msg2").attr("style", "color:#000")
				$("#submit").attr("disabled", "disabled")
			})

		})
	</script>
  <body>
    <h4>회원탈퇴</h4>
    
      <form action="/user/delete" method="post" >
        <div class="form-group">
          <label for="user_id">아이디</label>
          <input type="text" class="form-control" name="user_id" value="${user.user_id}" readonly/>
        </div>
        <div class="form-group">
          <label for="password">비밀번호</label>
          <input type="password" class="form-control" name="password" id="password"/>
        </div>
        <div class="form-group">
          <label for="password2">비밀번호 재입력</label>
          <input type="password" class="form-control" name="password2" id="password2" />
          <button class="btn btn-primary" type="button" id="pwCheck">비밀번호 확인</button>
          <p class="result2">
          	<span class="msg2">비밀번호를 확인해주세요</span>
          </p>
        </div>

        <button class="btn btn-danger" id="submit">탈퇴</button>
        <button class="btn btn-success" type="button" onclick="location.href='/group/' ">탈퇴 취소</button>
      </form>
      
      <c:if test="${msg == false}">
      	<p>비밀번호가 틀립니다</p>
      </c:if>

  </body>
</html>