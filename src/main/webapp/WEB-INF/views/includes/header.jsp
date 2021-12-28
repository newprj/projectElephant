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
	</head>
	<body>
		<div id="container" class="effect mainnav-full">
	    	<header id="navbar">
	        	<div id="navbar-container" class="boxed">
	            	<div class="navbar-header">
	            		<a href="/group/" class="navbar-brand">
	                		<img src="/resources/img/elephantIcon.png" class="fa fa-cube brand-icon"/>
		                    <div class="brand-title">
		                        <span class="brand-text">코끼리</span>
		                    </div>
		                </a>
	            	</div>
	            	<div class="navbar-content clearfix">
	                	<ul class="nav navbar-top-links pull-left">
	                	<!-- 메시지, 종 아이콘 -->
	                    	<li class="dropdown">
		                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">
		                        <i class="fa fa-envelope fa-lg"></i>
		                        <span class="badge badge-header badge-warning">9</span>
		                        </a>
		                        <!--Message dropdown menu-->
		                        <div class="dropdown-menu dropdown-menu-md with-arrow">
		                            <div class="pad-all bord-btm">
		                               <div class="h4 text-muted text-thin mar-no">You have 3 messages.</div>
		                            </div>
		                            <div class="nano scrollable">
		                                <div class="nano-content">
		                                    <ul class="head-list">
		                                        <!-- Dropdown list-->
		                                        <li>
		                                            <a href="#" class="media">
		
	                                                <div class="media-left">
	                                                    <img src="/resources/img/av2.png" alt="Profile Picture" class="img-circle img-sm">
	                                                </div>
	                                                <div class="media-body">
	                                                    <div class="text-nowrap">Andy sent you a message</div>
	                                                    <small class="text-muted">15 minutes ago</small>
	                                                </div>
	                                            </a>
	                                        </li>
	                                        <!-- Dropdown list-->
	                                        <li>
	                                            <a href="#" class="media">
	                                                <div class="media-left">
	                                                    <img src="/resources/img/av4.png" alt="Profile Picture" class="img-circle img-sm">
	                                                </div>
	                                                <div class="media-body">
	                                                    <div class="text-nowrap">Lucy sent you a message</div>
	                                                    <small class="text-muted">30 minutes ago</small>
	                                                </div>
	                                            </a>
	                                        </li>
	                                        <!-- Dropdown list-->
	                                        <li>
	                                            <a href="#" class="media">
	                                                <div class="media-left">
	                                                    <img src="/resources/img/av3.png" alt="Profile Picture" class="img-circle img-sm">
	                                                </div>
	                                                <div class="media-body">
	                                                    <div class="text-nowrap">Jackson sent you a message</div>
	                                                    <small class="text-muted">40 minutes ago</small>
	                                                </div>
	                                            </a>
	                                        </li>
	                                        <!-- Dropdown list-->
	                                        <li>
	                                            <a href="#" class="media">
	                                                <div class="media-left">
	                                                    <img src="/resources/img/av6.png" alt="Profile Picture" class="img-circle img-sm">
	                                                </div>
	                                                <div class="media-body">
	                                                    <div class="text-nowrap">Donna sent you a message</div>
	                                                    <small class="text-muted">5 hours ago</small>
	                                                </div>
	                                            </a>
	                                        </li>
	                                        <!-- Dropdown list-->
	                                        <li>
	                                            <a href="#" class="media">
	                                                <div class="media-left">
	                                                    <img src="/resources/img/av4.png" alt="Profile Picture" class="img-circle img-sm">
	                                                </div>
	                                                <div class="media-body">
	                                                    <div class="text-nowrap">Lucy sent you a message</div>
	                                                    <small class="text-muted">Yesterday</small>
	                                                </div>
	                                            </a>
	                                        </li>
	                                        <!-- Dropdown list-->
	                                        <li>
	                                            <a href="#" class="media">
	                                                <div class="media-left">
	                                                    <img src="/resources/img/av3.png" alt="Profile Picture" class="img-circle img-sm">
	                                                </div>
	                                                <div class="media-body">
	                                                    <div class="text-nowrap">Jackson sent you a message</div>
	                                                    <small class="text-muted">Yesterday</small>
	                                                </div>
	                                            </a>
	                                        </li>
	                                    </ul>
	                                </div>
	                            </div>
	                            <!--Dropdown footer-->
	                            <div class="pad-all bord-top">
	                                <a href="#" class="btn-link text-dark box-block">
	                                <i class="fa fa-angle-right fa-lg pull-right"></i>Show All Messages
	                                </a>
	                            </div>
	                        </div>
	                    </li>


	                    <li class="dropdown">
	                        <a href="#" data-toggle="dropdown" class="dropdown-toggle"> <i class="fa fa-bell fa-lg"></i> <span class="badge badge-header badge-danger">5</span> </a>
	                        <!--Notification dropdown menu-->
	                        <div class="dropdown-menu dropdown-menu-md with-arrow">
	                            <div class="pad-all bord-btm">
	                               <div class="h4 text-muted text-thin mar-no"> Notification </div>
	                            </div>
	                            <div class="nano scrollable">
	                                <div class="nano-content">
	                                    <ul class="head-list">
	                                        <!-- Dropdown list-->
	                                        <li>
	                                            <a href="#" class="media">
	                                                <div class="media-left"> <span class="icon-wrap icon-circle bg-primary"> <i class="fa fa-comment fa-lg"></i> </span> </div>
	                                                <div class="media-body">
	                                                    <div class="text-nowrap">New comments waiting approval</div>
	                                                    <small class="text-muted">15 minutes ago</small> 
	                                                </div>
	                                            </a>
	                                        </li>
	                                        <!-- Dropdown list-->
	                                        <li>
	                                            <a href="#" class="media">
	                                                <span class="badge badge-success pull-right">90%</span>
	                                                <div class="media-left"> <span class="icon-wrap icon-circle bg-danger"> <i class="fa fa-hdd-o fa-lg"></i> </span> </div>
	                                                <div class="media-body">
	                                                    <div class="text-nowrap">HDD is full</div>
	                                                    <small class="text-muted">50 minutes ago</small> 
	                                                </div>
	                                            </a>
	                                        </li>
	                                        <!-- Dropdown list-->
	                                        <li>
	                                            <a href="#" class="media">
	                                                <div class="media-left"> <span class="icon-wrap icon-circle bg-info"> <i class="fa fa-file-word-o fa-lg"></i> </span> </div>
	                                                <div class="media-body">
	                                                    <div class="text-nowrap">Write a news article</div>
	                                                    <small class="text-muted">Last Update 8 hours ago</small> 
	                                                </div>
	                                            </a>
	                                        </li>
	                                        <!-- Dropdown list-->
	                                        <li>
	                                            <a href="#" class="media">
	                                                <span class="label label-danger pull-right">New</span>
	                                                <div class="media-left"> <span class="icon-wrap icon-circle bg-purple"> <i class="fa fa-comment fa-lg"></i> </span> </div>
	                                                <div class="media-body">
	                                                    <div class="text-nowrap">Comment Sorting</div>
	                                                    <small class="text-muted">Last Update 8 hours ago</small> 
	                                                </div>
	                                            </a>
	                                        </li>
	                                        <!-- Dropdown list-->
	                                        <li>
	                                            <a href="#" class="media">
	                                                <div class="media-left"> <span class="icon-wrap icon-circle bg-success"> <i class="fa fa-user fa-lg"></i> </span> </div>
	                                                <div class="media-body">
	                                                    <div class="text-nowrap">New User Registered</div>
	                                                    <small class="text-muted">4 minutes ago</small> 
	                                                </div>
	                                            </a>
	                                        </li>
	                                    </ul>
	                                </div>
	                            </div>


	                            <div class="pad-all bord-top">
	                                <a href="#" class="btn-link text-dark box-block"> <i class="fa fa-angle-right fa-lg pull-right"></i>Show All Notifications </a>
	                            </div>
	                        </div>
	                    </li>
	                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	                    <!--End notifications dropdown-->
	                </ul>
	                
	                
	                <ul class="nav navbar-top-links pull-right">
	                    
	                    <li id="dropdown-user" class="dropdown">
	                        <a href="#" data-toggle="dropdown" class="dropdown-toggle text-right">
	                            <span class="pull-right"> <img class="img-circle img-user media-object" src="/resources/img/user.png" alt="Profile Picture"> </span>
	                            <div class="username hidden-xs">${user.name} 님</div>
	                        </a>
	                        <div class="dropdown-menu dropdown-menu-right with-arrow">
	                            <!-- User dropdown menu -->
	                            <ul class="head-list">
	                                <li>
	                                    <a href="/user/modify"> <i class="fa fa-user fa-fw"></i> Profile </a>
	                                </li>
	                                <li>
	                                    <a href="/mypage/allMessage">  <i class="fa fa-envelope fa-fw"></i> Messages </a>
	                                </li>
	                                <c:choose>
		                                <c:when test="${user.user_id == 'admin'}">
			                                <li>
			                                    <a href="/mypage/admin">  <i class="fa fa-gear fa-fw"></i> Settings </a>
			                                </li>
			                            </c:when>
			                            <c:otherwise>
			                             	<li>
			                                    <a href="/mypage/user">  <i class="fa fa-gear fa-fw"></i> Settings </a>
			                                </li>
			                            </c:otherwise>
	                                </c:choose>
	                                <li>
	                                    <a href="/user/logout"> <i class="fa fa-sign-out fa-fw"></i> Logout </a>
	                                </li>
	                            </ul>
	                        </div>
	                    </li>
	                </ul>
	            </div>
	            
	            
	            <nav class="navbar navbar-default megamenu">
	                <div class="navbar-header">
	                    <button type="button" data-toggle="collapse" data-target="#defaultmenu" class="navbar-toggle">
	                    <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
	                    </button>
	                </div>
	                <div id="defaultmenu" class="navbar-collapse collapse">
	                    <ul class="nav navbar-nav">
	                    	<li>
                                  <a href="/group/"> Main</a>
                            </li>
                            <li>
                                  <a href="/qna/list"> Q&A</a>
                            </li>
	                        
	                        <li>
	                            <a href="/mypage/calendar"> Calendar </a>
	                        </li>
	                        
	                        <!-- end standard drop down -->
	                       
	                    </ul>
	                    <!-- end nav navbar-nav -->
	                </div>
	                <!-- end #navbar-collapse-1 -->
	            </nav>
	            <!-- end navbar navbar-default megamenu -->
	        </div>
	    </header>
    
    
    
   