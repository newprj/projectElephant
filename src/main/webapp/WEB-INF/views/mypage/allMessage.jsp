<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/admin_header.jsp" %>
<title>관리자 페이지</title>

</head>
<div class="boxed">
<div id="content-container">
	<header class="pageheader">
      <h3><i class="fa fa-home"></i> Message </h3>
      <div class="breadcrumb-wrapper">
          <span class="label">You are here:</span>
          <ol class="breadcrumb">
              <li> <a href="/mypage/allMessage"> Home </a> </li>
              <li class="active"> Message </li>
          </ol>
      </div>
  </header>
  
  <div id="page-content">
        <div class="row">
            <div class="col-xs-12 col-md-3 col-lg-3  hidden-xs">
                <div class="pad-all">
                    <a href="#/mail/compose" class="btn btn-danger btn-block btn-md"> <span class="fa fa-edit"></span> COMPOSE</a>
                </div>
                <div class="mail-categories">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <a href="javascript:;"> <i class="fa fa-inbox"></i> 받은 메일 <span class="label label-info pull-right">6</span> </a>
                        </li>
                        <li class="list-group-item">
                            <a href="javascript:;"> <i class="fa fa-envelope-o"></i> 보낸 메일 </a>
                        </li>
                        <li class="list-group-item">
                            <a href="javascript:;"> <i class="fa fa-star"></i> Starred <span class="label label-danger pull-right">3</span> </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="panel">
                    <div class="btn-toolbar pad-all">
                        <div class="btn-group">
                            <button class="btn btn-sm btn-default" type="button"><i class="fa fa-refresh"></i></button>
                        </div>
                        <div class="btn-group">
                            <button class="btn btn-sm btn-default" type="button"><i class="fa fa-trash-o"></i></button>
                        </div>
                        <div class="btn-group pull-right">
                            <button class="btn btn-sm btn-default" type="button"><i class="fa fa-chevron-left"></i></button>
                            <button class="btn btn-sm btn-default" type="button"><i class="fa fa-chevron-right"></i></button>
                        </div>
                        <h6 class="pull-right"> Showing 1 - 15 of 2368 </h6>
                    </div>
                    <div class="panel-body">
                        <!--Default Tabs (Left Aligned)-->
                        <!--===================================================-->
                        <div class="tab-base">
                            <!--Nav Tabs-->
                            <ul class="nav nav-tabs">
                                <li class="active"> <a data-toggle="tab" href="#demo-lft-tab-1">Primary <span class="badge badge-purple">27</span></a> </li>
                                <li> <a data-toggle="tab" href="#demo-lft-tab-2">Social</a> </li>
                                <li> <a data-toggle="tab" href="#demo-lft-tab-3">Promotions</a> </li>
                                <li>
                                    <a data-toggle="tab" href="#demo-lft-tab-4"> <i class="fa fa-plus"></i> </a>
                                </li>
                            </ul>
                            <!--Tabs Content-->
                            <div class="tab-content">
                                <div id="demo-lft-tab-1" class="tab-pane fade active in">
                                    <table class="table table-responsive">
                                        <tr class="mail-unread">
                                            <td>
                                                <label class="form-checkbox form-icon">
                                                <input type="checkbox">
                                                </label>
                                            </td>
                                            <td class="hidden-xs">
                                                <div class="inbox-star"><span class="fa fa-star-o"></span></div>
                                            </td>
                                            <td class="hidden-xs"><span class="label label-success"> Primary </span></td>
                                            <td>Jane Swift </td>
                                            <td>Nice to meet you</td>
                                            <td class="hidden-xs"><i class="fa fa-paperclip"></i></td>
                                            <td>3/11/14 2:30 PM</td>
                                        </tr>
                                    </table>
                                </div>
                                <div id="demo-lft-tab-4" class="tab-pane fade">
                                    <h4 class="text-thin">Fourth Tab Content</h4>
                                    <p>Add New Mail Tab Here.. Pretty cool!</p>
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
  </div>
</div>               
<%@ include file="../includes/admin_footer.jsp" %>


<script type="text/javascript">
	
	$(document).ready(function () {
	})

</script>
</html>
