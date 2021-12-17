<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 	
 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>로그인</title>
</head>
<body>
	
	<h4>로그인</h4>
      <form action="/user/mylogin" method="post">
        <div class="form-group">
          <label for="user_id">아이디</label>
          <input type="text" class="form-control" name="user_id" />
        </div>
        <div class="form-group">
          <label for="password">비밀번호</label>
          <input type="password" class="form-control" name="password" />
        </div>
        <button class="btn btn-primary">로그인</button>
        <button class="btn btn-success" type="button" onclick="location.href='register' ">회원가입</button>
      </form>
	 <c:if test="${loginFail}">
	 	<div>
	 		<span> 로그인에 실패했습니다 </span>
	 	</div>
	 </c:if>
</body>
	<script>
		$('button.btn-primary').click(function(e){
			e.preventDefault();
		})
		
	</script>
</html>