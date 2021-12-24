<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://kit.fontawesome.com/6584921572.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="/resources/css/style.css" rel="stylesheet" />
<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
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
	border: 3px solid #F79A9A;
       width: 30%;
}
.limit{	
  	float: right;
}
#confirm {
    border: 2px solid gray;
}
.member{
	color: red;
}
.modal-header{
	align-content : flex-start;
}



</style>
<h1>소모임장 페이지</h1>
<hr>
<body>
<div class="container">
	<h3>소모임 명 : ${leader.group_name} / 소모임 장 : ${leader.user_id}</h3>
</div>
<div class="container" id="confirm">
	<div class="membership">
		<br>
	 	<label class ="member">가입된 회원</label>
	 	<label class ="limit">모집인원 : ${memberLimit} / ${limit}</label>
	 </div>
		 <table class="table">
					   <thead class="thead-dark">
					    <tr>
					      <th scope="col">USER_ID</th>
					      <th scope="col">거절</th>
					      <th scope="col">쪽지</th>
					    </tr>
					  </thead>
			<c:forEach items="${list}" var="list">
				<c:if test="${list.authorized eq 'Y'}">
					<c:if test="${list.leader ne 'N'}">
						<tr>
							<td>${list.user_id} <b>(리더)</b></td>
						</tr>
					</c:if>
					<c:if test="${list.leader ne 'Y'}">
						  <tbody>
						    <tr>
						      <td>${list.user_id}</td>
						      <td><button type="button" class="btn btn-danger btn-sm" onclick="remove('${list.user_id}')" ><i class="fas fa-handshake-slash"></i> 모임에서 내보내기</button></td>
						      <td><button type="button" class="btn btn-success btn-sm" onclick="letter('${list.user_id}')"><i class="far fa-envelope"></i> 쪽지보내기</button></td>
						    </tr>
						   </tbody>
					</c:if>	   
				</c:if>
			</c:forEach>
		</table>
	</div>
	<hr>
	<div class="container" id="confirm">
	<div>
		<br>
	 	<label class ="member">승인 대기중인 회원</label>
	 </div>
		 <table class="table">
					  <thead class="thead-dark">
					    <tr>
					      <th scope="col">USER_ID</th>
					      <th scope="col">가입승인</th>
					      <th scope="col">거절</th>
					      <th scope="col">쪽지</th>
					    </tr>
					  </thead>
			<c:forEach items="${list}" var="list">
				<c:if test="${list.authorized eq 'N'}">
					<tbody>
					    <tr>
					      <td>${list.user_id}</td>
					      <td><button type="button" class="btn btn-primary btn-sm" onclick="update('${list.user_id}')" ><i class="fas fa-handshake"></i> 가입승인</button></td>
					      <td><button type="button" class="btn btn-danger btn-sm" onclick="deleteMember('${list.user_id}')" ><i class="fas fa-handshake-slash"></i> 거절</button></td>
					      <td><button type="button" class="btn btn-success btn-sm" onclick="letter('${list.user_id}')"><i class="far fa-envelope"></i> 쪽지보내기</button></td>
					    </tr>
					</tbody>
				</c:if>
			</c:forEach>
		</table>
	</div>
	<div class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title"><b>쪽지보내기</b></h4>
			</div>
			<div class="modal-body">
				<div class="modal-group">
					<input name="writer" type="hidden" value="${leader.user_id}"/>
				</div>
				<div class="modal-group">
					<label>쪽지내용</label><br/>
					<textarea name="content" placeholder="내용을 입력하세요" style="width:250px;height:100px;overflow-y:hidden"></textarea>
				</div>
			</div><br/>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary btn-sm" id="register">보내기</button>
				<button type="button" class="btn btn-danger btn-sm"id="close">닫기</button>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	
	$(".modal").hide()
	var memberLimit = ${memberLimit}
	const limit = ${limit}
	console.log(memberLimit)
	const group_name = "${leader.group_name}"
	console.log(group_name)

	
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
		if(memberLimit === limit) {
			alert("인원이 초과되었습니다")
			return false;
		}
		console.log(memberLimit)
			
	    $.ajax({
	        url : `/cpage/update/\${member}/\${group_name}`,
	        type : 'post',
	        success : function(data){
	            if(data == "success") location.reload();  
	        }
	    });
	}
	
	function remove(member){
	    $.ajax({
	        url : `/cpage/remove/\${member}/\${group_name}`,
	        type : 'post',
	        success : function(data){
	        	if(data == "success") location.reload();  
	        }
	    });
	}
	
	function deleteMember(member){
	    $.ajax({
	        url : `/cpage/delete/\${member}/\${group_name}`,
	        type : 'post',
	        success : function(data){
	        	if(data == "success") location.reload();  
	        }
	    });
	}


</script>
</html>
