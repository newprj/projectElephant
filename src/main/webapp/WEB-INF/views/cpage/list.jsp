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
				<button type="button">쪽지보내기</button>
				<button type="button">회원정보</button><br> 
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
			<button type="button"  >쪽지보내기</button>
			<button type="button">회원정보</button><br> 
		</c:if>
	</c:forEach>
</body>
<script type="text/javascript">

var memberLimit = ${memberLimit}
console.log(memberLimit)


$(".memberLimit").append("<p> 모집인원 : " + memberLimit + " / 5 </p>")
	
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
