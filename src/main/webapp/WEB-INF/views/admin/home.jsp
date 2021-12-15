<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<jsp:useBean id="today" class="java.util.Date" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#today {
	width:100%;
	height:10px;
	text-align:right;
}

.userList, .study,.qna , .letter{
	width:50%;
	height:400px;
	float:left;
	overflow:auto;
	
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
<title>Admin 페이지</title>

</head>
<body>
	<h1>Admin page</h1>
	<h5 id='today'><fmt:formatDate value="<%= today %>" pattern="yyyy-MM-dd" /> : 방문자수(가능하면)</h5>
	<h3>받은 쪽지 리스트도 보이도록, 방문자 평균 그래프로 보이게</h3>
	
	<h3 id='a'>회원 리스트</h3>
	<div class='userList'>
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
					<td>${i.regDate}</td>
					<td><button id='chat'>채팅</button></td>
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
	
	<h3 id='a'><a href='/group/'>스터디 승인 리스트</a></h3>
	<div class='study'>
	<h5>스터디 a태그로 누르면 전제 내용 띄우고 승인 버튼 스터디 테이블에 승인 컬럼 만들기</h5>
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
					<td>Y/N</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	
	
	
	<h3><a href='/qna/list'>Q&A 리스트</a></h3>
	<div class='qna'>
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
					<td>만들기</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<h3>받은 쪽지</h3>
	<div class="letter">
		
	</div>
	
	
	<div class="modal" id="modal" >
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" style='float:right;'>X</button>
					<h4 class="modal-title">댓글 창 </h4>
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
</body>
<script type="text/javascript">
	
	$(document).ready(function () {
		
		var modal=$(".modal")
		var modalContent=modal.find("textarea[name='modalContent']")
		var modalId=modal.find("input[name='modelId']")
		var modalDate=modal.find("input[name='modalDate']")
		var today=new Date()
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
					url:"/admin/susp",
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
		
		$(".close").click(function(){
			$(".modal").hide()
		})
	})

</script>
</html>