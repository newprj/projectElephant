<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="img/favicon.ico">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
		<jsp:useBean id="today" class="java.util.Date" />
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <!--STYLESHEET-->
        <!--=================================================-->
        <!--Roboto Slab Font [ OPTIONAL ] -->
        <link href="http://fonts.googleapis.com/css?family=Roboto+Slab:400,300,100,700" rel="stylesheet">
        <link href="http://fonts.googleapis.com/css?family=Roboto:500,400italic,100,700italic,300,700,500italic,400" rel="stylesheet">
        <!--Bootstrap Stylesheet [ REQUIRED ]-->
        <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
        <!--Jasmine Stylesheet [ REQUIRED ]-->
        <link href="/resources/css/style.css" rel="stylesheet">
        <!--Font Awesome [ OPTIONAL ]-->
        <link href="/resources/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!--Switchery [ OPTIONAL ]-->
        <link href="/resources/plugins/switchery/switchery.min.css" rel="stylesheet">
        <!--Bootstrap Select [ OPTIONAL ]-->
        <link href="/resources/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet">
        <!--Demo [ DEMONSTRATION ]-->
        <link href="/resources/css/demo/jasmine.css" rel="stylesheet">
        <!--Full Calendar [ OPTIONAL ]-->
        <link href="/resources/plugins/fullcalendar/fullcalendar.css" rel="stylesheet">
        <!--SCRIPT-->
        <!--=================================================-->
        <!--Page Load Progress Bar [ OPTIONAL ]-->
        <link href="/resources/plugins/pace/pace.min.css" rel="stylesheet">
        <script src="/resources/plugins/pace/pace.min.js"></script>
			<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
			<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
			<link
				href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
				rel="stylesheet"
			/>
			<script src="/resources/image-resize.min.js"></script>
			<script src="/resources/image-drop.min.js"></script>
			<script src="/resources/js/fileUpload.js" type="text/javascript"></script>
			
			<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 	
 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>
	<body>

<title>로그인</title>


<div id="container" class="cls-container">


	<c:if test="${user == null}">
	<div class="lock-wrapper">
       <div class="panel lock-box">
           <div class="center"> <img alt="" src="/resources/img/user.png" class="img-circle"/> </div>
           <h4> Hello User !</h4>
           <p class="text-center">Please login to Access your Account</p>
           <div class="row">
               <form action="/user/login" class="form-inline" method="post">
                   <div class="form-group col-md-12 col-sm-12 col-xs-12">
                       <div class="text-left">
                           <label class="text-muted">ID</label>
                           <input id="signupInputEmail1" type="text" name="user_id"  placeholder="Enter ID" class="form-control" required />
                       </div>
                       <div class="text-left">
                           <label for="signupInputPassword" class="text-muted">Password</label>
                           <input id="signupInputPassword" name="password" type="password" placeholder="Password" class="form-control lock-input" required />
                       </div>
                       <!-- <div class="pull-left pad-btm">
                           <label class="form-checkbox form-icon form-text">
                           <input type="checkbox"> Remember Me
                           </label>
                       </div> -->
                        <button type="submit" class="btn btn-block btn-primary" >
                        Sign In
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div class="registration"> Don't have an account ! <a href="/user/register"> <span class="text-primary"> Sign Up </span> </a> </div>
    </div>
     </c:if>
     <c:if test="${msg == false}">
      	<p>로그인에 실패했습니다.</p>
      </c:if>
       <c:if test="${user != null}">
      	<p>${user.name}님 환영합니다</p>
      	<button class="btn btn-primary" type="button" onclick="location.href='logout' ">로그아웃</button>
      	<button class="btn btn-info" type="button" onclick="location.href='modify' ">회원정보 수정</button>
      	<button class="btn btn-danger" type="button" onclick="location.href='delete' ">회원탈퇴</button>
      	
      </c:if>
</div>
        
        
        
	

 	<!--===================================================-->
        <!-- END OF CONTAINER -->
        <!--JAVASCRIPT-->
        <!--=================================================-->
        <!--jQuery [ REQUIRED ]-->
        <script src="js/jquery-2.1.1.min.js"></script>
        <!--BootstrapJS [ RECOMMENDED ]-->
        <script src="js/bootstrap.min.js"></script>
        <!--Fast Click [ OPTIONAL ]-->
        <script src="plugins/fast-click/fastclick.min.js"></script>
        <!--Switchery [ OPTIONAL ]-->
        <script src="plugins/switchery/switchery.min.js"></script>
        <!--Bootstrap Select [ OPTIONAL ]-->
        <script src="plugins/bootstrap-select/bootstrap-select.min.js"></script>
    </body>
</html>