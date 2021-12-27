<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<%@ include file="../includes/admin_header.jsp" %>

<title>Q & A 목록</title>
</head>
<div class="boxed">
<div id="content-container">

	<div class="pageheader">
         <h3><i class="fa fa-home"></i> Q&A </h3>
         <div class="breadcrumb-wrapper">
             <span class="label">You are here:</span>
             <ol class="breadcrumb">
                 <li> <a href="/group/"> Home </a> </li>
                 <li class="active"> Q&A </li>
             </ol>
         </div>
     </div>
  
	<form method="get" action="/qna/list" id="searchForm">
		<select name="type">
			<option value="" <c:out value="${pageMaker.cri.type==null?'selected':''}"/>>선택</option>
			<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ?'selected':''}"/> >제목</option>
			<option value="W" <c:out value="${pageMaker.cri.type eq 'W' ?'selected':''}"/>>작성자</option>			
			<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 또는 작성자</option>			
		</select>
		<input type="text" placeholder="검색어 입력" name="keyword"> 
		<input type="hidden" name="pageNum" value='${pageMarker.cri.pageNum}'>
        <input type="hidden" name="amount" value='${pageMarker.cri.amount}'>
              
		<button id="search">검색</button>
	</form>
	
	<table>
		<thead>
			<tr>
			  <th>번호</th>
			  <th>구분</th>
              <th>제목</th>
              <th>작성자</th>
              <th>작성일</th>
              <th>조회수</th>
              <th></th>
              <th></th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="i" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${i.p_group}</td>
				<td><a class='detail' id='detail${i.qno}' href='${i.qno}' data-password='${i.pwd}'>${i.title}</a></td>
				<td id='writer${i.qno}'>${i.writer}</td>
				<td>
					<fmt:formatDate value="${i.up_date}" pattern="yyyy-MM-dd a hh:mm" />
				</td>
				<td style="text-align:center;" id='hit${i.qno}'>${i.hit}</td>
				<td><button data-qno='${i.qno}' class="writeMod" id="writeMod${i.qno}">수정</button></td>
				<td><button onclick="location='/qna/remove?qno=${i.qno}'" id="writeRemove${i.qno}">삭제</button></td>
			</tr>
		</c:forEach>
	</table>
	
	<button class="writeBtn" onclick="location='/qna/write'">글쓰기</button>
	<div>
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
	
	<form id='actionForm' action="/qna/list" method="get" >
		<input type="hidden" name='pageNum' value='${pageMarker.cri.pageNum}'/>
		<input type="hidden" name='amount' value='${pageMarker.cri.amount}'/>
		<input type="hidden" name='type' value='${pageMarker.cri.type}'/>
		<input type="hidden" name='keyword' value='${pageMarker.cri.keyword}'/>
	</form>
</div>
</div>
</div>
</body>
<script type="text/javascript">
	$(document).ready(function () {
		
		/* 로그인 정보 */
		var loginId='${loginId}'
		
		
		$(".paginate_btn a").click(function(e){
			e.preventDefault();
			
			var thisis=$(this).attr("href")
			console.log(thisis)
			
			$("#actionForm").find("input[name='pageNum']").val(thisis)
			$("#actionForm").submit()
		})
		
		$(".detail").on("click",function(e){
			/* private 비밀번호 입력 */
			if($(this).parent().prev().text()=="private"){
				var inputPwd=prompt("비밀번호를 입력해주세요")
				
				if(inputPwd == $(this).data("password")){
					console.log(inputPwd)
					console.log($(this).data("password"))
					$(".detail").attr('href');
					$("#actionForm").append("<input type='hidden' name='qno' value='"+$(this).attr("href")+"'>")
					$("#actionForm").attr("action","/qna/detail")
					$("#actionForm").submit()
				}
				else{
					alert("잘목입력하셨습니다. 다시 입력해주세요.")
					return false
				}
				
			}
			e.preventDefault();
			
			/* 조회수 증가 */
			var qno=$(".detail").attr('href')
			var hit=$("#hit"+qno).text()
			var data={
					qno:qno,
					hit:hit
			}
			console.log(data)
			$.ajax({
				url:"/qna/hitUp",
				type:"post",
				data:JSON.stringify(data),
				contentType:"application/json; charset=utf-8",
				success:function(result){
					//alert("성공")
				},
				error:function(){
					alert("실패")
				}
			}) 
			
			/* 페이지 이동 */
			$(".detail").attr('href');
			$("#actionForm").append("<input type='hidden' name='qno' value='"+$(this).attr("href")+"'>")
			$("#actionForm").attr("action","/qna/detail")
			$("#actionForm").submit()
			
			
			
		})
		
		
		$(".writeMod").click(function(e){
			console.log("수정 버튼 눌림")
			$("#actionForm").append("<input type='hidden' name='qno' value='"+$(this).data("qno")+"'>")
			$("#actionForm").attr("action","/qna/modify")
			$("#actionForm").submit()
		})
		
		/* 검색 */
		$("#searchForm button").click(function(e){
			if(!$("#searchForm").find("option:selected").val()){
				alert("검색 종류를 선택하세요")
				return false
			}
			if(!$("#searchForm").find("input[name='keyword']").val()){
				alert("검색어를 입력하세요")
				return false
			}
			/* 검색시 무조건 1페이지로  */
			$("#searchForm").find("input[name='pageNum']").val("1")
			
			 e.preventDefault();
			$("#searchForm").submit()
			
		})
		
	
		
		
		/* 댓글 갯수, 첨부파일 여부표시 */
		<c:forEach items="${list}" var="i" >
			var qno='${i.qno}'
			
			$.getJSON("/reply/count",{qno:qno},function(cnt){
				
				$("#detail${i.qno}").append('('+cnt+')')
			})
			
			$.getJSON("/upload/count",{qno:qno},function(cnt){
				
				if(cnt>=1){
					$("#detail${i.qno}").append("<img src='/resources/img/attach.png' style=' width:15px; height:15px;'/>")
				}
			})
			if(loginId==$("#writer${i.qno}").text()){
				
				$('#writeMod${i.qno}').show()
				$('#writeRemove${i.qno}').show()
			} else{
				$('#writeMod${i.qno}').hide()
				$('#writeRemove${i.qno}').hide()
			}
			 
		</c:forEach>
		
	})

</script>
</html>