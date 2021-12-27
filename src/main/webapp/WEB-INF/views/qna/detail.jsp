<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<%@ include file="../includes/admin_header.jsp" %>

<style>
li {
	list-style-type:none;
}
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

</head>
<div class="boxed">
<div id="content-container">

	<div class="pageheader">
         <h3><i class="fa fa-home"></i> Q&A </h3>
         <div class="breadcrumb-wrapper">
             <span class="label">You are here:</span>
             <ol class="breadcrumb">
                 <li> <a href="/qna/list"> Q&A </a> </li>
                 <li class="active"> Q&A </li>
             </ol>
         </div>
     </div>
	<form>
		<h3>로그인 되면 내가 작성한 댓글만 수정,삭제 버튼 보이도록</h3>
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
			${get.q_content}
			<div class="uploadResult">
						<ul></ul>
			</div>
		</div>
		
		<div class="bigPictureWrapper">
			<div class="bigPicture">
			</div>
		</div>
		<button type="button" id="goList">목록</button>
	</form>
	<div>
	<h4>댓글  <button type="button" id="addReply">댓글 달기</button></h4>
	
	<div id="replyDiv">
		<c:forEach items="${reply}" var="i" >
			
				<table  style="border: 1px solid #dddddd;"  id="replyTable${i.rno}">
					<tbody >
						<tr style="background-color:gray">
							<td align="left" id="r_writer${i.rno}" >${i.r_writer}</td>
							<td align="right" id="r_reg_date"><fmt:formatDate value="${i.r_reg_date}" pattern="yyyy/MM/dd a hh:mm" /></td>
							<td><button  id="reReply">댓글</button></td>
							<td><button data-rno="${i.rno}" class='replymodify' id="replymodify${i.rno}">수정</button> </td>
							<td><button id="replyRemove${i.rno}">삭제</button> </td>
						</tr>	
						<tr>
							<td colspan="5" id="r_content">${i.r_content}</td>
						</tr>
					</tbody>		
				</table>
			
		</c:forEach>
	</div>
	<form id='operForm' action="/qna/list" method="get">
		<input type='hidden' name='pageNum' value='${cri.pageNum}'>
		<input type='hidden' name='amount' value='${cri.amount}'>
		<input type="hidden" name='type' value='${pageMarker.cri.type}'/>
		<input type="hidden" name='keyword' value='${pageMarker.cri.keyword}'/>
	</form>
	
	</div>
	<div class="modal" id="modal" >
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" >X</button>
					<h4 class="modal-title">댓글 창 </h4>
				</div>
				<div class="modal-body">
					<div class="modal-group">
						<label>작성자</label><br/>
						<input name="replyer" value="${loginId}"/>
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
<%@ include file="../includes/admin_footer.jsp" %> 
<script type="text/javascript">


	$(document).ready(function () {
		
		$("#goList").click(function(e){
			$("#operForm").submit()
		})
		
		var modal=$(".modal")
		
		var modalReply=modal.find("textarea[name='reply']")
		var modalReplyer=modal.find("input[name='replyer']")
		var modalReplyDate=modal.find("input[name='replyDate']")
	
		var modalModBtn=$("#modify")
		var modalRgBtn=$("#register")
		var modalCloBtn=$(".close")
	
		$("#modal").hide()
		
		/* 댓글 등록 버튼 누름 */
		$("#addReply").on("click",function(e){
			console.log("등록버튼 눌림")
			modalReply.val("")
			modal.find("textarea").val("")
			modalReplyDate.closest('div').hide()

			modalModBtn.hide()
			modalRgBtn.show()
			modalCloBtn.show()
			
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
					/* $("#replyDiv").load(location.href + ' #replyDiv'); */
					location.reload();
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
		
		
		/* detail에서 댓글 수정 버튼눌림-> 댓글 수정 창 띄움 */
		$("button[id^='replymodify']").on("click",function(){
			$(".modal").show()
			modalRgBtn.hide()
			
			var rno=$(this).data("rno")
			
						
			modalReply.val($("#replyTable"+rno).find("#r_content").text())
			modalReplyer.val($("#replyTable"+rno).find("#r_writer"+rno).text())
			modalReplyDate.val($("#replyTable"+rno).find("#r_reg_date").text()).attr("readonly","readonly")
			 
			/* modal창에서 수정버튼 누름  */
			modalModBtn.off("click").on("click",function(e){
				console.log("수정버튼 눌림")
				var form={
					rno:rno,
					r_writer:modalReplyer.val(),
					r_content:modalReply.val(),
					r_up_date:today,
				}
				console.log(form)
				
				$.ajax({
					url:"/reply/modify",
					type:"post",
					data:JSON.stringify(form),
					contentType:"application/json; charset=utf-8",
					dataType:"text",
					success:function(result){
						$("#modal").hide();
						/* $("#replyDiv").load(location.href + ' #replyDiv'); */
						location.reload();
					},
					error:function(){
						alert("실패")
					}
				})  
			})
		}) 
		
		
	
	
		/* 댓글 삭제 버튼눌림 */
		$("button[id^='replyRemove']").on("click",function(){
			var rno=$(this).parent().prev().find("button").data("rno")
			console.log($(this).parent().prev().find("button").data("rno"))
			form={rno:rno}
			console.log(form)
			$.ajax({
				url:"/reply/delete",
				type:"post",
				data:JSON.stringify(form),
				contentType:"application/json; charset=utf-8",
				
				success:function(result){
					$("#modal").hide();
					/* $("#replyDiv").load(location.href + ' #replyDiv'); */
					location.reload();
				},
				error:function(){
					alert("실패")
				}
			})
			
		}) 
		
		/* 첨부파일 보기 */
		var qno='<c:out value="${get.qno}"/>';
		$.getJSON("/upload/getAttachList",{qno:qno},function(arr){
			console.log(arr)
			
			var str=""
			$(arr).each(function(i,attach){
				if(attach.fileType){
					var fileCallPath=encodeURIComponent(attach.uploadPath+"/"+attach.uuid+"_"+attach.fileName)
					str+="<li data-path='"+attach.uploadPath+"'"
					str+=" data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'"
					str+="><div>"
					str+="</br><img src='/upload/display?fileName="+fileCallPath+"' style=' width:50px; height:50px; ' >"
					str+="<span> "+attach.fileName+"</span>"
					str+="</div>"	
					str+="</li>"
				}else{
					var fileCallPath=encodeURIComponent(attach.uploadPath+"/"+attach.uuid+"_"+attach.fileName)
					var fileLink=fileCallPath.replace(new RegExp(/\\/g),"/")
					str+="<li data-path='"+attach.uploadPath+"'"
					str+=" data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'"
					str+="><div>"
					str+="<img src='/resources/img/attach.png' style=' width:20px; height:20px; ' alt='클릭하면 download'/ >  "
					str+="<span> "+attach.fileName +"</span>"
					str+="</div>"	
					str+="</li>"
				}
			})
			$(".uploadResult ul").html(str)
		})
		
		/* 사진 클릭->크게 보기 */
		$(".uploadResult").on("click","li",function(e){
			var liObj=$(this);
			var path=encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"))
			if(liObj.data("type")){
				//사진이면 확대
				showImage(path.replace(new RegExp(/\\/g),"/"))
			}
			else{
				//사진 아니면 다운로드
				self.location="/upload/download?fileName="+path
			}
		}) 
		
		function showImage(fileCallPath){
			$(".bigPictureWrapper").css('display','flex').show()
			
			$(".bigPicture")
				.html("<img src='/upload/display?fileName="+fileCallPath+"'>")
				.animate({width: '100%', height:'100%'},1000);
		}
		
		/* 커진 사진 없애기 */
		$(".bigPictureWrapper").on("click",function(e){
			$(".bigPicture").animate({width: '100%', height:'100%'},1000)
			setTimeout(() => {
				$(".bigPictureWrapper").hide()
			}, 1000);
		})
		
		/* 로그인 정보와 댓글 정보 비교  */
		<c:forEach items="${reply}" var="i" >
		
			if('${loginId}'==$("#r_writer${i.rno}").text()){
				
				$('#replymodify${i.rno}').show()
				$('#replyRemove${i.rno}').show()
			} else{
				$('#replymodify${i.rno}').hide()
				$('#replyRemove${i.rno}').hide()
			}
			
		</c:forEach> 
		
	})
	
</script>
</html>