<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .navcontainer{
    height: 60px;
  }
  .wrapper{
    display: flex;
  }
  .left, .right, .center{
    flex :1;
  }
  .center{
    text-align: center;
  }
  .right{
    display: flex;
    justify-content: flex-end;
    margin: 10px;
    align-items: center;
    cursor: pointer;
    text-align: center;
  }
  .item{
    margin-left: 25px;
  }
</style>
</head>

<body>
  
  <div>
    <div class="navcontainer">
      <div class="wrapper">	
        <div class="left"></div>
        <div class="center">
          <h1 class="logo"> 코끼리 </h1>
        </div>
        <div class="right">
    		<c:if test="${user==null && user.size()<0}">
          <div class="item"><a href="/user/register"> 가입</a>  </div>
          <div class="item"><a href="/user/login">로그인</a>  </div>
          </c:if>
          <c:if test="${user!=null}">
          	<div class="item"> <a href="/user/logout"> 로그아웃 </a></div>
          </c:if>
        </div>
      </div>
    </div>
  </div>
  <script>
  	console.log("${user}")
  </script>
  
</html>