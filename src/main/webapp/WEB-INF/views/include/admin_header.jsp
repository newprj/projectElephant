<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="img/favicon.ico">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
		<jsp:useBean id="today" class="java.util.Date" />
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <title> admin page</title>
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
        <!--SCRIPT-->
        <!--=================================================-->
        <!--Page Load Progress Bar [ OPTIONAL ]-->
        <link href="/resources/plugins/pace/pace.min.css" rel="stylesheet">
        <script src="/resources/plugins/pace/pace.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<body>
<div id="container" class="effect mainnav-full">

    <!--NAVBAR 해더-->
    <!--===================================================-->
    <header id="navbar">
        <div id="navbar-container" class="boxed">
            <!--Brand logo & name-->
            <!--================================-->
            <div class="navbar-header">
                <a href="index.html" class="navbar-brand">
                <!--코끼리 아이콘 넣기-->
                    <i class="fa fa-cube brand-icon"></i>
                    <div class="brand-title">
                        <span class="brand-text">관리자 페이지</span>
                    </div>
                </a>
            </div>
            <!--================================-->
            <!--End brand logo & name-->
            <!--Navbar Dropdown-->
            <!--==========메시지 알림 아이콘======================-->
            <div class="navbar-content clearfix">
                <ul class="nav navbar-top-links pull-left">
                    <!--Messages Dropdown-->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
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
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End message dropdown-->
                    <!--Notification dropdown-->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
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
                            <!--Dropdown footer-->
                            <div class="pad-all bord-top">
                                <a href="#" class="btn-link text-dark box-block"> <i class="fa fa-angle-right fa-lg pull-right"></i>Show All Notifications </a>
                            </div>
                        </div>
                    </li>
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End notifications dropdown-->
                </ul>
                
                
                <ul class="nav navbar-top-links pull-right">
                    <!--Profile toogle button-->
                    <!--~~~~~~~~~~~~~~~이름, 사진, 크게~~~~~~~~~~~~~~~~~-->
                    <li class="hidden-xs" id="toggleFullscreen">
                        <a class="fa fa-expand" data-toggle="fullscreen" href="#" role="button">
                        <span class="sr-only">Toggle fullscreen</span>
                        </a>
                    </li>
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End Profile toogle button-->
                    <!--User dropdown-->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <li id="dropdown-user" class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle text-right">
                            <span class="pull-right"> <img class="img-circle img-user media-object" src="/resources/img/av1.png" alt="Profile Picture"> </span>
                            <div class="username hidden-xs">John Doe</div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right with-arrow">
                            <!-- User dropdown menu -->
                            <ul class="head-list">
                                <li>
                                    <a href="#"> <i class="fa fa-user fa-fw"></i> Profile </a>
                                </li>
                                <li>
                                    <a href="#">  <i class="fa fa-envelope fa-fw"></i> Messages </a>
                                </li>
                                <li>
                                    <a href="#">  <i class="fa fa-gear fa-fw"></i> Settings </a>
                                </li>
                                <li>
                                    <a href="#"> <i class="fa fa-sign-out fa-fw"></i> Logout </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End user dropdown-->
                </ul>
            </div>
            
            
            <!--================================-->
            <!--End Navbar Dropdown-->
            <nav class="navbar navbar-default megamenu">
                <div class="navbar-header">
                    <button type="button" data-toggle="collapse" data-target="#defaultmenu" class="navbar-toggle">
                    <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                </div>
                <!-- end navbar-header -->
                <div id="defaultmenu" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <!-- standard drop down -->
                        <li class="dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle"> Home <b class="caret"></b></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="index.html">Dashboard V1 </a></li>
                                <li><a href="dashboard-v2.html">Dashboard V2 </a></li>
                            </ul>
                            <!-- end dropdown-menu -->
                        </li>
                        <li>
                            <a href="/mypage/allUser"> Users </a>
                        </li>
                        <!-- end standard drop down -->
                        <!-- standard drop down -->
                        <li class="dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle"> Group <b class="caret"></b></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="ui-animation.html"> CSS3 Animation </a></li>
                                <li><a href="ui-panel.html">Panel </a></li>
                                <li><a href="ui-xeditable.html"> X-Editable </a></li>
                                <li><a href="ui-button.html">Buttons </a></li>
                                <li><a href="ui-fontawesome.html"> FontAwesome </a></li>
                                <li><a href="ui-icons.html">Icons</a></li>
                                <li><a href="ui-components.html"> Components </a></li>
                                <li><a href="ui-timeline.html">Timeline </a></li>
                                <li><a href="ui-nested-lists.html"> Nested Lists </a></li>
                                <li><a href="ui-grids.html"> Grids</a></li>
                                <li><a href="ui-tab.html"> Tab </a></li>
                                <li><a href="ui-accordions.html">Accordions </a></li>
                                <li><a href="ui-dragdrop.html"> Draggable Panel</a></li>
                                <li><a href="ui-typography.html"> Typography </a></li>
                            </ul>
                            <!-- end dropdown-menu -->
                        </li>
                        <!-- end standard drop down -->
                        <!-- standard drop down -->
                        <li class="dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle"> Q&A <b class="caret"></b></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="pages-faq.html"> FAQ </a></li>
                                <li><a href="pages-gallery.html"> Gallery </a></li>
                                <li><a href="pages-directory.html"> User Directory </a></li>
                                <li><a href="pages-profile.html"> User Profile</a></li>
                                <li><a href="pages-invoice.html"> Invoice </a></li>
                                <li><a href="pages-login.html">Login</a></li>
                                <li><a href="pages-register.html"> Register </a></li>
                                <li><a href="pages-password-reminder.html"> Password Reminder </a></li>
                                <li><a href="pages-lock-screen.html"> Lock Screen </a></li>
                                <li><a href="pages-404.html"> 404 Error </a></li>
                                <li><a href="pages-500.html"> 505 Error </a></li>
                            </ul>
                            <!-- end dropdown-menu -->
                        </li>
                        <!-- end standard drop down -->
                        
                        <!-- standard drop down -->
                        <li>
                            <a href="/mypage/allUser"> Message </a>
                        </li>
                        <li>
                            <a href="calendar.html"> Calendar </a>
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
    
    
    <!--===================================================-->
    <!--END NAVBAR-->
    
   