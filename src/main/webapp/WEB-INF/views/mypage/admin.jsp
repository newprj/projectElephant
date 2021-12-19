<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<jsp:useBean id="today" class="java.util.Date" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
nav {
	display:inline;
	text-align:right;
}

.userList, .study,.qna , .letter{
	width:50%;
	height:400px;
	float:left;
	overflow:auto;
	
}


.modal,.letter_modal {
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
body{
	margin-top: 50px;
	margin-bottom: 50px;
}
.container{
	width: 50%;
	
}


ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #ededed;
	color: #222;
}

.tab-content{
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current{
	display: inherit;
}

</style>
<title>관리자 페이지</title>

</head>
<body>
	<h1>관리자 페이지</h1>
	<nav>
		<h5><a href="/user/logout">로그아웃</a></h5>
		<h5 id='today'><fmt:formatDate value="<%= today %>" pattern="yyyy-MM-dd" /> 방문자 :  ${visit}명 </h5>
	</nav>
	<h3>방문자 평균 그래프로 보이게</h3>
	
	<div class='userList'>
		<h3 >회원 리스트</h3>
		<h5>회원에게 쪽지, 버튼 크기 맞추기,정지된 회원은 로그인 안되게 하기</h5>
		<table>
			<thead>
				<tr>
				  <th>no.</th>
				  <th>아이디</th>
	              <th>이름</th>
	              <th>가입일</th>
	              <th>쪽지</th>
	              <th>회원 정지</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="i" varStatus="status"  begin="0" end='9'>
				<tr>
					<td>${status.count}</td>
					<td id='userId${status.index}'>${i.user_id}</td>
					<td>${i.name}</td>
					<td></td>
					<td><button data-idx='${status.index}' class='letterBtn'>쪽지</button></td>
					<td><button class='susp' >
						<c:choose>
							<c:when test="${i.suspension eq 'Y'}">정지</c:when>
							<c:otherwise>활동중</c:otherwise>
						</c:choose>	
					</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div class='study'>
		<h3 ><a href='/group/'>스터디 승인 리스트</a></h3>
	<h5>스터디장이 승인 요청한 것만 띄우기</h5>
		<table>
			<thead>
				<tr>
				  <th>no.</th>
				  <th>스터디명</th>
	              <th>주제</th>
	              <th>스터디장</th>
	              <th>인원수</th>
	              <th>내용확인</th>
	              <th>승인여부</th>
				</tr>
			</thead>
			<c:forEach items="${group}" var="i" varStatus="status"  begin="0" end='9'>
				<tr>
					<td>${status.count}</td>
					<td>${i.group_name}</td>
					<td>${i.subject}</td>
					<td>${i.leader}</td>
					<td>${i.member_number}명</td>
					<td><a href='/group/gather/${i.group_name}'>확인</a></td>
					<td><c:choose>
							<c:when test="${i.authorized eq 'Y'}">승인</c:when>
							<c:otherwise>비승인</c:otherwise>
						</c:choose>	
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	
	
	
	<div class='qna'>
	<h3><a href='/qna/list'>Q&A 리스트</a></h3>
		<table>
			<thead>
				<tr>
				  <th>no.</th>
	              <th>제목</th>
				  <th>비밀번호</th>
	              <th>아이디</th>
	              <th>등록일</th>
	              <th>조회수</th>
				</tr>
			</thead>
			<c:forEach items="${qna}" var="i" varStatus="status" begin="0" end='9'>
				<tr>
					<td>${status.count}</td>
					<td><a href="/qna/detail?qno=${i.qno}">${i.title}</a></td>
					<td>${i.pwd}</td>
					<td>${i.writer}</td>
					<td><fmt:formatDate value="${i.up_date}" pattern="yyyy-MM-dd a hh:mm" /></td>
					<td>${i.hit}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	
	<!-- 쪽지 -->
	<div class="container">

		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">받은 쪽지</li>
			<li class="tab-link" data-tab="tab-2">보낸 쪽지</li>
			<li><button class='letterBtn'>쪽지 보내기</button></li>
		</ul>
	
		<div id="tab-1" class="tab-content current">
			<table>
					<thead>
						<tr>
						  <th>no.</th>
						  <th>보낸 id</th>
						  <th>내용</th>
			              <th>날짜</th>
			              <th></th>
						</tr>
					</thead>
					<c:forEach items="${letter}" var="i" varStatus="status"  begin="0" end='9'>
						<tr>
							<td>${status.count}</td>
							<td id='userId${status.index}'>${i.writer}</td>
							<td>${i.content}</td>
							<td><fmt:formatDate value="${i.reg_date}" pattern="yyyy-MM-dd a hh:mm" /></td>
							<td><button class='letterBtn'>답장</button></td>
						</tr>
					</c:forEach>
			</table>

		</div>
		<div id="tab-2" class="tab-content">
		
			<table>
					<thead>
						<tr>
						  <th>no.</th>
						  <th>받은 id</th>
						  <th>내용</th>
			              <th>날짜</th>
			              <th></th>
			              <th></th>
						</tr>
					</thead>
					<c:forEach items="${sendletter}" var="i" varStatus="status"  begin="0" end='9'>
						<tr>
							<td>${status.count}</td>
							<td>${i.recipient}</td>
							<td>${i.content}</td>
							<td><fmt:formatDate value="${i.reg_date}" pattern="yyyy-MM-dd a hh:mm" /></td>
							<td><button data-lno='${i.lno}' class='deleLetter'>삭제</button></td>
						</tr>
					</c:forEach>
			</table>
		</div>

	</div>
	
	<!-- 유저 정지 모달 -->
	<div class="modal" id="modal" >
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" style='float:right;'>X</button>
					<h4 class="modal-title">유저 정지 </h4>
				</div>
				<div class="modal-body">
					<div class="modal-group">
						<label>ID</label><br/>
						<input name="modelId"/>
					</div>
					<div class="modal-group">
						<label>이유</label><br/>
						<textarea name="modalContent"></textarea>
						
					</div>
					<div class="modal-group">
						<label>날짜</label><br/>
						<input name="modalDate"/>
					</div>
				</div><br/>
				<div class="modal-footer">
					<button type="button" id="register">등록</button>
					<button type="button" class="close">닫기</button>
				</div>
				
		</div>
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
<script type="text/javascript">
	
	$(document).ready(function () {
		
				
		var modal=$(".modal")
		var modalContent=modal.find("textarea[name='modalContent']")
		var modalId=modal.find("input[name='modelId']")
		var modalDate=modal.find("input[name='modalDate']")
		var today=new Date()
		
		/* 댓글 */
		$(".susp").click(function(){
			console.log('회원정지 버튼 눌림')
			modalDate.closest('div').hide()
			$(".modal").show()
			var idx=$(".susp").index(this)
			var uid=$("#userId"+idx).text()
			modalId.val(uid)
			
			var suspension=''
			if($(this).text().trim()=='정지'){
				suspension='N'
				$("#register").text("정지 해제")
			}
			else if (($(this).text().trim()=='활동중')) {
				suspension='Y'
				$("#register").text("정지")
			}
			
			$("#register").off('click').on('click',function(){
				
				var form={
						user_id:modalId.val(),
						suspension:suspension,
						suspContent:modalContent.val(),
						suspDate:today,
				}
				console.log(form)
				$.ajax({
					url:"/mypage/susp",
					type:"post",
					data:JSON.stringify(form),
					contentType:"application/json; charset=utf-8",
					dataType:"text",
					success:function(result){
						$("#modal").hide();
						location.reload();
					},
					error:function(){
						alert("실패")
					}
				}) 
			})
		})
		
		
		
		
		/* 쪽지 */
		var letterModal=$(".letter_modal")
		var modalwriteId=letterModal.find("input[name='writeId']")
		var modalrecipientId=letterModal.find("input[name='recipientId']")
		var letterDate=letterModal.find("input[name='letterDate']")
		var letterContent=letterModal.find("textarea[name='letterContent']")
		
		$(".letterBtn").click(function(){
			console.log('쪽지 버튼 눌림')
			
			letterDate.closest('div').hide()
			$(".letter_modal").show()
			var idx=$(this).data("idx")
			var uid=$("#userId"+idx).text()
			
			
			modalwriteId.val('${user}')
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
			$(".modal").hide()
			$(".letter_modal").hide()
			
		})
		
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		})
		
		$(".deleLetter").click(function(){
			console.log("삭제버튼 눌림")
			var lno=$(this).data('lno')
			var data={
					lno:lno,
					writer:'${user}'
			}
			console.log(data)
			$.ajax({
				url:"/mypage/deleLetter",
				type:"post",
				data:JSON.stringify(data),
				contentType:"application/json; charset=utf-8",
				success:function(){
					location.reload();
				},
				error:function(){
					alert("실패")
				}
			}) 
		})
		
		
	})

</script>
</html>