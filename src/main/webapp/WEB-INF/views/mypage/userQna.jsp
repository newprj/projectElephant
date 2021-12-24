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
                <li> <a href="/mypage/user"> Home </a> </li>
                <li class="active"> Q&A Page </li>
            </ol>
        </div>
    </div>
	 	<div id="page-content">
           <div class="row">
              <div class="col-lg-9">
                  
                  <div class="panel">
                      <div class="panel-body">
                          <h3 class="pad-all bord-btm text-thin">내가 등록한 Q&A</h3>
                          <div id="demo-acc-faq" class="panel-group accordion">
                          <c:forEach items="${myqna}" var="i" varStatus="status" >
                              <div class="panel">
                                  <div class="text-semibold pad-hor" >
                                      <a href="/qna/detail?qno=${i.qno}">
                                         <h3> <i class="fa fa-bullhorn" ></i > ${i.title} </h3>
                                   	</a>
                                      <p> <i class="fa fa-clock-o" ></i > <fmt:formatDate value="${i.up_date}" pattern="yyyy-MM-dd a hh:mm" /> <i class="fa fa-eye fa-lg" ></i > ${i.hit}</p>
                                      	
                                  </div>
                              </div>
                         </c:forEach>
                        </div>
                        <div style="text-align:center;">
							<ul class="pagination">
								<c:if test="${pageMarker.prev}">
							<li class="paginate_btn previous"><a href="${pageMarker.startPage -1}">이전</a>
							</li>
							</c:if>
							
							<c:forEach var="num" begin="${pageMarker.startPage}" end="${pageMarker.endPage}">
							<li class="paginate_btn ${pageMarker.cri.pageNum==num ? "active": "" }">
							<a href="${num}">${num}</a>
							</li>
							</c:forEach>
							
							<c:if test="${pageMarker.next}">
							<li class="paginate_btn next"><a href="${pageMarker.endPage +1}">다음</a></li>
							</c:if>
								</ul>
							</div>
                          </div>
                           
                        <div class="panel-body">
                            <h3 class="pad-all bord-btm text-thin">내가 등록한 댓글</h3>
                            <div id="demo-acc-faq" class="panel-group accordion">
                            <c:forEach items="${qnaReply}" var="i" varStatus="status"  >
	                           <div class="panel">
	                               <div class="text-semibold pad-hor" >
	                                   <a href="/qna/detail?qno=${i.qno}">
	                                      <h3> <i class="fa fa-comments" ></i > ${i.r_content} </h3>
	                                	</a>
	                                   <p> <i class="fa fa-clock-o"></i> <fmt:formatDate value="${i.r_reg_date}" pattern="yyyy-MM-dd a hh:mm" /> </p>
	                                   	
	                               </div>
	                           </div>
                      		</c:forEach>
                        </div>
                        
                        <div style="text-align:center;">
							<ul class="pagination">
								<c:if test="${replyPage.prev}">
							<li class="paginate_Rbtn previous"><a href="${replyPage.startPage -1}">이전</a>
							</li>
							</c:if>
							
							<c:forEach var="num" begin="${replyPage.startPage}" end="${replyPage.endPage}">
							<li class="paginate_Rbtn ${replyPage.cri.pageNum==num ? "active": "" }">
							<a href="${num}">${num}</a>
							</li>
							</c:forEach>
							
							<c:if test="${replyPage.next}">
							<li class="paginate_Rbtn next"><a href="${replyPage.endPage +1}">다음</a></li>
							</c:if>
								</ul>
							</div>
                         </div>
                           
                           
                       </div>
                   </div>
             <div class="col-lg-3">
               <div class="panel">
                  <div class="panel-heading">
                      <div class="panel-title">
                          <i class="fa fa-question-circle fa-lg fa-fw text-primary"></i> Quick Q&A
                      </div>
                  </div>
                  <form class="panel-body">
                      <p>Q&A를 등록하세요.</p>
                      <div class="form-group">
                          <label>Title</label>
                          <input type="text" nema="title" class="form-control" >
                      </div>
                      <div class="form-group">
                          <label>Content</label>
                          <textarea class="form-control" name="contnent" placeholder="Your message" rows="3"></textarea>
                      </div>
                      <input type="hidden" nema="p_select" class="form-control" value="public"/>
                      <input type="hidden" nema="writer" class="form-control" value="${user.user_id}" />
                      <button class="btn btn-success pull-right" id="sendBtn"><span class="fa fa-send"></span> Send</button>
                  </form>
                </div> 	
         	
                  	
                  </div>
              </div>
              

			<form id='actionForm' action="/mypage/userQna" method="get" >
				<input type="hidden" name='pageNum' value='${pageMarker.cri.pageNum}'/>
				<input type="hidden" name='amount' value='${pageMarker.cri.amount}'/>
				<input type="hidden" name='type' value='${pageMarker.cri.type}'/>
				<input type="hidden" name='keyword' value='${pageMarker.cri.keyword}'/>
			</form>
            
          
         </div>
        </div>
<%@ include file="../includes/admin_footer.jsp" %> 

<script type="text/javascript">
	
	$(document).ready(function () {
		
		/* Q&A 페이지이동 */
		$(".paginate_btn a").click(function(e){
			e.preventDefault();
			
			var thisis=$(this).attr("href")
			console.log(thisis)
			
			$("#actionForm").find("input[name='pageNum']").val(thisis)
			$("#actionForm").find("input[name='amount']").val('${pageMarker.cri.amount}')
			$("#actionForm").find("input[name='type']").val('${pageMarker.cri.type}')
			$("#actionForm").find("input[name='keyword']").val('${pageMarker.cri.keyword}')
			$("#actionForm").submit()
		})
		/* 댓글 페이지이동 */
		$(".paginate_Rbtn a").click(function(e){
			e.preventDefault();
			
			var thisis=$(this).attr("href")
			console.log(thisis)
			
			$("#actionForm").find("input[name='pageNum']").val(thisis)
			$("#actionForm").find("input[name='amount']").val('${replyPage.cri.amount}')
			$("#actionForm").find("input[name='type']").val('${replyPage.cri.type}')
			$("#actionForm").find("input[name='keyword']").val('${replyPage.cri.keyword}')
			$("#actionForm").submit()
		})
		

		
			var today=new Date()
		$("#sendBtn").on("click",function(e){
			e.preventDefault();
			console.log("등록하기")
						
			$("form").append("<input type='hidden' name='reg_date' pattern ='yy/MM/dd hh:mm' value='"+today+"'>");
			$("form").append("<input type='hidden' name='up_date' pattern ='yy/MM/dd hh:mm' value='"+today+"'>");
			$("form").submit() 
			
		})
		
	})

	</script>

</html>