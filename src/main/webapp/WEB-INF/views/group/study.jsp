<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Insert title here</title>
		<script src="//code.jquery.com/jquery-3.6.0.js"></script>
	</head>
	<body>
		<h1>스터디별 페이지</h1>
		${group_name}

		<div>
			<a href="/group/board/${group_name}"> 게시판 </a>
		</div>
		<a href="/group/test/${group_name}"> 일정 </a>
		<p><a href="/group/"> 메인 </a></p>
	</body>

	<script>
		let loginUser = "${user}"
		
		if(! loginUser){
			console.log('로그인안됨')
			alert("로그인 해야 접근 가능합니다")
			location.href="/group/"
		}else{
			$.getJSON(
				"/group/getMemberlistByGroup/${group_name}", (list) =>{
					console.log(list)
					console.log(loginUser)
					let joinCheck = list.find( user => user.user_id === loginUser)
					if(!joinCheck){
						alert("그룹 회원만 접근 가능한 페이지입니다")
						location.href="/group/"
					} 
				})
		}
		
		
	
		
	</script>
</html>
