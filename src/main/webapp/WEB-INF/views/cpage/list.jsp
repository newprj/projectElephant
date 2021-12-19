<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<h1>소모임장 페이지</h1>
<body>
	<h2>소모임 명 : ${str[1]}</h2>
	<h3>소모임 장 : ${str[0]}</h3>
	 <div class="memberLimit"></div> 
	<li>가입된 회원</li>
	<c:forEach items="${list}" var="list">
		<c:if test="${list.membership eq 'Y'}">
			<c:if test="${list.captain ne 'Y'}">
				${list.member} ======== <button type="button" onclick="remove('${list.member}')" >추방하기</button>
				<button type="button" onclick="letter('${list.member}')">쪽지보내기</button>
			</c:if>
		</c:if>
	</c:forEach>
	<hr>
	<li>가입된 승인 대기중인 회원</li>
	<br>
	<c:forEach items="${list}" var="list">
		<c:if test="${list.membership eq 'N'}">
			${list.member}  ======== <button type="button" onclick="update('${list.member}')" >승인</button>
			<button type="button" onclick="remove('${list.member}')" >거절</button>
			<button type="button" onclick="letter('${list.member}')">쪽지보내기</button><br>
		</c:if>
	</c:forEach>
	<div class="modal">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">쪽지보내기</h4>
				</div>
				<div class="modal-body">
					<div class="modal-group">
						<input name="writer" type="hidden" value="${str[0]}"/>
					</div>
					<div class="modal-group">
						<label>쪽지내용</label><br/>
						<textarea name="content" placeholder="내용을 입력하세요"></textarea>
					</div>
				</div><br/>
				<div class="modal-footer">
					<button type="button" id="register">보내기</button>
					<button type="button" id="close">닫기</button>
				</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(".modal").hide()
	var memberLimit = ${memberLimit}
	console.log(memberLimit)


	$(".memberLimit").append("<p> 모집인원 : " + memberLimit + " / 5 </p>")

	
	function letter(member){
		console.log(member)
		$(".modal").show()
		
		$('#register').click(function() {
			var letter={
					recipient: member,
					writer:$(".modal").find("input[name='writer']").val(),
					content:$(".modal").find("textarea[name='content']").val(),
					reg_date: new Date()
			}
			console.log(letter)
			$.ajax({
				url:"/cpage/letter",
				type:"post",
				data:JSON.stringify(letter),
				contentType:"application/json; charset=utf-8",
				dataType:"text",
				success:function(result){
					$(".modal").hide();
					location.reload();
					alert("쪽지를 발송하였습니다.")
				},
				error:function(){
					alert("실패")
				}
			})
		})
	}
	
	
	
	
	
	
	$('#close').click(function() {
		$(".modal").hide()
	})


	
	function update(member){
		if(memberLimit === 5) {
			alert("인원이 초과되었습니다")
			return false;
		}
		console.log(memberLimit)
		
	    $.ajax({
	        url : '/cpage/update/'+member,
	        type : 'post',
	        success : function(data){
	            if(data == "success") location.reload();  
	        }
	    });
	}
	
	function remove(member){
	    $.ajax({
	        url : '/cpage/remove/'+member,
	        type : 'post',
	        success : function(data){
	        	if(data == "success") location.reload();  
	        }
	    });
	}


</script>
</html>
