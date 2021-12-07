<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-3.6.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class='content'>
<form>
<div>
<label for="title"> 제목 </label>
<input type="text" value="${board.title}" />
</div>
<div>
<label for="group_name"> 그룹 이름 </label>
<input type="text" value="${board.group_name}" />
</div>
<div>
<label for="content"> 내용 </label>
<input type="text" value="${board.content}" />
</div>
<div>
<label for="writer"> 저자 </label>
<input type="text" value="${board.writer}" />
</div>
<div>
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
</div>
</form>
<h5> 댓글 </h5>

<div class="reply">
	<c:forEach items="${replies}" var="reply">
		<p class="reply" data-rno="${reply.rno}"><span > ${reply.reply} </span><span> ${reply.replyer}</span> <p>
	</c:forEach>
</div>
<button class="delete">글삭제</button>
<button class="reply"> 모달을 띄우자  </button>
</div>


<div>
<h5> 이거 모달 </h5>
	<form>
	<div>
		<label for="reply">댓글 내용</label>
		<input type="text" name="reply">
	</div>
	<div>
		<label for="replyer">댓글작성자</label>
		<input type="text" name="replyer">
	</div>
	<input type="text" name="rno">
	<button class='submit'> 전송 </button>
	<button class='modify'> 수정 </button>
	<button class='delete'> 삭제 </button>
	<button type="reset"> 리셋 </button>
	</form>
</div>
<script>


$('.content > .delete').click(function (e) {
    e.preventDefault()
    $.ajax({
      type: 'delete',
      url: '/group/board/${bno}',
      success: () => {
        location.href = "/group/board/${group_name}"
      },
      error: (xhr, status, er) => {
        console.log(status)
      },
    }) //ajax
  }) //delete click
  
	$('.reply').click(function(e){
		// 여기 모달 
	})
	
	const getReplyData = () => ({
		rno : $('input[name="rno"]').val(),
		bno : "${board.bno}",
		reply : $('input[name="reply"]').val(),
		replyer : $('input[name="replyer"]').val()
	})
	$('.submit').click(function(e){
		e.preventDefault()
		let data = getReplyData();
		console.log(data)
		$.ajax({
			type: 'post',
			url : "/group/reply",
			data : JSON.stringify(data),
			contentType: 'application/json; charset=utf-8',
			success : () => {
				let str = "<p class='reply'><span>"+ data.reply + "</span><span>" + data.replyer +"</span> <p>"
				$('div.reply').append(str)
				$('button[type="reset"]').trigger('click')
			},
			error : (xhr, status, er) => console.log(xhr)
		})
	})

	$('p.reply').click(function(e){
		let rno = $(this).data('rno')
		$.getJSON("/group/reply/"+rno,
			(res) => {
				console.log(res)
				$('input[name="rno"]').val(res.rno)
				$('input[name="reply"]').val(res.reply)
				$('input[name="replyer"]').val(res.replyer)
			}		
		)//getJSON
	})//reply click
	
	$('.modify').click(function(e){
		e.preventDefault()
		let data = getReplyData()
		console.log(data)
		let rno =$('input[name="rno"]').val()
		$.ajax({
			type:'put',
			url:'/group/reply/'+rno,
			data : JSON.stringify(data),
			contentType: 'application/json; charset=utf-8',
			success : ()=> console.log('succeed'),
			error : (xhr, status, er) => console.log(xhr)
		})
	})//modify
	$('.delete').click(function(e){
		e.preventDefault()
		let rno = $('input[name="rno"]').val()
		$.ajax({
			type: 'delete',
			url: '/group/reply/'+rno,
			success : () => {
				$('button[type="reset"]').trigger("click")
			},
			error: (xhr, status, er) => console.log(xhr)
		})
	})//delete
	
	
</script>
</body>
</html>