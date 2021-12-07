<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="//code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>

<form>
<div>
<label for="title"> 제목 </label>
<input name='title' type="text" value="${board.title}" />
</div>
<div>
<label for="group_name"> 그룹 이름 </label>
<input name='group_name' type="text" value="${board.group_name}" />
</div>
<div>
<label for="content"> 내용 </label>
<textarea name="content" type="text"  >
${board.content}
</textarea>
</div>
<div>
<label for="writer"> 저자 </label>
<input name="writer" type="text" value="${board.writer}" />
</div>
<div class="uploadResult"> 
<h5> 첨부파일 </h5>
	<ul>
	<c:forEach items="${files}" var="file">
		<li>
		   <span> ${file.fileName} </span>
		</li>
	</c:forEach>
	</ul>
</div>
<div>
	<button class='modify'> 수정 </button>
	<button class='delete'> 삭제 </button>
	<button class="go_board"> 목록</button>
</div>
</form>
<script>
$(document).ready(function(e){
	

const getForm = () => ({
 	bno : '${cri.bno}',
 	content:  $('textarea[name="content"]').val(),
   group_name : $('input[name="group_name"]').val(),
   writer : $('input[name="writer"]').val(),
   title :  $('input[name="title"]').val(),
  })

$('.modify').click(function (e) {
  e.preventDefault()
  
  let modified = getForm();
  console.log(modified)
  $.ajax({
    type: 'PUT',
    url: '/group/board/${cri.bno}',
    data: JSON.stringify(modified),
    contentType: 'application/json; charset=utf-8',
    success: () => 
  		location.href = "/group/board/${cri.group_name}/${cri.bno}/${cri.pageNum}/${cri.amount}",
    error: (xhr, status, er) => {
      console.log(status)
    }, //error
  }) //ajax
}) // modify c

$('.delete').click(function (e) {
    e.preventDefault()
    $.ajax({
      type: 'delete',
      url: '/group/board/${cri.bno}',
      success: () => {
        location.href = "/group/board/${cri.group_name}/${cri.pageNum}/${cri.amount}"
      },
      error: (xhr, status, er) => {
        console.log(status)
      },
    }) //ajax
  }) //delete click
  
  
  $('.go_board').click((e)=>{
	  e.preventDefault()
	  location.href = "/group/board/${cri.group_name}/${cri.pageNum}/${cri.amount}"
  })
  
})

</script>

</body>
</html>