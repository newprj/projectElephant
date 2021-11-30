<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <div class="item"> 가입 </div>
          <div class="item"> 로그인 </div>
          
        </div>
      </div>
    </div>
  </div>
  
  
</html>