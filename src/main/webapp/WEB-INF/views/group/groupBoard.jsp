<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://kit.fontawesome.com/eab4c34ae3.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>
.pagination{
    		display:flex;
    	}
      .pagenate{
        margin: 4px;
      }
</style>
</head>
<body>
<h1> 그룹 전체보는 페이지 </h1>
<div>
	<select name="sort" class="sort">
		<option value="recent"> 최신순 </option>
		<option value="popular"> 지원자 많은순 </option>
		<option value="viewCnt"> 조회순 </option>
	</select>
	
</div>
 <div>
    	<form class="searchForm" >
    		<select name="type">
    			<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected' : ''}"/>> ====================== </option>
					<option value="N" <c:out value="${pageMaker.cri.type eq 'N'? 'selected' : ''}"/>> 그룹 이름 </option>
					<option value="S" <c:out value="${pageMaker.cri.type eq 'S'? 'selected' : ''}"/>> 주제 </option>
					<option value="NS" <c:out value="${pageMaker.cri.type eq 'NS'? 'selected' : ''}"/>> 그룹 이름 OR 주제 </option>
    		</select>
				<input type="text" name="keyword" />
				<button class="searchForm"> 검색 </button>
    	</form>
    </div>
<c:forEach items ="${group}" var="group">
		<div class="box">
					<span class="group_name"> ${group.group_name} </span>
					<span> ${group.leader}</span>
					<span> ${group.subject }</span>
					<span> <i class="fas fa-eye"></i> ${group.viewCnt} </span>
					<span> 🙋‍♀  ${group.applicantCnt} <i class="far fa-hand-peace"> ${group.joinedCnt}</i>/ ${group.member_number}</span>
				</div>
				<hr/>
</c:forEach>

<div class="pagination">
   		<c:if test="${pageMaker.prev}">
   			<div class="pagenate prev"> <a href="${pageMaker.startPage-1}"> prev </a> </div>
   		</c:if>
   		<c:forEach var="num" begin="${pageMaker.startPage}"
   		end="${pageMaker.endPage}">
   		<div class="pagenate"><a href="${num}">${num}</a></div>
   		</c:forEach>
   		<c:if test="${pageMaker.next }">
   			<div class="pagenate next"><a href="${pageMaker.endPage+1}"> next </a></div>
   		</c:if>
   	</div>
</body>

<script>

let pageNum = "${cri.pageNum}"
let amount = "${cri.amount}" 

$(".group_name").click(function (e) {
	const group_name = e.target.innerText;
	location.href = `/group/gather/\${group_name}`;
});


$('.pagenate a').click(function(e){
	e.preventDefault()
	let type = "${cri.type}"
	let keyword =  "${cri.keyword}"
	
	let pageNum =$(this).attr('href')
	let url = type && keyword ? `/group/main/list/\${pageNum}/\${amount}/\${type}/\${keyword}` 
			:  `/group/main/list/\${pageNum}/\${amount}`
	 
	location.href = url 

})// a click


let searchForm = $('form.searchForm')
$('button.searchForm').click((e) => {
	e.preventDefault()
	let type = searchForm.find("option:selected").val()
	let keyword =  $('input[name="keyword"]').val()
	if(!type){
		alert("옵션 종류를 선택하세요 ") 
	}else if (!keyword){
		alert("검색 키워드를 입력하세요 ")
	}else {
		let url = `/group/main/list/\${pageNum}/\${amount}/\${type}/\${keyword}`
		location.href = url 
	}

})// search button click
</script>
</html>