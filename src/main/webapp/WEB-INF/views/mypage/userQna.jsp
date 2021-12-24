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
                                <form class="well">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search..." name="keyword" >
                                        <input type="hidden" name="pageNum" value='${pageMarker.cri.pageNum}'>
        								<input type="hidden" name="amount" value='${pageMarker.cri.amount}'>
        								<input type="hidden" name="type"  type="text" >
                                        <div class="input-group-btn">
                                            <button class="btn btn-info btn-md" type="button">Search</button>
                                        </div>
                                    </div>
                                </form>
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
                                                    <p> ${i.writer} <i class="fa fa-clock-o"></i> <fmt:formatDate value="${i.up_date}" pattern="yyyy-MM-dd a hh:mm" /> <i class="fa fa-eye fa-lg"></i>${i.hit}</p>
                                                    	
                                                </div>
                                            </div>
                                       </c:forEach>
                                      </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
					
					<form id='actionForm' action="/mypage/allQna" method="get" >
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
		
		/* 페이지이동 */
		$(".paginate_btn a").click(function(e){
			e.preventDefault();
			
			var thisis=$(this).attr("href")
			console.log(thisis)
			
			$("#actionForm").find("input[name='pageNum']").val(thisis)
			$("#actionForm").submit()
		})
		
		/* 검색 */
		$(".btn-md").on("click",function(e){
			console.log("검색 눌림")
			e.preventDefault();
			$(".well").find("input[name='pageNum']").val("1")
			$(".well").find("input[name='type']").val("T")
			$(".well").submit()
			
		})
	})

	</script>

</html>