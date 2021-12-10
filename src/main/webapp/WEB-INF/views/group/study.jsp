<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Insert title here</title>
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
		console.log(" group name ${group_name}");
		console.log("cri ${cri.group_name}");
	</script>
</html>
