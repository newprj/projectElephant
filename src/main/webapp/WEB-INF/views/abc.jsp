<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Insert title here</title>
		<link
			href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
			rel="stylesheet"
		/>
		<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
		<script src="//code.jquery.com/jquery-3.6.0.js"></script>
	</head>
	<body>
	<h1> 테스트용 페이지 </h1>
	해당페이지는 /aaa 로 접근 가능한 페이지로 테스트용 페이지 입니다 
	홈컨트롤러에 매핑되어 있어요
	
	<h5>	자유롭게 수정가능</h5>

		<script>
		const today = new Date().toISOString().split("T")[0]
		console.log("hhhh")
		console.log(today)
	
		$.getJSON("/group/getLatestEvent/그룹이름", (list) => {
			
			 list.filter(i => i.startDate === today).map(console.log)
		})
		
	
		
		</script>
	</body>
</html>
