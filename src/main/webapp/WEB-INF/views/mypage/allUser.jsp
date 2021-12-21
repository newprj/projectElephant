<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<jsp:useBean id="today" class="java.util.Date" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> admin page</title>
        <link rel="shortcut icon" href="/resources/img/favicon.ico">
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
<style>



.modal,.letter_modal {
	display:none;
	position: fixed;
	z-index: 1;
	left: 0;
	top:0;
	width: 100%;
	height:100%;
	overflow:auto;
	background-color:rgb(0,0,0);
	background-color:rgba(0,0,0,0.4);
}

.modal-content{
	background-color:#fefefe;
	margin:15% auto;
	padding: 20px;
	border: 1px solid #888;
    width: 30%;

}


</style>
<title>관리자 페이지</title>

</head>
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
                            <a href="calendar.html"> Users </a>
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
    
	<div id="content-container">
       <div id="profilebody">
           <div class="pad-all animated fadeInDown">
               <div class="row">
                   <div class="col-lg-2 col-sm-6 col-md-6 col-xs-12">
                       <div class="panel panel-default mar-no">
                           <div class="panel-body">
                               <a href="JavaScript:void(0);">
                                   <div class="pull-left">
                                       <p class="profile-title text-bricky">Users</p>
                                   </div>
                                   <div class="pull-right text-bricky"> <i class="fa fa-users fa-4x"></i> </div>
                               </a>
                           </div>
                       </div>
                   </div>
                   <div class="col-lg-2 col-sm-6 col-md-6 col-xs-12">
                       <div class="panel panel-default mar-no">
                           <div class="panel-body">
                               <a href="JavaScript:void(0);">
                                   <div class="pull-left">
                                       <p class="profile-title text-bricky">Inbox</p>
                                   </div>
                                   <div class="pull-right text-bricky"> <i class="fa fa-envelope fa-4x"></i> </div>
                               </a>
                           </div>
                       </div>
                   </div>
                   <div class="col-lg-2 col-sm-6 col-md-6 col-xs-12">
                       <div class="panel panel-default mar-no">
                           <div class="panel-body">
                               <a href="JavaScript:void(0);">
                                   <div class="pull-left">
                                       <p class="profile-title text-bricky">FAQ</p>
                                   </div>
                                   <div class="pull-right text-bricky"> <i class="fa fa-headphones fa-4x"></i> </div>
                               </a>
                           </div>
                       </div>
                   </div>
                   <div class="col-lg-2 col-sm-6 col-md-6 col-xs-12">
                       <div class="panel panel-default mar-no">
                           <div class="panel-body">
                               <a href="JavaScript:void(0);">
                                   <div class="pull-left">
                                       <p class="profile-title text-bricky">Settings</p>
                                   </div>
                                   <div class="pull-right text-bricky"> <i class="fa fa-cogs fa-4x"></i> </div>
                               </a>
                           </div>
                       </div>
                   </div>
                   <div class="col-lg-2 col-sm-6 col-md-6 col-xs-12">
                       <div class="panel panel-default mar-no">
                           <div class="panel-body">
                               <a href="JavaScript:void(0);">
                                   <div class="pull-left">
                                       <p class="profile-title text-bricky">Calender</p>
                                   </div>
                                   <div class="pull-right text-bricky"> <i class="fa fa-calendar fa-4x"></i> </div>
                               </a>
                           </div>
                       </div>
                   </div>
                   <div class="col-lg-2 col-sm-6 col-md-6 col-xs-12">
                       <div class="panel panel-default mar-no">
                           <div class="panel-body">
                               <a href="JavaScript:void(0);">
                                   <div class="pull-left">
                                       <p class="profile-title text-bricky">Pictures</p>
                                   </div>
                                   <div class="pull-right text-bricky"> <i class="fa fa-picture-o fa-4x"></i> </div>
                               </a>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
      <div class="pageheader">
          <h3><i class="fa fa-home"></i> Directory </h3>
          <div class="breadcrumb-wrapper">
              <span class="label">You are here:</span>
              <ol class="breadcrumb">
                  <li> <a href="#"> Home </a> </li>
                  <li class="active"> Directory </li>
              </ol>
          </div>
      </div>
     
       <div id="page-content">
           <div class="well">
               <div class="row">
                   <div class="col-sm-9">
                       <input placeholder="Who are you looking for?" class="form-control" type="text">
                   </div>
                   <div class="col-sm-3">
                       <div class="form-group nm">
                           <select class="form-control" id="source">
                               <option value="Name">Full Name</option>
                              <option value="position">Position</option>
                               <option value="company">Company</option>
                           </select>
                       </div>
                   </div>
               </div>
           </div>
           
           <div class="row" >
         		<c:forEach items="${list}" var="i" varStatus="status" >
               <div class="col-md-3"  style="float:left;" >
                   <div class="panel panel-default" >
                       <div class="panel-body np">
                           <img src="/resources/img/photos/big-user-image.jpg" alt="Cover" class="img-responsive">
                           <div class="text-center pad-btm">
                               <!-- panel body -->
                               <h3>${i.name}</h3>
                           </div>
                           <ul class="menu-items">
                               <li>
                                   <a href="javascript:void(0)" class="clearfix">
                                   <i class="fa fa-bell-o fa-lg"></i> New notifications ?
                                   <span class="label label-danger label-circle pull-right">82</span>
                                   </a>
                               </li>
                               <li>
                                   <a href="javascript:void(0)" class="clearfix">
                                   <i class="fa fa-user fa-lg"></i> profile
                                   <span class="label label-success label-circle pull-right">13</span>
                                   </a>
                               </li>
                               <li>
                                   <a href="javascript:void(0)" class="susp">
                                   <i class="fa fa-calendar fa-lg"></i> status
                                   <span class="label label-warning label-circle pull-right">
                                   <c:choose>
										<c:when test="${i.suspension eq 'Y'}">정지</c:when>
										<c:otherwise>활동중</c:otherwise>
									</c:choose>	
                                   </span>
                                   </a>
                               </li>
                               <li>
                                   <a href="javascript:void(0)" class="letterBtn">
                                   <i class="fa fa-envelope fa-lg"></i> message
                                   </a>
                               </li>
                           </ul>
                       </div>
                   </div>
               </div>
          		</c:forEach>
           </div>
         </div>
       </div>
    
    <footer id="footer">
        <!-- Visible when footer positions are fixed -->
        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
        <div class="show-fixed pull-right">
            <ul class="footer-list list-inline">
                <li>
                    <p class="text-sm">SEO Proggres</p>
                    <div class="progress progress-sm progress-light-base">
                        <div style="width: 80%" class="progress-bar progress-bar-danger"></div>
                    </div>
                </li>
                <li>
                    <p class="text-sm">Online Tutorial</p>
                    <div class="progress progress-sm progress-light-base">
                        <div style="width: 80%" class="progress-bar progress-bar-primary"></div>
                    </div>
                </li>
                <li>
                    <button class="btn btn-sm btn-dark btn-active-success">Checkout</button>
                </li>
            </ul>
        </div>
        <div class="hide-fixed pull-right pad-rgt">Currently v2.2</div>
        <p class="pad-lft">&#0169; 2015 Your Company</p>
    </footer>
    <button id="scroll-top" class="btn"><i class="fa fa-chevron-up"></i></button>
 </div>
	
	
	
	<!-- 유저 정지 모달 -->
	<div class="modal" id="modal" >
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" style='float:right;'>X</button>
					<h4 class="modal-title">유저 정지 </h4>
				</div>
				<div class="modal-body">
					<div class="modal-group">
						<label>ID</label><br/>
						<input name="modelId"/>
					</div>
					<div class="modal-group">
						<label>이유</label><br/>
						<textarea name="modalContent"></textarea>
						
					</div>
					<div class="modal-group">
						<label>날짜</label><br/>
						<input name="modalDate"/>
					</div>
				</div><br/>
				<div class="modal-footer">
					<button type="button" id="register">등록</button>
					<button type="button" class="close">닫기</button>
				</div>
				
		</div>
	</div>
	
	<!-- 쪽지 모달 -->
	<div class="letter_modal" id="letter_modal" >
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" style='float:right;'>X</button>
					<h4 class="modal-title">쪽지 </h4>
				</div>
				<div class="modal-body">
					<div class="modal-group">
						<label>보내는 사람</label><br/>
						<input name="writeId"/>
					</div>
					<div class="modal-group">
						<label>받는 사람</label><br/>
						<input name="recipientId"/>
					</div>
					<div class="modal-group">
						<label>내용</label><br/>
						<textarea name="letterContent"></textarea>
						
					</div>
					<div class="modal-group">
						<label>날짜</label><br/>
						<input name="letterDate"/>
					</div>
				</div><br/>
				<div class="modal-footer">
					<button type="button" id="letterRegister">등록</button>
					<button type="button" class="close">닫기</button>
				</div>
				
		</div>
	</div>

	 <script src="/resources/js/jquery-2.1.1.min.js"></script>
        <!--BootstrapJS [ RECOMMENDED ]-->
        <script src="/resources/js/bootstrap.min.js"></script>
        <!--Fast Click [ OPTIONAL ]-->
        <script src="/resources/plugins/fast-click/fastclick.min.js"></script>
        <!--Jquery Nano Scroller js [ REQUIRED ]-->
        <script src="/resources/plugins/nanoscrollerjs/jquery.nanoscroller.min.js"></script>
        <!--Metismenu js [ REQUIRED ]-->
        <script src="/resources/plugins/metismenu/metismenu.min.js"></script>
        <!--Jasmine Admin [ RECOMMENDED ]-->
        <script src="/resources/js/scripts.js"></script>
        <!--Switchery [ OPTIONAL ]-->
        <script src="/resources/plugins/switchery/switchery.min.js"></script>
        <!--Bootstrap Select [ OPTIONAL ]-->
        <script src="/resources/plugins/bootstrap-select/bootstrap-select.min.js"></script>
        <!--Fullscreen jQuery [ OPTIONAL ]-->
        <script src="/resources/plugins/screenfull/screenfull.js"></script>
</body>
<script type="text/javascript">
	
	$(document).ready(function () {
		
				
		var modal=$(".modal")
		var modalContent=modal.find("textarea[name='modalContent']")
		var modalId=modal.find("input[name='modelId']")
		var modalDate=modal.find("input[name='modalDate']")
		var today=new Date()
		
		/* 회원정지 */
		$(".susp").click(function(){
			console.log('회원정지 버튼 눌림')
			modalDate.closest('div').hide()
			$(".modal").show()
			var idx=$(".susp").index(this)
			var uid=$("#userId"+idx).text()
			modalId.val(uid)
			
			var suspension=''
			if($(this).text().trim()=='정지'){
				suspension='N'
				$("#register").text("정지 해제")
			}
			else if (($(this).text().trim()=='활동중')) {
				suspension='Y'
				$("#register").text("정지")
			}
			
			$("#register").off('click').on('click',function(){
				
				var form={
						user_id:modalId.val(),
						suspension:suspension,
						suspContent:modalContent.val(),
						suspDate:today,
				}
				console.log(form)
				$.ajax({
					url:"/mypage/susp",
					type:"post",
					data:JSON.stringify(form),
					contentType:"application/json; charset=utf-8",
					dataType:"text",
					success:function(result){
						$("#modal").hide();
						location.reload();
					},
					error:function(){
						alert("실패")
					}
				}) 
			})
		})
		
		
		
		
		/* 쪽지 */
		var letterModal=$(".letter_modal")
		var modalwriteId=letterModal.find("input[name='writeId']")
		var modalrecipientId=letterModal.find("input[name='recipientId']")
		var letterDate=letterModal.find("input[name='letterDate']")
		var letterContent=letterModal.find("textarea[name='letterContent']")
		
		$(".letterBtn").click(function(){
			console.log('쪽지 버튼 눌림')
			
			letterDate.closest('div').hide()
			$(".letter_modal").show()
			var idx=$(this).data("idx")
			var uid=$("#userId"+idx).text()
			
			
			modalwriteId.val('${user}')
			modalrecipientId.val(uid)
						
			$("#letterRegister").off('click').on('click',function(){
				
				var form={
						writer:modalwriteId.val(),
						recipient:modalrecipientId.val(),
						content:letterContent.val(),
						reg_date:today,
				}
				console.log(form)
				$.ajax({
					url:"/mypage/letterRegister",
					type:"post",
					data:JSON.stringify(form),
					contentType:"application/json; charset=utf-8",
					dataType:"text",
					success:function(result){
						$(".letter_modal").hide();
						location.reload();
					},
					error:function(){
						alert("실패")
					}
				}) 
			})
		})
		
		
		$(".close").click(function(){
			$(".modal").hide()
			$(".letter_modal").hide()
			
		})
		
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		})
		
		$(".deleLetter").click(function(){
			console.log("삭제버튼 눌림")
			var lno=$(this).data('lno')
			var data={
					lno:lno,
					writer:'${user}'
			}
			console.log(data)
			$.ajax({
				url:"/mypage/deleLetter",
				type:"post",
				data:JSON.stringify(data),
				contentType:"application/json; charset=utf-8",
				success:function(){
					location.reload();
				},
				error:function(){
					alert("실패")
				}
			}) 
		})
		
		
	})

</script>
</html>