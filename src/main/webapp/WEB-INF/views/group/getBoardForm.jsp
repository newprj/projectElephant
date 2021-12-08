<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
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
		</style>
	</head>
	<body>
		<div>
		<h1> 글 읽기 페이지  </h1>
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
				<textarea >${board.content}</textarea>
			</div>
			<div>
				<label for="writer"> 저자 </label>
				<input type="text" value="${board.writer}" />
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
				<p class="reply" data-rno="${reply.rno}"><span > ${reply.reply} </span><span> ${reply.replyer}</span> <p>
			</c:forEach>
		</div>
		<button class="go_modify">글수정</button>
		<button class="delete">글삭제</button>
		<button class="go_board">목록</button>
		<button class="reply">모달을 띄우자</button>

		<h3> 댓글/ 등록/ 수정 / 삭제 후 특정 div 새로고침 이후로 모달 창 띄웠을때 값을 불러오지 못함 </h3>
		<div class="modal">
			<div class="modal_content">
				<span> X </span>
				<form>
					<div>
						<label for="reply">댓글 내용</label>
						<input type="text" name="reply" />
					</div>
					<div>
						<label for="replyer">댓글작성자</label>
						<input type="text" name="replyer" />
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
			 let attachList = [];
			 getFileList('${cri.bno}')
		    $('div.modal > div > span').click(function(e){
				$('.modal').hide()
			})
			
			// 글삭제
			$(".content > .delete").click(function (e) {
				e.preventDefault();
				$.ajax({
					type: "delete",
					url: "/group/board/${bno}",
					success: () => {
						location.href = "/group/board/${cri.group_name}";
					},
					error: (xhr, status, er) => {
						console.log(status);
					},
				}); //ajax
			}); //delete click
			
			// 모달창 띄우기
			$(".reply").click(function (e) {
				$('button[type="reset"]').trigger("click");
				$('.modal').show()
			});
			
			// 목록 go 
			$(".go_board").click((e) => {
				e.preventDefault();
				location.href =
					"/group/board/${cri.group_name}/${cri.pageNum}/${cri.amount}";
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
				console.log(data);
				$.ajax({
					type: "post",
					url: "/group/reply",
					data: JSON.stringify(data),
					contentType: "application/json; charset=utf-8",
					success: () => {
						
						$('button[type="reset"]').trigger("click");
						$('.modal').hide();
						$('div.reply').load(window.location.href + ' div.reply')
					},
					error: (xhr, status, er) => console.log(xhr),
				});
			});
			
			// 댓글 클릭하면 모달에 채우기...
			$("p.reply").click(function (e) {
				console.log(e)
				let rno = $(this).data("rno");
				$.getJSON("/group/reply/" + rno, (res) => {
					console.log(res);
					$('input[name="rno"]').val(res.rno);
					$('input[name="reply"]').val(res.reply);
					$('input[name="replyer"]').val(res.replyer);
				}); //getJSON
			}); //reply click
			
			// 글 수정하러가기
			$(".go_modify").click(function (e) {
				e.preventDefault();
				location.href =
					"/group/modify/${cri.group_name}/${cri.bno}/${cri.pageNum}/${cri.amount}";
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
						$('div.reply').load(window.location.href + ' div.reply')
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
						$('div.reply').load(window.location.href + ' div.reply')
					},
					error: (xhr, status, er) => console.log(xhr),
				});
			}); //delete
		   })//docu ready
		</script>
	</body>
</html>
