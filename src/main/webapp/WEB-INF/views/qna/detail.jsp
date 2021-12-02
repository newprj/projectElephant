<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<script
  src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.modal {
		display:none;
		position: fixed;
		z-index: 1;
		left: 0;
		top:0;
		width: 100%;
		height:100%;
		overflow:auto;;
		background-color:rgb(0,0,0);
		background-color:rgba(0,0,0,0.4);
	}
	
	.modal-content{
		background-color:#fefefe;
		margin:15% auto;
		padding: 20px;
		 border: 1px solid #888;
            width: 30%;

	}
</style>
<title>Q & A 목록</title>
</head>
<body>
	<h1>Q&A 상세 페이지 입니다.</h1>
	<div>
	<h3>수정,삭제 페이지 만들기</h3>
	<h4>Q & N 게시글</h4>
		<div>
			<label for="p_group">구분</label>
			<input type="p_group" name="pwd"  value="${get.p_group}" readonly="readonly"  /> 
		</div>

		<div>
			<label for="title">제목</label>
			<input type="text" name="title"  value="${get.title}" readonly="readonly" /> 
		</div>
		<div>
			<label for="writer">글쓴이</label>
			<input type="text" name="writer"  value="${get.writer}" readonly="readonly" /> 
		</div>
		<div>
			<label for="q_content">내용</label>
			<textarea name="q_content"  readonly="readonly" >${get.q_content}</textarea>
		</div>
		<button>수정</button>
		<button>삭제</button>
		<button onclick="location='/qna/list'">목록</button>
	</div>
	<div>
	<h4>댓글</h4>
	<button type="button" id="addReply">댓글 달기</button>
	
	</div>
	<div class="modal" id="modal" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close">X</button>
					<h4 class="modal-title">댓글 등록 창 </h4>
				</div>
				<div class="modal-body">
					<div class="modal-group">
						<label>작성자</label>
						<input class="form-control" name="replyer"/>
					</div>
					<div class="modal-group">
						<label>댓글</label><br/>
						<textarea name="reply">댓글</textarea>
						
					</div>
					<div class="modal-group">
						<label>날짜</label>
						<input class="form-control" name="replyDate"/>
					</div>
				</div><br/>
				<div class="modal-footer">
					<button type="button" id="modify">수정</button>
					<button type="button" id="remove">삭제</button>
					<button type="button" id="register">등록</button>
					<button type="button" id="close">닫기</button>
				</div>
				
			</div>
		</div>
	</div>
	
</body>
<script type="text/javascript">
	$(document).ready(function () {
		
		var modal=$(".modal")
		
		var modalReply=modal.find("textarea[name='reply']")
		var modalReplyer=modal.find("input[name='replyer']")
		var modalReplyDate=modal.find("input[name='replyDate']")
	
		var modalModBtn=$("#modify")
		var modalRmvBtn=$("#remove")
		var modalRgBtn=$("#register")
		var modalCloBtn=$("#close")
	
		$("#modal").hide()
		
		$("#addReply").on("click",function(e){
			console.log("등록버튼 눌림")
			modal.find("input").val("")
			modal.find("textarea").val("")
			modalReplyDate.closest('div').hide()
			modal.find("button[id != 'close']").hide()
			modalRgBtn.show()
			
			$(".modal").show()
		})
		
	})
	
</script>
</html>