<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"></script> 
<!DOCTYPE html>
<html>
<style>
#division {
	width:50%;
	height:300px;
	float:left;
	overflow:auto;
	
}
#division h2,#division button{
	display:inline;	
}

.letter_modal {
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

nav h2,nav h4{
	display:inline;
	border: 1px solid #888;	
}

</style>
<head>

<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<nav>
		<h2>${user.name}님 페이지</h2>
		<h4 style='float:right;'><a href="/user/logout">로그아웃</a></h4>
	</nav>
	<div id="division">
		<h2 id="title">내가 가입한 그룹</h2>
		<table>
			<thead>
				<tr>
				  <th>no.</th>
				  <th>그룹이름</th>
				  <th>승인</th>
	              <th></th>
				</tr>
			</thead>
			<tbody id="groupBody">
				<c:forEach items="${myGroup}" var="i" varStatus="status"  begin="0" end='9'>
						<tr>
							<td>${status.count}</td>
							<td>${i.group_name}</td>
							<td>${i.authorized}</td>
							<td></td>
						</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	
	
	<div id="division">
		<h2 id="title">내정보</h2>
		<button onclick="location='/user/modify'">정보 수정</button>
		<table>
			<thead>
				<tr>
				  <th>아이디</th>
	              <th>이름</th>
	              <th>이메일</th>
	              <th>가입일</th>
				</tr>
			</thead>
				<tr>
					<td>${user.user_id}</td>
					<td >${user.name}</td>
					<td>${user.email}</td>
					<td></td>
				</tr>
		</table>
	</div>
	
	
	<div id="division">
		<h2 id="title">내 게시물</h2>
		<ul>
			<li>
				스터디
				<table>
					<thead>
						<tr>
						  <th>no.</th>
						  <th>그룹 이름</th>
						  <th>제목</th>
			              <th>날짜</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${status.count}</td>
							<td>${i.group_name}</td>
							<td>${i.title}</td>
							<td><fmt:formatDate value="${i.regdate}" pattern="yyyy-MM-dd a hh:mm" /></td>
						</tr>
					</tbody>
				</table>
			</li>
			<li>
				스터디 게시물
				<table>
					<thead>
						<tr>
						  <th>no.</th>
						  <th>그룹 이름</th>
						  <th>제목</th>
			              <th>날짜</th>
						</tr>
					</thead>
					<c:forEach items="${myBoard}" var="i" varStatus="status"  begin="0" end='9'>
						<tr>
							<td>${status.count}</td>
							<td>${i.group_name}</td>
							<td>${i.title}</td>
							<td><fmt:formatDate value="${i.regdate}" pattern="yyyy-MM-dd a hh:mm" /></td>
						</tr>
					</c:forEach>
				</table>
			</li>
			<li>
				Q&A 게시물
				<table>
					<thead>
						<tr>
						  <th>no.</th>
						  <th>Q&A 제목</th>
			              <th>날짜</th>
						</tr>
					</thead>
					<c:forEach items="${myqna}" var="i" varStatus="status"  begin="0" end='9'>
						<tr>
							<td>${status.count}</td>
							<td>${i.title}</td>
							<td><fmt:formatDate value="${i.reg_date}" pattern="yyyy-MM-dd a hh:mm" /></td>
						</tr>
					</c:forEach>
				</table>
			</li>
		</ul>
	
	</div>
	
	<div id="division">
		<h2 id="title">내 댓글</h2>
		<ul>
			<li>
				<table id="boardReply">
					<thead>
						<tr>
						  <th>no.</th>
						  <th>게시글 제목</th>
						  <th>댓글</th>
			              <th>날짜</th>
						</tr>
					</thead>
					<c:forEach items="${boardReply}" var="i" varStatus="status"  begin="0" end='9'>
						<tr>
							<td>${status.count}</td>
							<td></td>
							<td>${i.reply}</td>
							<td><fmt:formatDate value="${i.replydate}" pattern="yyyy-MM-dd a hh:mm" /></td>
						</tr>
					</c:forEach>
				</table>
			</li>
			
			<li>
				<table id="qnaReply">
					<thead>
						<tr>
						  <th>no.</th>
						  <th>Q&A 제목</th>
						  <th>댓글</th>
			              <th>날짜</th>
						</tr>
					</thead>
					<c:forEach items="${qnaReply}" var="i" varStatus="status"  begin="0" end='9'>
						<tr>
							<td>${status.count}</td>
							<td></td>
							<td>${i.r_content}</td>
							<td><fmt:formatDate value="${i.r_reg_date}" pattern="yyyy-MM-dd a hh:mm" /></td>
						</tr>
					</c:forEach>
				</table>
			</li>
		</ul>
	</div>
	
	<div id="division">
		<h2 id="title">쪽지</h2>
		<table>
				<thead>
					<tr>
					  <th>no.</th>
					  <th>id</th>
					  <th>내용</th>
		              <th>날짜</th>
		              <th></th>
					</tr>
				</thead>
				<c:forEach items="${letter}" var="i" varStatus="status"  begin="0" end='9'>
					<tr>
						<td>${status.count}</td>
						<td>${i.writer}</td>
						<td>${i.content}</td>
						<td><fmt:formatDate value="${i.reg_date}" pattern="yyyy-MM-dd a hh:mm" /></td>
						<td><button data-idx='${status.index}' class='letterBtn'>답장</button></td>
					</tr>
				</c:forEach>
		</table>
	</div>
	
	<!-- 쪽지 모달 -->
	<div class="letter_modal" id="letter_modal" >
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" style='float:right;'>X</button>
					<h4 class="modal-title">쪽지 </h4>
				</div>
				<div class="modal-body">
					<div class="modal-group">
						<label>보내는 사람</label><br/>
						<input name="writeId"/>
					</div>
					<div class="modal-group">
						<label>받는 사람</label><br/>
						<input name="recipientId"/>
					</div>
					<div class="modal-group">
						<label>내용</label><br/>
						<textarea name="letterContent"></textarea>
						
					</div>
					<div class="modal-group">
						<label>날짜</label><br/>
						<input name="letterDate"/>
					</div>
				</div><br/>
				<div class="modal-footer">
					<button type="button" id="letterRegister">등록</button>
					<button type="button" class="close">닫기</button>
				</div>
				
		</div>
	</div>
</body>
 <script>
 	$(document).ready(function () {
 		
 		if('${user}'==null){
 			alert("로그인 후 이용하세요")
 			location.href="/user/login";
 		}
 		
 		/* 쪽지 */
 		var today=new Date()
 		
		var letterModal=$(".letter_modal")
		var modalwriteId=letterModal.find("input[name='writeId']")
		var modalrecipientId=letterModal.find("input[name='recipientId']")
		var letterDate=letterModal.find("input[name='letterDate']")
		var letterContent=letterModal.find("textarea[name='letterContent']")
		
		$(".letterBtn").click(function(){
			console.log('쪽지 버튼 눌림')
			
			letterDate.closest('div').hide()
			$(".letter_modal").show()
			var idx=$(".letterBtn").index(this)
			var uid=$("#userId"+idx).text()
			
			console.log(uid)
			console.log('${user.user_id}')
			
			modalwriteId.val('${user.user_id}')
			modalrecipientId.val(uid)
						
			$("#letterRegister").off('click').on('click',function(){
				
				var form={
						writer:modalwriteId.val(),
						recipient:modalrecipientId.val(),
						content:letterContent.val(),
						reg_date:today,
				}
				console.log(form)
				$.ajax({
					url:"/mypage/letterRegister",
					type:"post",
					data:JSON.stringify(form),
					contentType:"application/json; charset=utf-8",
					dataType:"text",
					success:function(result){
						$(".letter_modal").hide();
						location.reload();
					},
					error:function(){
						alert("실패")
					}
				}) 
			})
		})
		
		
		$(".close").click(function(){
			$(".letter_modal").hide()
			
		})
 	 })	
</script>
</html>