<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Insert title here</title>
		<script src="//code.jquery.com/jquery-3.6.0.js"></script>
		<script src="/resources/js/fileUpload.js" type="text/javascript"></script>
		<style>
			.modal{
				background: rgba(0,0,0,0.8); 
				display: none;
				position: fixed;
				width: 100%;
				height:100%;
				left :0;
				right : 0;
				right: 0;
				bottom: 0;
				z-index: 1;
				
			}
			.modal_content{
				position: absolute;
				display : felx;
				justify-content:cneter;
				align-items : center;
				
				top: 50%;
  				left: 50%;
  				transform: translate(-50%, -50%);
				background-color : white;
			}
			.modal_content *{
				padding : 10px
			}
			button[type="reset"]{
				display : none;
			}
			 div.uploadResult > ul > li > div > img{
			 	width: 50px;
                height: 50px;
                border-radius: 50%;
			 }
			 
		</style>
	</head>
	<body>
		<div>
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
				<label for="writer"> 저자 </label>
				<input type="text" value="${board.writer}" />
			</div>
			${board.notice }
			<div>
			<fmt:formatDate value="${board.regdate}" pattern="yyyy MM dd" />
			<br/> <fmt:formatDate value="${board.updateDate}" pattern="yyyy MM dd" />
			<br>
			</div>
			<div>
				<div class="content"> ${board.content} </div>	
			
			</div>
			
			<div>
				<div class="uploadResult">
					<h5>첨부파일</h5>
					<ul></ul>
				</div>
			</div>
		</form>
		
		<h5>댓글</h5>
		<div class="reply">
			<c:forEach items="${replies}" var="reply">
				<p class="reply" data-rno="${reply.rno}"><span > ${reply.reply} </span><span> ${reply.replyer}</span>
				<span> 
				<fmt:formatDate value="${reply.replydate}" pattern="yyyy MM dd" />
				<c:if test="${reply.updateDate != null }">
				수정일 : <fmt:formatDate value="${reply.updateDate}" pattern="yyyy MM dd" /> 
				</c:if>
				</span> <br/>
				
			</c:forEach>
		</div>
		<c:if test="${user eq board.writer}">
			<button class="go_modify">글수정</button>
			<button class="deleteBoard">글삭제</button>
		</c:if>
		<button class="go_board">목록</button>
		<button class="reply">모달을 띄우자</button>
		
		<h3> 댓글/ 등록/ 수정 / 삭제 후 location reload => element 삽입, 삭제로 바꿔보기  </h3>
		<div class="modal">
			<div class="modal_content">
				<span> X </span>
				<form>
					<div>
						<label for="reply">댓글 내용</label>
						<input type="text" name="reply" />
					</div>
					<div>
						
						<input type="hidden" name="replyer" />
					</div>
					<input type="hidden" name="rno" />
						<div>
						<button class="submit">전송</button>
						<button class="modify">수정</button>
						<button class="delete">삭제</button>
						<button type="reset">리셋</button>
					</div>
					
				</form>
				
			</div><!-- 모달 컨텐드 -->
		</div> <!-- 모달  -->
	</div>
	
		<script>

		  	
		
		   $(document).ready(function(e){
			   
			   
		   let loginUser= "${user}"
		  	
				$.getJSON(
					"/group/getMemberlistByGroup/${cri.group_name}", (list) =>{
						console.log(list)
						console.log(loginUser)
						let joinCheck = list.memberList.find( user => user.user_id === loginUser)
						if(!joinCheck){
							alert("그룹 회원만 접근 가능한 페이지입니다")
							location.href="/group/"
						} 
					})
			
	   
//			 let attachList = [];
		
			 // 파일 표시 (다운로드 )
			 let bno = "${cri.bno}"
			 $.getJSON("/group/getFileList", {bno} , (files) =>{
					let str =""
					files.map( file => {
//						attachList.push(file) // 수정할때 넣음
						if(file.fileType){
							let fileCallpath = encodeURIComponent(`\${file.uploadPath}/\${file.uuid}_\${file.fileName}`)
							str += `<li><div><a href='/download?fileName=\${fileCallpath}'><span>\${file.fileName}</span></a>`;
							str += `<img src='/display?fileName=\${fileCallpath}'></div></li>`
						}
						else{
							let fileCallpath =encodeURIComponent(`\${file.uploadPath}/\${file.uuid}_\${file.fileName}`)
							str += `<li><div><a href='/download?fileName=\${fileCallpath}'><span>\${file.fileName}</span></a></div></li>`;
						}
					})//map
					$('.uploadResult ul').html(str)
				}) //getJSON
			 
		    $('div.modal > div > span').click(function(e){
				$('.modal').hide()
			})

			// 글삭제
			$(".deleteBoard").click(function (e) {
				
				e.preventDefault();
				$.ajax({
					type: "delete",
					url: "/group/board/${cri.bno}",
					success: () => {
						let url = "/group/board/${cri.group_name}/${cri.pageNum}/${cri.amount}"
						url += "${cri.keyword}" ? "/${cri.type}/${cri.keyword}" : ""
						location.href = url
					},
					error: (xhr, status, er) => {
						console.log(status);
					},
				}); //ajax
			}); //delete click
			
			// 모달창 띄우기
			$(".reply").click(function (e) {
				
				$('button[type="reset"]').trigger("click");
				$('input[name="replyer"]').val(loginUser)
				$('.modal').show()
			});
			
			// 목록 go 
			$(".go_board").click((e) => {
				e.preventDefault();
				
				let url = "/group/board/${cri.group_name}/${cri.pageNum}/${cri.amount}"
				url += "${cri.keyword}" ? "/${cri.type}/${cri.keyword}" : ""
				location.href = url
		
			});
			
			// 리플폼 데이터 얻기
			const getReplyData = () => ({
				rno: $('input[name="rno"]').val(),
				bno: "${board.bno}",
				reply: $('input[name="reply"]').val(),
				replyer: $('input[name="replyer"]').val(),
			});
			
			// 댓글 등록
			$(".submit").click(function (e) {
				e.preventDefault();
				let data = getReplyData();
				
				
				$.ajax({
					type: "post",
					url: "/group/reply",
					data: JSON.stringify(data),
					contentType: "application/json; charset=utf-8",
					success: () => {
						$('button[type="reset"]').trigger("click");
						$('.modal').hide();
						location.reload()
					},
					error: (xhr, status, er) => console.log(xhr),
				});
			});
			
			// 댓글 클릭하면 모달에 채우기...
			$("p.reply").click(function (e) {
				console.log(e)
				$('button.submit').hide()
				let rno = $(this).data("rno");
				$.getJSON("/group/reply/" + rno, (res) => {
					console.log(res);
					$('input[name="rno"]').val(res.rno);
					$('input[name="reply"]').val(res.reply);
					$('input[name="replyer"]').val(res.replyer);
					if(loginUser!== res.replyer) {
						$('button.modify, button.delete').hide()
					}
				}); //getJSON
				
				
				
			}); //reply click
			
			// 글 수정하러가기
			$(".go_modify").click(function (e) {
				e.preventDefault();
				let url = "/group/board/modify/${cri.group_name}/${cri.bno}/${cri.pageNum}/${cri.amount}"
				url += "${cri.keyword}"? "/${cri.type}/${cri.keyword}" : ""
				location.href = url
				
			}); //modify
			
			// 댓글 수정
			$(".modify").click(function (e) {
				e.preventDefault();
				$('.modal').show()
				let data = getReplyData();
				console.log(data);
				let rno = $('input[name="rno"]').val();
				$.ajax({
					type: "put",
					url: "/group/reply/" + rno,
					data: JSON.stringify(data),
					contentType: "application/json; charset=utf-8",
					success: () => {
						$('.modal').hide();
						$('button[type="reset"]').trigger("click");
						/* $('div.reply').load(window.location.href + ' div.reply') */
						location.reload()
					},
					error: (xhr, status, er) => console.log(xhr),
				});
			}); //modify
			
			// 댓글삭제
			$(".delete").click(function (e) {
				e.preventDefault();
				let rno = $('input[name="rno"]').val();
				$.ajax({
					type: "delete",
					url: "/group/reply/" + rno,
					success: () => {
						$('button[type="reset"]').trigger("click");
						$('.modal').hide()
						/* $('.reply[data-rno="${rno}"]').remove() */
						location.reload()
					},
					error: (xhr, status, er) => console.log(xhr),
				});
			}); //delete
		   })//docu ready
		</script>
	</body>
</html>