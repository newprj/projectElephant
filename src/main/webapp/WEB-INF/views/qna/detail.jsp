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
		overflow:auto;
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
	<form>
		<h3>댓글 수정,삭제 페이지 만들기 / 로그인 되면 내가 작성한 댓글만 수정,삭제 버튼 보이도록</h3>
		<h4>Q & N 게시글</h4>
		<div>
			<label for="qno">게시물 번호</label>
			<input type="text" name="qno"  value="${get.qno}" readonly="readonly"  /> 
		</div>
		<div>
			<label for="p_group">구분</label>
			<input type="text" name="p_group"  value="${get.p_group}" readonly="readonly"  /> 
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
		
		<button type="button" onclick="location.href='/qna/list'">목록</button>
	</form>
	<div>
	<h4>댓글  <button type="button" id="addReply">댓글 달기</button></h4>
	
	<div id="replyDiv">
		<c:forEach items="${reply}" var="i" >
			
				<table  style="border: 1px solid #dddddd;"  id="replyTable${i.rno}">
					<tbody >
						<tr style="background-color:gray">
							<td align="left" id="r_writer" >${i.r_writer}</td>
							<td align="right" id="r_reg_date"><fmt:formatDate value="${i.r_reg_date}" pattern="yyyy/MM/dd a hh:mm" /></td>
							<td><button  id="reReply">댓글</button></td>
							<td><button data-rno="${i.rno}"  id="replymodify${i.rno}">수정</button> </td>
							<td><button id="replyRemove${i.rno}">삭제</button> </td>
						</tr>	
						<tr>
							<td colspan="5" id="r_content">${i.r_content}</td>
						</tr>
					</tbody>		
				</table>
			
		</c:forEach>
	</div>
	
	
	</div>
	<div class="modal" id="modal" >
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" >X</button>
					<h4 class="modal-title">댓글 창 </h4>
				</div>
				<div class="modal-body">
					<div class="modal-group">
						<label>작성자</label>
						<input name="replyer"/>
					</div>
					<div class="modal-group">
						<label>댓글</label><br/>
						<textarea name="reply">댓글</textarea>
						
					</div>
					<div class="modal-group">
						<label>날짜</label>
						<input name="replyDate"/>
					</div>
				</div><br/>
				<div class="modal-footer">
					<button type="button" id="modify">수정</button>
					<button type="button" id="register">등록</button>
					<button type="button" class="close">닫기</button>
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
		
		/* 댓글 등록 버튼 누름 */
		$("#addReply").on("click",function(e){
			console.log("등록버튼 눌림")
			modal.find("input").val("")
			modal.find("textarea").val("")
			modalReplyDate.closest('div').hide()
			/* modal.find("button[id != 'close']").hide() */
			modalRgBtn.show()
			
			$(".modal").show()
		})
		
		$(".close").on("click",function(e){
			$(".modal").hide()
		})
		var today=new Date()
		
		/* 댓글 추가 */
		modalRgBtn.on("click",function(e){
			console.log("추가 버튼 눌림")
			var form={
				qno:${get.qno},
				r_writer:modalReplyer.val(),
				r_content:modalReply.val(),
				r_reg_date:today,
					
			}
			console.log(form)
			$.ajax({
				url:"/reply/insert",
				type:"post",
				data:JSON.stringify(form),
				contentType:"application/json; charset=utf-8",
				dataType:"text",
				success:function(result){
					$("#modal").hide();
					$("#replyDiv").load(location.href + ' #replyDiv');
				},
				error:function(){
					alert("실패")
				}
			})
			
		})
		
		/* 댓글 클릭  1. 리댓 없다면 사용  */
		/* $("#replyTable tr").on("click",function(){
			$(".modal").show()
			modalRgBtn.hide()
			
			console.log($(this))
			modalReply.val($(this).next("tr").find("#r_content").text())
			modalReplyer.val($(this).find("#r_writer").text())
			modalReplyDate.val($(this).find("#r_reg_date").text()).attr("readonly","readonly")
			 
			var rno=$(this).find("td").data("rno")
			console.log(rno)
		})  */
		
		
		/* 댓글 수정 버튼눌림-> 댓글 수정 창 띄움 */
		$("button[id^='replymodify']").on("click",function(){
			$(".modal").show()
			modalRgBtn.hide()
			
			console.log($(this))
			
			var rno=$(this).data("rno")
			console.log(rno)
			
			console.log($("#replyTable"+rno).find("#r_writer").text())
			
			modalReply.val($("#replyTable"+rno).find("#r_content").text())
			modalReplyer.val($("#replyTable"+rno).find("#r_writer").text())
			modalReplyDate.val($("#replyTable"+rno).find("#r_reg_date").text()).attr("readonly","readonly")
			 
			
		}) 
		
		
		/* 댓글 삭제 버튼눌림-> 댓글 수정 창 띄움 */
		$("button[id^='replyRemove']").on("click",function(){
			var rno=$(this).parent().prev().find("button").data("rno")
			console.log($(this).parent().prev().find("button").data("rno"))
			form={'rno':rno}
			$.ajax({
				url:"/reply/delete",
				type:"post",
				data:JSON.stringify(form),
				contentType:"application/json; charset=utf-8",
				dataType:"text",
				success:function(result){
					$("#modal").hide();
					$("#replyDiv").load(location.href + ' #replyDiv');
				},
				error:function(){
					alert("실패")
				}
			})
			
			 
			
		}) 
		
	})
	
</script>
</html>