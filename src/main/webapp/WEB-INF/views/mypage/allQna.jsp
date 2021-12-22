<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<%@ include file="../includes/admin_header.jsp" %>


<title>관리자 페이지</title>
</head>


<div class="boxed">
	<div id="content-container">
	
	<div class="pageheader">
        <h3><i class="fa fa-home"></i> FAQ Page </h3>
        <div class="breadcrumb-wrapper">
            <span class="label">You are here:</span>
            <ol class="breadcrumb">
                <li> <a href="#"> Home </a> </li>
                <li class="active"> FAQ Page </li>
            </ol>
        </div>
    </div>
	 	<div id="page-content">
                        <div class="row">
                            <div class="col-lg-9">
                                <div class="well">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search...">
                                        <div class="input-group-btn">
                                            <button class="btn btn-info btn-md" type="button">Search</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel">
                                    <div class="panel-body">
                                        <!-- GENERAL -->
                                        <!--===================================================-->
                                        <h3 class="pad-all bord-btm text-thin">General</h3>
                                        <div id="demo-acc-faq" class="panel-group accordion">
                                            <div class="panel">
                                                <!-- Question -->
                                                <div class="text-semibold pad-hor">
                                                    <a href="#demo-acc-faq1" data-toggle="collapse" data-parent="#demo-acc-faq">
                                                       <h3> <i class="fa fa-bullhorn"></i> How do I reset the admin password?</h3>
                                                    </a>
                                                    <p> Added by Alex Smith <i class="fa fa-clock-o"></i> Today 2:40 pm - 24.06.2014 </p>
                                                </div>
                                                <!-- Answer -->
                                                <div id="demo-acc-faq1" class="collapse in">
                                                    <div class="pad-all">
                                                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel">
                                                <!-- Question -->
                                                <div class="text-semibold pad-hor">
                                                    <a href="#demo-acc-faq2" data-toggle="collapse" data-parent="#demo-acc-faq"> 
                                                      <h3><i class="fa fa-bullhorn"></i> How do I upgrade to the latest servicepack/hotfix/patch? </h3>
                                                    </a>
                                                    <p class="media-heading"> <small>Added by Alex Smith <i class="fa fa-clock-o"></i> Today 2:40 pm - 24.06.2014</small> </p>
                                                </div>
                                                <!-- Answer -->
                                                <div id="demo-acc-faq2" class="collapse">
                                                    <div class="pad-all">
                                                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel">
                                                <!-- Question -->
                                                <div class="text-semibold pad-hor">
                                                    <a href="#demo-acc-faq3" data-toggle="collapse" data-parent="#demo-acc-faq">
                                                      <h3><i class="fa fa-bullhorn"></i> How do my customers access the customer portal?</h3>
                                                    </a>
                                                    <p class="media-heading"> <small>Added by Alex Smith <i class="fa fa-clock-o"></i> Today 2:40 pm - 24.06.2014</small> </p>
                                                </div>
                                                <!-- Answer -->
                                                <div id="demo-acc-faq3" class="collapse">
                                                    <div class="pad-all">
                                                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--===================================================-->
                                        <!-- ACCOUNT -->
                                        <!--===================================================-->
                                        <h3 class="pad-all bord-btm text-thin">Account</h3>
                                        <div id="demo-acc" class="panel-group accordion">
                                            <div class="panel">
                                                <!-- Question -->
                                                <div class="text-semibold pad-hor">
                                                    <a href="#demo-acc-faq4" data-toggle="collapse" data-parent="#demo-acc">
                                                      <h3> <i class="fa fa-bullhorn"></i> How can i change my hosting plan ? </h3>
                                                    </a>
                                                    <p class="media-heading"> <small>Added by Alex Smith <i class="fa fa-clock-o"></i> Today 2:40 pm - 24.06.2014</small> </p>
                                                </div>
                                                <!-- Answer -->
                                                <div id="demo-acc-faq4" class="collapse">
                                                    <div class="pad-all">
                                                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel">
                                                <!-- Question -->
                                                <div class="text-semibold pad-hor">
                                                    <a href="#demo-acc-faq5" data-toggle="collapse" data-parent="#demo-acc"> 
                                                      <h3> <i class="fa fa-bullhorn"></i> How do I hide the customer portal page? </h3>
                                                    </a>
                                                    <p class="media-heading"> <small>Added by Alex Smith <i class="fa fa-clock-o"></i> Today 2:40 pm - 24.06.2014</small> </p>
                                                </div>
                                                <!-- Answer -->
                                                <div id="demo-acc-faq5" class="collapse">
                                                    <div class="pad-all">
                                                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--===================================================-->
                                        <!-- TECHNICAL -->
                                        <!--===================================================-->
                                        <h3 class="pad-all bord-btm text-thin">Technical</h3>
                                        <div id="demo-acc-technical" class="panel-group accordion">
                                            <div class="panel">
                                                <!-- Question -->
                                                <div class="text-semibold pad-hor">
                                                    <a href="#demo-acc-faq6" data-toggle="collapse" data-parent="#demo-acc-technical">
                                                      <h3><i class="fa fa-bullhorn"></i> How can I bind Support Center to a single IP Address? </h3> 
                                                    </a>
                                                    <p class="media-heading"> <small>Added by Alex Smith <i class="fa fa-clock-o"></i> Today 2:40 pm - 24.06.2014</small> </p>
                                                </div>
                                                <!-- Answer -->
                                                <div id="demo-acc-faq6" class="collapse">
                                                    <div class="pad-all">
                                                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel">
                                                <!-- Question -->
                                                <div class="text-semibold pad-hor">
                                                    <a href="#demo-acc-faq7" data-toggle="collapse" data-parent="#demo-acc-technical">
                                                      <h3> <i class="fa fa-bullhorn"></i> How do I change the Web Server Port? </h3>
                                                    </a>
                                                    <p class="media-heading"> <small>Added by Alex Smith <i class="fa fa-clock-o"></i> Today 2:40 pm - 24.06.2014</small> </p>
                                                </div>
                                                <!-- Answer -->
                                                <div id="demo-acc-faq7" class="collapse">
                                                    <div class="pad-all">
                                                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel">
                                                <!-- Question -->
                                                <div class="text-semibold pad-hor">
                                                    <a href="#demo-acc-faq8" data-toggle="collapse" data-parent="#demo-acc-faq">
                                                      <h3><i class="fa fa-bullhorn"></i> How do I change the database?</h3>
                                                    </a>
                                                    <p class="media-heading"> <small>Added by Alex Smith <i class="fa fa-clock-o"></i> Today 2:40 pm - 24.06.2014</small> </p>
                                                </div>
                                                <!-- Answer -->
                                                <div id="demo-acc-faq8" class="collapse">
                                                    <div class="pad-all">
                                                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--===================================================-->
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <!-- Tips Widget -->
                                <!--===================================================-->
                                <div class="mar-btm">
                                    <button type="button" class="btn btn-default btn-block pad-ver">Ask Question</button>
                                    <button type="button" class="btn btn-default btn-block pad-ver">Contact Us</button>
                                </div>
                                <!--===================================================-->
                                <!-- Tips Widget -->
                                <!--===================================================-->
                                <div class="panel">
                                    <div class="panel-heading">
                                        <div class="panel-title">
                                            <i class="fa fa-life-ring"></i> Your Latest Question
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <ul class="list-unstyled">
                                            <li>Dept: <strong class="text-dark"> Technical Support</strong> </li>
                                            <li>Posted: 1 Day ago</li>
                                            <li>Status: <strong class="text-primary">Open</strong> </li>
                                        </ul>
                                        <ul class="list-unstyled pt-10">
                                            <li>Dept: <strong class="text-dark"> Billing</strong> </li>
                                            <li>Posted: 1 week ago</li>
                                            <li>Status: <strong class="text-primary">Open</strong> </li>
                                        </ul>
                                        <ul class="list-unstyled pt-10">
                                            <li>Dept: <strong class="text-dark"> Billing</strong> </li>
                                            <li>Posted: 1 week ago</li>
                                            <li>Status: <strong class="text-primary">Open</strong> </li>
                                        </ul>
                                    </div>
                                    <div class="panel-footer text-muted pad-10">
                                        <ul class="list-unstyled">
                                            <li>Dept: <strong class="text-dark"> Sales </strong> </li>
                                            <li>Posted: 1 week ago</li>
                                            <li>Status: <strong class="text-alert">Closed</strong> </li>
                                        </ul>
                                    </div>
                                </div>
                                <!--===================================================-->
                                <!-- Contact us widget -->
                                <!--===================================================-->
                                <div class="panel">
                                    <div class="panel-heading">
                                        <div class="panel-title">
                                            <i class="fa fa-question-circle fa-lg fa-fw text-primary"></i> Can't find the answer?
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <p>Feel free to contact us for any issues you might have with our products.</p>
                                        <div class="form-group">
                                            <label>E-mail</label>
                                            <input type="email" class="form-control" placeholder="youremail@domain.com">
                                        </div>
                                        <div class="form-group">
                                            <label>Subject</label>
                                            <input type="email" class="form-control" placeholder="Message subject">
                                        </div>
                                        <div class="form-group">
                                            <label>Message</label>
                                            <textarea class="form-control" placeholder="Your message" rows="3"></textarea>
                                        </div>
                                        <button class="btn btn-default"><span class="fa fa-paperclip"></span> Add attachment</button>
                                        <button class="btn btn-success pull-right"><span class="fa fa-send"></span> Send</button>
                                    </div>
                                </div>
                                <!--===================================================-->
                            </div>
                        </div>
                    </div>
                    <!--===================================================-->
                    <!--End page content-->
                </div>
                <!--===================================================-->
                <!--END CONTENT CONTAINER-->
            </div>


<%@ include file="../includes/admin_footer.jsp" %> 

<script type="text/javascript">
	
	$(document).ready(function () {
	})

	</script>

</html>