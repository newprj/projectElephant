<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/admin_header.jsp" %>
<title>관리자 페이지</title>

</head>
<div class="boxed">
<div id="content-container">
	<header class="pageheader">
          <h3><i class="fa fa-home"></i> Mail Compose </h3>
          <div class="breadcrumb-wrapper">
              <span class="label">You are here:</span>
              <ol class="breadcrumb">
                  <c:choose>
			          <c:when test="${user.user_id == 'admin'}">
			              <li> <a href="/mypage/admin"> Home </a> </li>
			          </c:when>
			          <c:otherwise>
			           	<li> <a href="/mypage/user"> Home </a> </li>
			          </c:otherwise>
            	</c:choose>
                  <li class="active"> Mail Compose </li>
              </ol>
          </div>
      </header>
  
  <div id="page-content">
  
        <div class="row">
            <div class="col-xs-12 col-md-3 col-lg-3">
                 <div class="mail-categories">
                       <ul class="list-group">
                           <li class="list-group-item">
                               <a href="/mypage/allMessage"> <i class="fa fa-inbox"></i> 받은 메일 <span class="label label-info pull-right">6</span> </a>
                           </li>
                           <li class="list-group-item">
                               <a href="javascript:;"> <i class="fa fa-envelope-o"></i> 보낸메일 </a>
                           </li>
                           <li class="list-group-item">
                               <a href="javascript:;"> <i class="fa fa-star"></i> Starred <span class="label label-danger pull-right">3</span> </a>
                           </li>
                       </ul>
                   </div>
            </div>
            <div class="col-xs-12 col-md-9 col-lg-9">
            	<div class="panel">
                	<div class="panel-body">
	                    <form class="form-horizontal form-bordered" method="post">
	                        <div class="form-group nb">
	                            <label class="control-label col-md-1">To: </label>
	                            <div class="col-md-11">
	                            	<input type="text"  class="form-control" name="recipient">
	                                
	                            </div>
	                        </div>
	                       
	                        <div class="form-group nb">
	                            <label class="control-label col-md-1">Subject: </label>
	                            <div class="col-md-11">
	                                <textarea class="form-control" name="content"></textarea>
	                            </div>
	                        </div>
	                        <input type="hidden"  class="form-control" name="writer">
	                        <input type="hidden"  class="form-control" name="reg_date">
	                        
	                        <div id="demo-summernote"></div>
	                        <div class="pad-top text-right"> 
	                            <button class="btn btn-danger" id="sendBtn"><i class="fa fa-send"></i> Send </button>
	                            <button class="btn btn-default"><i class="fa fa-trash-o"></i> Discard </button>
	                        </div>
	                    </form>
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
		/* 페이지이동 */
		$(".pull-right button").click(function(e){
			e.preventDefault();
			
			var thisis=$(this).attr("href")
			console.log(thisis)
			
			$("#actionForm").find("input[name='pageNum']").val(thisis)
			$("#actionForm").submit()
		})
		
		/* 쪽지 보내기 */
		var today=new Date()
		var writer=$(".form-bordered").find("input[name='writer']")
		var reg_date=$(".form-bordered").find("input[name='reg_date']")
		$("#sendBtn").on("click",function(e){
			e.preventDefault();
			writer.val('${user}')
			reg_date.val(today)
			$("form").submit()
		})
		
	})

</script>
</html>
