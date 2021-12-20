<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> SmartAdmin - Responsive admin template..</title>
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
    </head>
    <body>
        <div id="container" class="effect mainnav-full">
            <!--NAVBAR-->
            <!--===================================================-->
            <header id="navbar">
                <div id="navbar-container" class="boxed">
                    <!--Brand logo & name-->
                    <!--================================-->
                    <div class="navbar-header">
                        <a href="index.html" class="navbar-brand">
                            <i class="fa fa-cube brand-icon"></i>
                            <div class="brand-title">
                                <span class="brand-text">SmartAdmin</span>
                            </div>
                        </a>
                    </div>
                    <!--================================-->
                    <!--End brand logo & name-->
                    <!--Navbar Dropdown-->
                    <!--================================-->
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
                            <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
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
                                    <span class="pull-right"> <img class="img-circle img-user media-object" src="img/av1.png" alt="Profile Picture"> </span>
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
                                <!-- end standard drop down -->
                                <!-- standard drop down -->
                                <li class="dropdown">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle"> Ui Elements <b class="caret"></b></a>
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
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle"> Pages <b class="caret"></b></a>
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
                                <li class="dropdown">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle"> Tables <b class="caret"></b></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="table-static.html"> Static Table </a></li>
                                        <li><a href="table-datatable.html"> Data table </a></li>
                                        <li><a href="table-footable.html"> Foo Table </a></li>
                                    </ul>
                                    <!-- end dropdown-menu -->
                                </li>
                                <!-- end standard drop down -->
                                <!-- standard drop down -->
                                <li class="dropdown">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle"> Forms <b class="caret"></b></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="forms-layout.html"> Form Layout </a></li>
                                        <li><a href="forms-switchery.html"> Form Switchery </a></li>
                                        <li><a href="forms-components.html"> Form Components </a></li>
                                        <li><a href="forms-validation.html"> Form Validation </a></li>
                                        <li><a href="forms-wizard.html"> Form Wizard </a></li>
                                    </ul>
                                    <!-- end dropdown-menu -->
                                </li>
                                <!-- end standard drop down -->
                                <!-- standard drop down -->
                                <li class="dropdown">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle"> Charts <b class="caret"></b></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="charts-flot.html"> Flot Chart </a></li>
                                        <li><a href="charts-morris.html"> Morris Chart </a></li>
                                    </ul>
                                    <!-- end dropdown-menu -->
                                </li>
                                <!-- end standard drop down -->
                                <!-- standard drop down -->
                                <li>
                                    <a href="calendar.html"> Calendar </a>
                                </li>
                                <!-- end standard drop down -->
                                <!-- standard drop down -->
                                <li>
                                    <a href="ui-widgets.html"> Widgets </a>
                                </li>
                                <!-- end standard drop down -->
                                <!-- standard drop down -->
                                <li class="dropdown">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle"> Mail <b class="caret"></b></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="mail-inbox.html"> Inbox </a></li>
                                        <li><a href="mail-compose.html"> Compose Mail </a></li>
                                        <li><a href="mail-mailview.html"> View Mail </a></li>
                                    </ul>
                                    <!-- end dropdown-menu -->
                                </li>
                                <!-- end standard drop down -->
                                <!-- standard drop down -->
                                <li class="dropdown">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle"> Maps <b class="caret"></b></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="maps-gmap.html"> Google Map </a></li>
                                        <li><a href="maps-vectormap.html"> Vector Map </a></li>
                                    </ul>
                                    <!-- end dropdown-menu -->
                                </li>
                                <!-- end standard drop down -->
                                <!-- standard drop down -->
                                <li class="dropdown">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle"> Menu Levels <b class="caret"></b></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#">Second Level</a></li>
                                        <li><a href="#">Second Level</a></li>
                                        <li class="dropdown-submenu">
                                            <a href="#">Second Level</a>
                                            <ul class="dropdown-menu">
                                                <li class="dropdown-submenu">
                                                    <a href="#">Third Level</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a href="#">Fourth Level</a></li>
                                                        <li><a href="#">Fourth Level</a></li>
                                                    </ul>
                                                </li>
                                                <!-- end dropdown-submenu -->
                                                <li><a href="#">Third Level</a></li>
                                                <li><a href="#">Third level</a></li>
                                            </ul>
                                            <!-- end dropdown-menu -->
                                        </li>
                                        <li><a href="#">Creattica</a></li>
                                    </ul>
                                    <!-- end dropdown-menu -->
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
            <div class="boxed">
                <!--CONTENT CONTAINER-->
                <!--===================================================-->
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
                    <!--Page Title-->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
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
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End page title-->
                    <!--Page content-->
                    <!--===================================================-->
                    <div id="page-content">
                        <!--Widget-4 -->
                        <div class="row">
                            <div class="col-md-3 col-sm-6 col-xs-12">
                                <div class="panel">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-9 col-sm-9 col-xs-10">
                                                <h3 class="mar-no"> <span class="counter">50.5 GB</span></h3>
                                                <p class="mar-ver-5"> Traffic this month </p>
                                            </div>
                                            <div class="col-md-3 col-sm-3 col-xs-2"> <i class="fa fa-shopping-cart fa-3x text-info"></i> </div>
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
                                                <h3 class="mar-no"> <span class="counter">26.8%</span></h3>
                                                <p class="mar-ver-5">Server Load</p>
                                            </div>
                                            <div class="col-md-3 col-sm-3 col-xs-2"> <i class="fa fa-envelope fa-3x text-danger"></i> </div>
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
                                                <h3 class="mar-no"> <span class="counter">$14,500</span></h3>
                                                <p class="mar-ver-5"> Total Sales </p>
                                            </div>
                                            <div class="col-md-3 col-sm-3 col-xs-2"> <i class="fa fa-users fa-3x text-success"></i> </div>
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
                                                <h3 class="mar-no"> <span class="counter">65</span>%</h3>
                                                <p class="mar-ver-5"> Search Traffic</p>
                                            </div>
                                            <div class="col-md-3 col-sm-3 col-xs-2"> <i class="fa fa-search fa-3x text-info"></i> </div>
                                        </div>
                                        <div class="progress progress-striped progress-sm">
                                            <div style="width: 60%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="60" role="progressbar" class="progress-bar progress-bar-warning"> <span class="sr-only">60% Complete</span> </div>
                                        </div>
                                        <p> 4% higher than last month </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-9">
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"> Network Performance </h3>
                                    </div>
                                    <div class="panel-body">
                                       <div class="col-md-8">
                                        <!--Flot Spline Chart placeholder -->
                                        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
                                        <div id="flot-spline" style="height:275px;"></div>
                                        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
                                       </div> 
                                       <div class="col-md-4">
                                            <ul class="list-unstyled">
                                                <li class="mar-btm">
                                                    <span class="label label-primary pull-right">75%</span>
                                                    <p> <i class="fa fa-dashboard text-primary"></i> CPU Usage</p>
                                                    <div class="progress progress-sm">
                                                        <div class="progress-bar progress-bar-primary" style="width: 75%;">
                                                            <span class="sr-only">75%</span>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="mar-btm">
                                                    <span class="label label-danger pull-right">55%</span>
                                                    <p><i class="fa fa-database text-danger"></i> Bandwidth</p>
                                                    <div class="progress progress-sm">
                                                        <div class="progress-bar progress-bar-danger" style="width: 55%;">
                                                            <span class="sr-only">55%</span>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="mar-btm">
                                                    <span class="label label-success pull-right">65%</span>
                                                    <p><i class="fa fa-cubes text-success"></i> Memory Usage</p>
                                                    <div class="progress progress-sm">
                                                        <div class="progress-bar progress-bar-success" style="width: 65%;">
                                                            <span class="sr-only">65%</span>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="mar-btm">
                                                    <span class="label label-warning pull-right">45%</span>
                                                    <p><i class="fa fa-hdd-o text-warning"></i> Disk Usage</p>
                                                    <div class="progress progress-sm">
                                                        <div class="progress-bar progress-bar-warning" style="width: 45%;">
                                                            <span class="sr-only">45%</span>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="mar-btm">
                                                    <span class="label label-mint pull-right">3/10</span>
                                                    <p> <i class="fa fa-at"></i> Domain</p>
                                                    <div class="progress progress-sm">
                                                        <div class="progress-bar progress-bar-mint" style="width: 75%;">
                                                            <span class="sr-only">75%</span>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>                                       
                                       </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"> Sales Chart </h3>
                                    </div>
                                    <div class="panel-body">
                                        <!--Morris Area Chart placeholder-->
                                        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
                                        <div id="demo-morris-color-donut" style="height:275px"></div>
                                        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-8">
                                <div class="panel">
                                    <div class="panel-body">
                                       <ul class="nav nav-section nav-justified">
                                          <li>
                                             <div class="section"> 
                                               <h4 class="nm"> 67 GB </h4>
                                                <p class="text-muted">Total Usage</p>
                                             </div>
                                          </li>
                                          <li>
                                             <div class="section"> 
                                               <h4 class="nm"> 320 GB </h4>
                                                <p class="text-muted">Total Space</p>
                                             </div>
                                          </li>
                                          <li>
                                             <div class="section"> 
                                               <h4 class="nm"> 58% </h4>
                                                <p class="text-muted">CPU</p>
                                             </div>
                                          </li>
                                       </ul>
                                        <!--Flot Area Chart placeholder-->
                                        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
                                        <div id="demo-realtime" style="height:265px"></div>
                                        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="panel">
                                    <div class="panel-body">
                                        <div id="carousel-example-vertical" class="carousel vertical slide" data-ride="carousel">
                                            <div class="carousel-inner" role="listbox">
                                                <div class="item active">
                                                    <div class="ticker-headline">
                                                        <div class="media">
                                                            <span class="pull-left"><i class="fa fa-twitter fa-4x text-azure"></i></span>
                                                            <div class="media-body">
                                                                <div class="h4"><strong>Semantha Schwarz</strong> <small>1 hour ago</small></div>
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id quam elementum odio tristique euismod. 
                                                                    Suspendisse id nunc sed massa cursus efficitur. 
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="item">
                                                    <div class="ticker-headline">
                                                        <div class="media">
                                                            <span class="pull-left"><i class="fa fa-facebook fa-4x text-primary"></i></span>
                                                            <div class="media-body">
                                                                <div class="h4"><strong>Semantha Schwarz</strong> <small>1 hour ago</small></div>
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id quam elementum odio tristique euismod. 
                                                                    Suspendisse id nunc sed massa cursus efficitur. Nullam id quam elementum odio tristique euismod. 
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="item">
                                                    <div class="ticker-headline">
                                                        <div class="media">
                                                            <span class="pull-left"><i class="fa fa-google-plus fa-4x text-danger"></i></span>
                                                            <div class="media-body">
                                                                <div class="h4"><strong>Semantha Schwarz</strong> <small>1 hour ago</small></div>
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id quam elementum odio tristique euismod. 
                                                                    Suspendisse id nunc sed massa cursus efficitur. 
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Controls -->
                                            <a class="up carousel-control" href="#carousel-example-vertical" role="button" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                            </a>
                                            <a class="down carousel-control" href="#carousel-example-vertical" role="button" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel papernote">
                                    <div class="panel-body pad-no">
                                        <div class="carousel slide" id="c-slide" data-ride="carousel">
                                            <div class="carousel-inner">
                                                <div class="item active">
                                                    <h4>This is my note #1</h4>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id quam elementum odio tristique euismod. 
                                                        Suspendisse id nunc sed massa cursus efficitur. 
                                                    </p>
                                                </div>
                                                <div class="item">
                                                    <h4>This is my note #2</h4>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id quam elementum odio tristique euismod. 
                                                        Suspendisse id nunc sed massa cursus efficitur. 
                                                    </p>
                                                </div>
                                                <div class="item">
                                                    <h4>This is my note #3</h4>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id quam elementum odio tristique euismod. 
                                                        Suspendisse id nunc sed massa cursus efficitur. 
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"> Order List </h3>
                                    </div>
                                    <div class="panel-body">
                                        <!--Default Tabs (Left Aligned)--> 
                                        <!--===================================================-->
                                        <div class="tab-base">
                                            <!--Nav Tabs-->
                                            <ul class="nav nav-tabs">
                                                <li class="active"> <a data-toggle="tab" href="#demo-lft-tab-1"> Top Selling </a> </li>
                                                <li> <a data-toggle="tab" href="#demo-lft-tab-2">Most Viewed</a> </li>
                                                <li> <a data-toggle="tab" href="#demo-lft-tab-3">Recent Orders</a> </li>
                                            </ul>
                                            <!--Tabs Content-->
                                            <div class="tab-content">
                                                <div id="demo-lft-tab-1" class="tab-pane fade active in">
                                                    <!--Hover Rows--> 
                                                    <!--===================================================-->
                                                    <table class="table table-hover table-vcenter">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Project</th>
                                                                <th>Project Deadline</th>
                                                                <th>Status</th>
                                                                <th class="hidden-xs">Clients</th>
                                                                <th class="hidden-xs">Progress</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>1</td>
                                                                <td>IT Help Desk</td>
                                                                <td>11 May 2016</td>
                                                                <td>
                                                                    <div class="label label-table label-info">Block</div>
                                                                </td>
                                                                <td class="hidden-xs">Semantha Armstrong</td>
                                                                <td class="hidden-xs">
                                                                    <div class="progress progress-striped progress-sm">
                                                                        <div class="progress-bar progress-bar-primary" style="width: 25%;"></div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>2</td>
                                                                <td>Product Dev</td>
                                                                <td>15 May 2016</td>
                                                                <td>
                                                                    <div class="label label-table label-danger">On Hold</div>
                                                                </td>
                                                                <td class="hidden-xs">Jonathan Smith</td>
                                                                <td class="hidden-xs">
                                                                    <div class="progress progress-striped progress-sm">
                                                                        <div class="progress-bar progress-bar-success" style="width: 35%;"></div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>3</td>
                                                                <td>Website Redesign</td>
                                                                <td>19 May 2016</td>
                                                                <td>
                                                                    <div class="label label-table label-success">Approved</div>
                                                                </td>
                                                                <td class="hidden-xs">Jacob Armstrong</td>
                                                                <td class="hidden-xs">
                                                                    <div class="progress progress-striped progress-sm">
                                                                        <div class="progress-bar progress-bar-info" style="width: 85%;"></div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>4</td>
                                                                <td>Local Ad</td>
                                                                <td>25 May 2016</td>
                                                                <td>
                                                                    <div class="label label-table label-warning">Pending</div>
                                                                </td>
                                                                <td class="hidden-xs">Sandra Smith</td>
                                                                <td class="hidden-xs">
                                                                    <div class="progress progress-striped progress-sm">
                                                                        <div class="progress-bar progress-bar-warning" style="width: 45%;"></div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>5</td>
                                                                <td>Design new theme</td>
                                                                <td>28 May 2016</td>
                                                                <td>
                                                                    <div class="label label-table label-warning">Pending</div>
                                                                </td>
                                                                <td class="hidden-xs">Will DeBrandon</td>
                                                                <td class="hidden-xs">
                                                                    <div class="progress progress-striped progress-sm">
                                                                        <div class="progress-bar progress-bar-danger" style="width: 55%;"></div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>6</td>
                                                                <td>Mockup Testing</td>
                                                                <td>31 May 2016</td>
                                                                <td>
                                                                    <div class="label label-table label-warning">Pending</div>
                                                                </td>
                                                                <td class="hidden-xs">Alexander Flynn</td>
                                                                <td class="hidden-xs">
                                                                    <div class="progress progress-striped progress-sm">
                                                                        <div class="progress-bar progress-bar-success" style="width: 75%;"></div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <!--===================================================--> 
                                                    <!--End Hover Rows--> 
                                                </div>
                                                <div id="demo-lft-tab-2" class="tab-pane fade">
                                                    <div class="pad-btm form-inline">
                                                        <div class="row">
                                                            <div class="col-sm-6 text-xs-center">
                                                                <div class="form-group">
                                                                    <label class="control-label">Status</label>
                                                                    <select id="demo-foo-filter-status" class="form-control">
                                                                        <option value="">Show all</option>
                                                                        <option value="active">Active</option>
                                                                        <option value="disabled">Disabled</option>
                                                                        <option value="suspended">Suspended</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6 text-xs-center text-right">
                                                                <div class="form-group">
                                                                    <input id="demo-foo-search" type="text" placeholder="Search" class="form-control" autocomplete="off">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Foo Table - Filtering -->
                                                    <!--===================================================-->
                                                    <table id="demo-foo-filtering" class="table table-bordered table-hover toggle-circle" data-page-size="7">
                                                        <thead>
                                                            <tr>
                                                                <th data-toggle="true">First Name</th>
                                                                <th class="hidden-xs">Last Name</th>
                                                                <th data-hide="phone, tablet">Job Title</th>
                                                                <th data-hide="phone, tablet" class="hidden-xs">DOB</th>
                                                                <th data-hide="phone, tablet">Status</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>Albert</td>
                                                                <td class="hidden-xs">Desouza</td>
                                                                <td>System Architect</td>
                                                                <td class="hidden-xs">22 Jun 1972</td>
                                                                <td><span class="label label-table label-success">Active</span></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Teresa </td>
                                                                <td class="hidden-xs">L. Doe</td>
                                                                <td>Pre-Sales Support</td>
                                                                <td class="hidden-xs">3 Oct 1981</td>
                                                                <td><span class="label label-table label-dark">Disabled</span></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Veronica </td>
                                                                <td class="hidden-xs">Gusikowski</td>
                                                                <td>Civil Engineer/td> 
                                                                <td class="hidden-xs">19 Apr 1969</td>
                                                                <td><span class="label label-table label-danger">Suspended</span></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Bruce </td>
                                                                <td class="hidden-xs">Rogahn</td>
                                                                <td>CEO</td>
                                                                <td class="hidden-xs">13 Dec 1977</td>
                                                                <td><span class="label label-table label-success">Active</span></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Semantha</td>
                                                                <td class="hidden-xs">Halladay</td>
                                                                <td>Junior Technical Assistant</td>
                                                                <td class="hidden-xs">30 Dec 1991</td>
                                                                <td><span class="label label-table label-danger">Suspended</span></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Stevan </td>
                                                                <td class="hidden-xs">Hickle</td>
                                                                <td>Business Services Sales Representative</td>
                                                                <td class="hidden-xs">17 Oct 1987</td>
                                                                <td><span class="label label-table label-dark">Disabled</span></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Carolina </td>
                                                                <td class="hidden-xs">Hickle</td>
                                                                <td>Business Services Sales Representative</td>
                                                                <td class="hidden-xs">17 Oct 1987</td>
                                                                <td><span class="label label-table label-dark">Disabled</span></td>
                                                            </tr>
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
                                                    <!--===================================================-->
                                                    <!-- End Foo Table - Filtering -->
                                                </div>
                                                <div id="demo-lft-tab-3" class="tab-pane fade">
                                                    <!--Hover Rows--> 
                                                    <!--===================================================-->
                                                    <table class="table table-hover table-vcenter">
                                                        <thead>
                                                            <tr>
                                                                <th class="hidden-xs">&nbsp;</th>
                                                                <th>Profile</th>
                                                                <th>User ID</th>
                                                                <th class="hidden-xs">Date</th>
                                                                <th>Amount</th>
                                                                <th class="hidden-xs">Email Address</th>
                                                                <th>Status</th>
                                                                <th class="hidden-xs">Download</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td class="hidden-xs">
                                                                    <div class="checkbox">
                                                                        <label class="form-checkbox form-icon active">
                                                                        <input type="checkbox">
                                                                        </label>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="media-object center"> <img src="img/av1.png" alt="" class="img-rounded img-sm"> </div>
                                                                </td>
                                                                <td> Semantha Armstrong </td>
                                                                <td class="hidden-xs">3 Jan, 2013</td>
                                                                <td>$239.85</td>
                                                                <td class="hidden-xs">semantha@gmail.com</td>
                                                                <td>
                                                                    <div class="label label-table label-info">Block</div>
                                                                </td>
                                                                <td class="hidden-xs">
                                                                    <!--Split Buttons Dropdown--> 
                                                                    <!--===================================================-->
                                                                    <div class="btn-group btn-group-xs">
                                                                        <button class="btn btn-danger">Download</button>
                                                                        <button class="btn btn-danger dropdown-toggle dropdown-toggle-icon" data-toggle="dropdown" type="button"> 
                                                                        <i class="dropdown-caret fa fa-caret-down"></i> 
                                                                        </button>
                                                                        <ul class="dropdown-menu">
                                                                            <li><a href="#">Action</a> </li>
                                                                            <li><a href="#">Another action</a> </li>
                                                                            <li><a href="#">Something else here</a> </li>
                                                                            <li class="divider"></li>
                                                                            <li><a href="#">Separated link</a> </li>
                                                                        </ul>
                                                                    </div>
                                                                    <!--===================================================-->
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="hidden-xs">
                                                                    <div class="checkbox">
                                                                        <label class="form-checkbox form-icon active">
                                                                        <input type="checkbox">
                                                                        </label>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="media-object center"> <img src="img/av1.png" alt="" class="img-rounded img-sm"> </div>
                                                                </td>
                                                                <td> Jonathan Smith </td>
                                                                <td class="hidden-xs">3 Jan, 2013</td>
                                                                <td>$239.85</td>
                                                                <td class="hidden-xs">jonathan@gmail.com</td>
                                                                <td>
                                                                    <div class="label label-table label-danger">On Hold</div>
                                                                </td>
                                                                <td class="hidden-xs">
                                                                    <!--Split Buttons Dropdown--> 
                                                                    <!--===================================================-->
                                                                    <div class="btn-group btn-group-xs">
                                                                        <button class="btn btn-danger">Download</button>
                                                                        <button class="btn btn-danger dropdown-toggle dropdown-toggle-icon" data-toggle="dropdown" type="button"> 
                                                                        <i class="dropdown-caret fa fa-caret-down"></i> 
                                                                        </button>
                                                                        <ul class="dropdown-menu">
                                                                            <li><a href="#">Action</a> </li>
                                                                            <li><a href="#">Another action</a> </li>
                                                                            <li><a href="#">Something else here</a> </li>
                                                                            <li class="divider"></li>
                                                                            <li><a href="#">Separated link</a> </li>
                                                                        </ul>
                                                                    </div>
                                                                    <!--===================================================-->
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="hidden-xs">
                                                                    <div class="checkbox">
                                                                        <label class="form-checkbox form-icon active">
                                                                        <input type="checkbox">
                                                                        </label>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="media-object center"> <img src="img/av1.png" alt="" class="img-rounded img-sm"> </div>
                                                                </td>
                                                                <td> Jacob Armstrong </td>
                                                                <td class="hidden-xs">3 Jan, 2013</td>
                                                                <td>$1395.85</td>
                                                                <td class="hidden-xs">jacob@gmail.com</td>
                                                                <td>
                                                                    <div class="label label-table label-success">Approved</div>
                                                                </td>
                                                                <td class="hidden-xs">
                                                                    <!--Split Buttons Dropdown--> 
                                                                    <!--===================================================-->
                                                                    <div class="btn-group btn-group-xs">
                                                                        <button class="btn btn-danger">Download</button>
                                                                        <button class="btn btn-danger dropdown-toggle dropdown-toggle-icon" data-toggle="dropdown" type="button"> 
                                                                        <i class="dropdown-caret fa fa-caret-down"></i> 
                                                                        </button>
                                                                        <ul class="dropdown-menu">
                                                                            <li><a href="#">Action</a> </li>
                                                                            <li><a href="#">Another action</a> </li>
                                                                            <li><a href="#">Something else here</a> </li>
                                                                            <li class="divider"></li>
                                                                            <li><a href="#">Separated link</a> </li>
                                                                        </ul>
                                                                    </div>
                                                                    <!--===================================================-->
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="hidden-xs">
                                                                    <div class="checkbox">
                                                                        <label class="form-checkbox form-icon active">
                                                                        <input type="checkbox">
                                                                        </label>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="media-object center"> <img src="img/av1.png" alt="" class="img-rounded img-sm"> </div>
                                                                </td>
                                                                <td> Sandra Smith </td>
                                                                <td class="hidden-xs">3 Jan, 2013</td>
                                                                <td>$125.85</td>
                                                                <td class="hidden-xs">Sandra@gmail.com</td>
                                                                <td>
                                                                    <div class="label label-table label-warning">Pending</div>
                                                                </td>
                                                                <td class="hidden-xs">
                                                                    <!--Split Buttons Dropdown--> 
                                                                    <!--===================================================-->
                                                                    <div class="btn-group btn-group-xs">
                                                                        <button class="btn btn-danger">Download</button>
                                                                        <button class="btn btn-danger dropdown-toggle dropdown-toggle-icon" data-toggle="dropdown" type="button"> 
                                                                        <i class="dropdown-caret fa fa-caret-down"></i> 
                                                                        </button>
                                                                        <ul class="dropdown-menu">
                                                                            <li><a href="#">Action</a> </li>
                                                                            <li><a href="#">Another action</a> </li>
                                                                            <li><a href="#">Something else here</a> </li>
                                                                            <li class="divider"></li>
                                                                            <li><a href="#">Separated link</a> </li>
                                                                        </ul>
                                                                    </div>
                                                                    <!--===================================================-->
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="hidden-xs">
                                                                    <div class="checkbox">
                                                                        <label class="form-checkbox form-icon active">
                                                                        <input type="checkbox">
                                                                        </label>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="media-object center"> <img src="img/av1.png" alt="" class="img-rounded img-sm"> </div>
                                                                </td>
                                                                <td> Sandra </td>
                                                                <td class="hidden-xs">3 Jan, 2013</td>
                                                                <td>$239.85</td>
                                                                <td class="hidden-xs">Sandra@gmail.com</td>
                                                                <td>
                                                                    <div class="label label-table label-warning">Pending</div>
                                                                </td>
                                                                <td class="hidden-xs">
                                                                    <!--Split Buttons Dropdown--> 
                                                                    <!--===================================================-->
                                                                    <div class="btn-group btn-group-xs">
                                                                        <button class="btn btn-danger">Download</button>
                                                                        <button class="btn btn-danger dropdown-toggle dropdown-toggle-icon" data-toggle="dropdown" type="button"> 
                                                                        <i class="dropdown-caret fa fa-caret-down"></i> 
                                                                        </button>
                                                                        <ul class="dropdown-menu">
                                                                            <li><a href="#">Action</a> </li>
                                                                            <li><a href="#">Another action</a> </li>
                                                                            <li><a href="#">Something else here</a> </li>
                                                                            <li class="divider"></li>
                                                                            <li><a href="#">Separated link</a> </li>
                                                                        </ul>
                                                                    </div>
                                                                    <!--===================================================-->
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <!--===================================================--> 
                                                    <!--End Hover Rows--> 
                                                </div>
                                            </div>
                                        </div>
                                        <!--===================================================--> 
                                        <!--End Default Tabs (Left Aligned)--> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--===================================================-->
                    <!--End page content-->
                </div>
                <!--===================================================-->
                <!--END CONTENT CONTAINER-->
            </div>
            <!-- FOOTER -->
            <!--===================================================-->
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
                <!-- Visible when footer positions are static -->
                <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
                <div class="hide-fixed pull-right pad-rgt">Currently v2.2</div>
                <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
                <!-- Remove the class name "show-fixed" and "hide-fixed" to make the content always appears. -->
                <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
                <p class="pad-lft">&#0169; 2015 Your Company</p>
            </footer>
            <!--===================================================-->
            <!-- END FOOTER -->
            <!-- SCROLL TOP BUTTON -->
            <!--===================================================-->
            <button id="scroll-top" class="btn"><i class="fa fa-chevron-up"></i></button>
            <!--===================================================-->
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
        <!--Jquery Nano Scroller js [ REQUIRED ]-->
        <script src="plugins/nanoscrollerjs/jquery.nanoscroller.min.js"></script>
        <!--Metismenu js [ REQUIRED ]-->
        <script src="plugins/metismenu/metismenu.min.js"></script>
        <!--Jasmine Admin [ RECOMMENDED ]-->
        <script src="js/scripts.js"></script>
        <!--Switchery [ OPTIONAL ]-->
        <script src="plugins/switchery/switchery.min.js"></script>
        <!--Jquery Steps [ OPTIONAL ]-->
        <script src="plugins/parsley/parsley.min.js"></script>
        <!--Jquery Steps [ OPTIONAL ]-->
        <script src="plugins/jquery-steps/jquery-steps.min.js"></script>
        <!--Bootstrap Select [ OPTIONAL ]-->
        <script src="plugins/bootstrap-select/bootstrap-select.min.js"></script>
        <!--Bootstrap Wizard [ OPTIONAL ]-->
        <script src="plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        <!--Masked Input [ OPTIONAL ]-->
        <script src="plugins/masked-input/bootstrap-inputmask.min.js"></script>
        <!--Bootstrap Validator [ OPTIONAL ]-->
        <script src="plugins/bootstrap-validator/bootstrapValidator.min.js"></script>
        <!--Flot Chart [ OPTIONAL ]-->
        <script src="plugins/flot-charts/jquery.flot.min.js"></script>
        <script src="plugins/flot-charts/jquery.flot.resize.min.js"></script>
        <script src="plugins/flot-charts/jquery.flot.spline.js"></script>
        <script src="plugins/moment/moment.min.js"></script>
        <script src="plugins/moment-range/moment-range.js"></script>
        <script src="plugins/flot-charts/jquery.flot.tooltip.min.js"></script>
        <!--Flot Order Bars Chart [ OPTIONAL ]-->
        <script src="plugins/flot-charts/jquery.flot.categories.js"></script>
        <!--Morris.js [ OPTIONAL ]-->
        <script src="plugins/morris-js/morris.min.js"></script>
        <script src="plugins/morris-js/raphael-js/raphael.min.js"></script>        
        <!--Easy Pie Chart [ OPTIONAL ]-->
        <script src="plugins/easy-pie-chart/jquery.easypiechart.min.js"></script>
        <!--Fullscreen jQuery [ OPTIONAL ]-->
        <script src="plugins/screenfull/screenfull.js"></script>
        <!--Form Wizard [ SAMPLE ]-->
        <script src="js/demo/index.js"></script>
        <!--Form Wizard [ SAMPLE ]-->
        <script src="js/demo/wizard.js"></script>
        <!--Form Wizard [ SAMPLE ]-->
        <script src="js/demo/form-wizard.js"></script>
    </body>
</html>