<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<%@ include file="../includes/admin_header.jsp" %>
			
			
<title>관리자 페이지</title>

</head>
	

<div class="boxed">
	<section id="content-container">
		 <header class="pageheader">
	         <h3><i class="fa fa-home"></i> Calendar </h3>
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
	                 <li class="active"> Calendar </li>
	             </ol>
	         </div>
	     </header>
	     <section id="page-content">
           <div class="row">
               <div class="col-md-4 col-lg-3">
                   <div class="panel">
                       <div class="panel-heading">
                           <h3 class="panel-title">Events</h3>
                       </div>
                       <div class="panel-body">
                           <!-- Draggable Events --> 
                           <!-- ============================================ -->
                           <h4 class="text-thin">Draggable Events</h4>
                           <div id="demo-external-events">
                               <div class="fc-event" data-class="warning">My Event 1</div>
                               <div class="fc-event" data-class="success">My Event 2</div>
                               <div class="fc-event" data-class="mint">My Event 3</div>
                               <div class="fc-event" data-class="purple">My Event 4</div>
                               <div class="fc-event" data-class="warning">My Event 5</div>
                               <div class="fc-event" data-class="success">My Event 6</div>
                               <div class="fc-event" data-class="mint">My Event 7</div>
                               <div class="fc-event" data-class="purple">My Event 8</div>
                               <div class="fc-event">My Event 9</div>
                               <hr>
                               <div>
                                   <label class="form-checkbox form-normal form-primary">
                                   <input type="checkbox" id="drop-remove">
                                   Remove after drop </label>
                               </div>
                           </div>
                           <!-- ============================================ --> 
                       </div>
                   </div>
               </div>
               <div class="col-md-8 col-lg-9">
                   <div class="panel">
                       <div class="panel-body">
                           <!-- Calendar placeholder--> 
                           <!-- ============================================ -->
                           <div id='demo-calendar'></div>
                           <!-- ============================================ --> 
                       </div>
                   </div>
               </div>
           </div>
       </section>
     </section>
</div>
	
	<%@ include file="../includes/admin_footer.jsp" %> 
</div>
	
	
<script type="text/javascript">
	
	$(document).ready(function () {
	
		})

</script>
</html>