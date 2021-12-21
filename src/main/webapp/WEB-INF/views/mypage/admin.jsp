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
	
	<div class="pageheader">
         <h3><i class="fa fa-home"></i> Dashboard </h3>
         <div class="breadcrumb-wrapper">
             <span class="label">You are here:</span>
             <ol class="breadcrumb">
                 <li> <a href="#"> Home </a> </li>
                 <li class="active"> Dashboard </li>
             </ol>
         </div>
     </div>
	
	<div id="page-content">
	     <!--Widget-4 -->
	     <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="panel">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-9 col-sm-9 col-xs-10">
                                <h3 class="mar-no"> <span class="counter">회원가입 수</span></h3>
                                <p class="mar-ver-5"> Traffic this month </p>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-2"> <i class="fa fa-user fa-3x text-success"></i> </div>
                        </div>
                        <div class="progress progress-striped progress-sm">
                            <div style="width: 60%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="60" role="progressbar" class="progress-bar"> <span class="sr-only">60% Complete</span> </div>
                        </div>
                        <p> 4% higher than last month </p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="panel">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-9 col-sm-9 col-xs-10">
                                <h3 class="mar-no"> <span class="counter">group 생성</span></h3>
                                <p class="mar-ver-5">Server Load</p>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-2"> <i class="fa fa-folder fa-3x text-danger"></i> </div>
                        </div>
                        <div class="progress progress-striped progress-sm">
                            <div style="width: 60%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="60" role="progressbar" class="progress-bar progress-bar-danger"> <span class="sr-only">60% Complete</span> </div>
                        </div>
                        <p> 4% higher than last month </p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="panel widget">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-9 col-sm-9 col-xs-10">
                                <h3 class="mar-no"> <span class="counter">Q&A 수</span></h3>
                                <p class="mar-ver-5"> Total Sales </p>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-2"> <i class="fa fa-question fa-3x text-success"></i> </div>
                        </div>
                        <div class="progress progress-striped progress-sm">
                            <div style="width: 60%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="60" role="progressbar" class="progress-bar progress-bar-success"> <span class="sr-only">60% Complete</span> </div>
                        </div>
                        <p> 4% higher than last month </p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="panel widget">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-9 col-sm-9 col-xs-10">
                                <h3 class="mar-no"> <span class="counter">방문자 수 </span></h3>
                                <p class="mar-ver-5"> Search Traffic</p>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-2"> <i class="fa fa-users fa-3x text-info"></i> </div>
                        </div>
                        <div class="progress progress-striped progress-sm">
                            <div style="width: 60%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="60" role="progressbar" class="progress-bar progress-bar-warning"> <span class="sr-only">60% Complete</span> </div>
                        </div>
                        <p> 4% higher than last month </p>
                    </div>
                </div>
            </div>
        </div>	
     </div>
	<nav>
		<h5><a href="/user/logout">로그아웃</a></h5>
		<h5 id='today'><fmt:formatDate value="<%= today %>" pattern="yyyy-MM-dd" /> 방문자 :  ${visit}명 </h5>
	</nav>
	<h3>방문자 평균 그래프로 보이게</h3>
	
	
	
	<div class='study'>
		<h3 ><a href='/group/'>스터디 승인 리스트</a></h3>
	<h5>스터디장이 승인 요청한 것만 띄우기</h5>
		<table>
			<thead>
				<tr>
				  <th>no.</th>
				  <th>스터디명</th>
	              <th>주제</th>
	              <th>스터디장</th>
	              <th>인원수</th>
	              <th>내용확인</th>
	              <th>승인여부</th>
				</tr>
			</thead>
			<c:forEach items="${group}" var="i" varStatus="status"  begin="0" end='9'>
				<tr>
					<td>${status.count}</td>
					<td>${i.group_name}</td>
					<td>${i.subject}</td>
					<td>${i.leader}</td>
					<td>${i.member_number}명</td>
					<td><a href='/group/gather/${i.group_name}'>확인</a></td>
					<td><c:choose>
							<c:when test="${i.authorized eq 'Y'}">승인</c:when>
							<c:otherwise>비승인</c:otherwise>
						</c:choose>	
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	
	
	
	<div class='qna'>
	<h3><a href='/qna/list'>Q&A 리스트</a></h3>
		<table>
			<thead>
				<tr>
				  <th>no.</th>
	              <th>제목</th>
				  <th>비밀번호</th>
	              <th>아이디</th>
	              <th>등록일</th>
	              <th>조회수</th>
				</tr>
			</thead>
			<c:forEach items="${qna}" var="i" varStatus="status" begin="0" end='9'>
				<tr>
					<td>${status.count}</td>
					<td><a href="/qna/detail?qno=${i.qno}">${i.title}</a></td>
					<td>${i.pwd}</td>
					<td>${i.writer}</td>
					<td><fmt:formatDate value="${i.up_date}" pattern="yyyy-MM-dd a hh:mm" /></td>
					<td style="text-align:center;" >${i.hit}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div class="row">
    	<div class="col-lg-12">
	        <div class="panel">
	            <div class="panel-heading">
	                <h3 class="panel-title">Letter</h3>
	            </div>
	            <div class="panel-body">
	                <div class="tab-base">
	                    <ul class="nav nav-tabs">
	                        <li class="active"> <a data-toggle="tab" href="#demo-lft-tab-1"> 받은 쪽지 </a> </li>
	                        <li> <a data-toggle="tab" href="#demo-lft-tab-2">보낸 쪽지</a> </li>
	                        <li><a data-toggle="tab" class="letterBtn" >쪽지 보내기</a></li>
	                    </ul>
	                    <!--Tabs Content-->
	                    <div class="tab-content">
	                        <div id="demo-lft-tab-1" class="tab-pane fade active in">
	                        	<table class="table table-hover table-vcenter">
	                            	<thead>
	                                	<tr>
	                                    	<th>no.</th>
											<th>보낸 id</th>
											<th>내용</th>
									         <th>날짜</th>
									         <th></th>
	                                   </tr>
	                                </thead>
	                                <tbody>
	                                	<c:forEach items="${letter}" var="i" varStatus="status"  begin="0" end='9'>
											<tr>
												<td>${status.count}</td>
												<td id='userId${status.index}'>${i.writer}</td>
												<td>${i.content}</td>
												<td><fmt:formatDate value="${i.reg_date}" pattern="yyyy-MM-dd a hh:mm" /></td>
												<td><button class='letterBtn'>답장</button></td>
											</tr>
										</c:forEach>
	                               </tbody>
	                            </table>
	                            <!--===================================================--> 
	                            <!--End Hover Rows--> 
	                        </div>
	                        <div id="demo-lft-tab-2" class="tab-pane fade">
	                        	<table id="demo-foo-filtering" class="table table-bordered table-hover toggle-circle" data-page-size="7">
	                            	<thead>
	                                	<tr>
	                                    	<th>no.</th>
											<th>받는 id</th>
											<th>내용</th>
									         <th>날짜</th>
									         <th></th>
	                                    </tr>
	                                </thead>
	                            	<tbody>
	                                	<c:forEach items="${sendletter}" var="i" varStatus="status"  begin="0" end='9'>
											<tr>
												<td>${status.count}</td>
												<td>${i.recipient}</td>
												<td>${i.content}</td>
												<td><fmt:formatDate value="${i.reg_date}" pattern="yyyy-MM-dd a hh:mm" /></td>
												<td><button data-lno='${i.lno}' class='deleLetter'>삭제</button></td>
											</tr>
										</c:forEach>
	                                </tbody>
	                                <tfoot>
	                                    <tr>
	                                        <td colspan="5">
	                                            <div class="text-right">
	                                                <ul class="pagination"></ul>
	                                            </div>
	                                        </td>
	                                    </tr>
	                                </tfoot>
	                            </table>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
    	</div>
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
</div>
	 <!--=================================================-->
        <!--jQuery [ REQUIRED ]-->
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
        <!--Jquery Steps [ OPTIONAL ]-->
        <script src="/resources/plugins/parsley/parsley.min.js"></script>
        <!--Jquery Steps [ OPTIONAL ]-->
        <script src="/resources/plugins/jquery-steps/jquery-steps.min.js"></script>
        <!--Bootstrap Select [ OPTIONAL ]-->
        <script src="/resources/plugins/bootstrap-select/bootstrap-select.min.js"></script>
        <!--Bootstrap Wizard [ OPTIONAL ]-->
        <script src="/resources/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        <!--Masked Input [ OPTIONAL ]-->
        <script src="/resources/plugins/masked-input/bootstrap-inputmask.min.js"></script>
        <!--Bootstrap Validator [ OPTIONAL ]-->
        <script src="/resources/plugins/bootstrap-validator/bootstrapValidator.min.js"></script>
        <!--Flot Chart [ OPTIONAL ]-->
        <script src="/resources/plugins/flot-charts/jquery.flot.min.js"></script>
        <script src="/resources/plugins/flot-charts/jquery.flot.resize.min.js"></script>
        <script src="/resources/plugins/flot-charts/jquery.flot.spline.js"></script>
        <script src="/resources/plugins/moment/moment.min.js"></script>
        <script src="/resources/plugins/moment-range/moment-range.js"></script>
        <script src="/resources/plugins/flot-charts/jquery.flot.tooltip.min.js"></script>
        <!--Flot Order Bars Chart [ OPTIONAL ]-->
        <script src="/resources/plugins/flot-charts/jquery.flot.categories.js"></script>
        <!--Morris.js [ OPTIONAL ]-->
        <script src="/resources/plugins/morris-js/morris.min.js"></script>
        <script src="/resources/plugins/morris-js/raphael-js/raphael.min.js"></script>        
        <!--Easy Pie Chart [ OPTIONAL ]-->
        <script src="/resources/plugins/easy-pie-chart/jquery.easypiechart.min.js"></script>
        <!--Fullscreen jQuery [ OPTIONAL ]-->
        <script src="/resources/plugins/screenfull/screenfull.js"></script>
        <!--Form Wizard [ SAMPLE ]-->
        <script src="/resources/js/demo/index.js"></script>
        <!--Form Wizard [ SAMPLE ]-->
        <script src="/resources/js/demo/wizard.js"></script>
        <!--Form Wizard [ SAMPLE ]-->
        <script src="/resources/js/demo/form-wizard.js"></script>
</body>
<script type="text/javascript">
	
	$(document).ready(function () {
		
				
		var modal=$(".modal")
		var modalContent=modal.find("textarea[name='modalContent']")
		var modalId=modal.find("input[name='modelId']")
		var modalDate=modal.find("input[name='modalDate']")
		var today=new Date()
		
		/* 댓글 */
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