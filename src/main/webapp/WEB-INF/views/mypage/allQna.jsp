<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<%@ include file="../includes/admin_header.jsp" %>


<title>관리자 페이지</title>
</head>


<div class="boxed">
	<div id="content-container">
	
	<div class="pageheader">
        <h3><i class="fa fa-home"></i> Q&A Page </h3>
        <div class="breadcrumb-wrapper">
            <span class="label">You are here:</span>
            <ol class="breadcrumb">
                <li> <a href="/mypage/admin"> Home </a> </li>
                <li class="active"> Q&A Page </li>
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
                                        <h3 class="pad-all bord-btm text-thin">General</h3>
                                        <div id="demo-acc-faq" class="panel-group accordion">
                                        <c:forEach items="${qna}" var="i" varStatus="status"  begin="0" end='9'>
                                            <div class="panel">
                                                <div class="text-semibold pad-hor" >
                                                    <a href="/qna/detail?qno=${i.qno}">
                                                       <h3> <i class="fa fa-bullhorn"></i>${i.title} </h3>
                                                 	</a>
                                                    <p> ${i.writer} <i class="fa fa-clock-o"></i> <fmt:formatDate value="${i.up_date}" pattern="yyyy-MM-dd a hh:mm" /> </p>
                                                </div>
                                            </div>
                                       </c:forEach>
                                      </div>
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