<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<%@ include file="../includes/admin_header.jsp" %>
			
			
<title>관리자 페이지</title>

</head>
	<div class="boxed">
		<div id="content-container">
			<div class="pageheader">
		         <h3><i class="fa fa-home"></i> Group </h3>
		         <div class="breadcrumb-wrapper">
		             <span class="label">You are here:</span>
		             <ol class="breadcrumb">
		                 <li> <a href="/mypage/user"> Home </a> </li>
		                 <li class="active"> Group </li>
		             </ol>
		         </div>
		     </div>
		     <div id="page-content">
				<div class="panel">
				     <div class="panel-heading">
				         <h3 class="panel-title">내가 가입한 그룹</h3>
				     </div>
				     <div class="panel-body">
			              <table id="demo-dt-basic" class="table table-striped table-bordered">
			                  <thead>
			                      <tr>
			                          <th>Group Name</th>
			                          <th>Leader</th>
			                          <th class="min-tablet">subject</th>
			                          <th class="min-tablet">Member number</th>
			                          <th class="min-desktop">Creation date</th>
			                          <th class="min-desktop">authorized</th>
			                      </tr>
			                  </thead>
			                  <tbody>
			                  <c:forEach items="${allGroup}" var="i" varStatus="status" >
			                      <tr>
			                          <td > <a href='/group/gather/${i.group_name}'>${i.group_name}</a></td>
			                          <td>${i.leader}</td>
			                          <td>${i.subject}</td>
			                          <td>${i.member_number}</td>
			                          <td><fmt:formatDate value="${i.regdate}" pattern="yyyy-MM-dd a hh:mm" /> </td>
			                          <td>${i.authorized}</td>
			                      </tr>
			                  </c:forEach>
			                  </tbody>
			              </table>
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
			    <div class="panel">
				     <div class="panel-heading">
				         <h3 class="panel-title">내가 생성한 그룹</h3>
				     </div>
				     <div class="panel-body">
			              <table id="demo-dt-basic" class="table table-striped table-bordered">
			                  <thead>
			                      <tr>
			                          <th>Group Name</th>
			                          <th>Leader</th>
			                          <th class="min-desktop">subject</th>
			                          <th class="min-tablet">Member number</th>
			                          <th class="min-tablet">Creation date</th>
			                          <th class="min-desktop">authorized</th>
			                      </tr>
			                  </thead>
			                  <tbody>
			                  <c:forEach items="${myGroup}" var="i" varStatus="status" >
			                      <tr>
			                          <td > <a href='/group/gather/${i.group_name}'>${i.group_name}</a></td>
			                          <td>${i.leader}</td>
			                          <td>${i.subject}</td>
			                          <td>${i.member_number}</td>
			                          <td><fmt:formatDate value="${i.regdate}" pattern="yyyy-MM-dd a hh:mm" /> </td>
			                          <td>${i.authorized}</td>
			                      </tr>
			                  </c:forEach>
			                  </tbody>
			              </table>
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
			    <div class="panel">
		          <div class="panel-heading">
		              <h3 class="panel-title">게시물</h3>
		          </div>
		          <div class="panel-body">
		              <table id="demo-dt-selection" class="table table-striped table-bordered">
		                  <thead>
		                      <tr>
		                          <th>Group Name</th>
		                          <th>title</th>
		                          <th class="min-tablet">subject</th>
		                          <th class="min-tablet">notice </th>
		                          <th class="min-desktop">creation date</th>
		                      </tr>
			                  </thead>
			                  <tbody>
				                  <c:forEach items="${myBoard}" var="i" varStatus="status" >
				                      <tr>
				                          <td > <a href='/getBoard/${i.bno}'>${i.group_name}</a></td>
				                          <td>${i.title}</td>
				                          <td>${i.subject}</td>
				                          <td>${i.notice}</td>
				                          <td><fmt:formatDate value="${i.regdate}" pattern="yyyy-MM-dd a hh:mm" /> </td>
				                         
				                      </tr>
				                  </c:forEach>
			                  </tbody>
			              </table>
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
			      
			   <div class="row">
               <div class="col-sm-6">   
		      <div class="panel">
		          <div class="panel-heading">
		              <h3 class="panel-title">댓글</h3>
		          </div>
		          <div class="panel-body">
		              <table id="demo-dt-selection" class="table table-striped table-bordered">
		                  <thead>
		                      <tr>
		                          <th>title</th>
		                          <th class="min-desktop">Date</th>
		                      </tr>
			                  </thead>
			                  <tbody>
				                  <c:forEach items="${boardReply}" var="i" varStatus="status" >
				                      <tr>
				                          <td>${i.title}</td>
				                          <td><fmt:formatDate value="${i.regdate}" pattern="yyyy-MM-dd a hh:mm" /> </td>
				                         
				                      </tr>
				                  </c:forEach>
			                  </tbody>
			              </table>
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
			</div>
			</div>
				<form id='actionForm' action="/mypage/allGroup" method="get" >
					<input type="hidden" name='pageNum' value='${pageMarker.cri.pageNum}'/>
					<input type="hidden" name='amount' value='${pageMarker.cri.amount}'/>
					<input type="hidden" name='type' value='${pageMarker.cri.type}'/>
					<input type="hidden" name='keyword' value='${pageMarker.cri.keyword}'/>
				</form>
			</div>
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
		
	})

</script>
</html>