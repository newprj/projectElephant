<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="./navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<style>
	.container{
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
	}
	.box{
		border : 1px solid grey;
		border-radius: 10px;
		width: 200px;
		height: 200px;
		padding: 10px;
		margin: 10px;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;

	}
	.box>span{
		display: block;
	}
	
</style>
<title>Insert title here</title>
</head>
<body>
<a href="/group/make">
	<button> create </button>
	</a>
	<button> 내 그룹 보기 </button>
	<span> 모집 중인 그룹 </span>
	<div class="container">

		<c:forEach items="${group}" var="group">
			<div class="box">
				<span class="group_name" > ${group.group_name} </span>
				<span> ${group.leader}</span>
				<span> ${group.subject }</span>
				<span> ${group.member_number}</span>
			</div>
		</c:forEach>
		<form method="get" action="./detail">
			<input type="hidden" name="group_name">
		</form>
	</div>
	
</body>

	<script>
		$(document).ready(function(e){

			$('.group_name').click(function(e){
				console.log(e.target.innerText)
				$('input').val(e.target.innerText)
				$('form').submit()
			})
		})
	</script>
</html>
