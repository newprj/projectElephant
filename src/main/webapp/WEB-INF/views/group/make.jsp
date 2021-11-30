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
		
<form method="post" action="./make">
	
		<div>
				<label for=""> 그룹 이름 </label>
				<input type="text" name="group_name">
			</div>
			<div>
				<label for=""> 리더 </label>
				<input type="text" name="leader">
			</div>
			<div>
				<label for=""> 주제 </label>
				<input type="text" name="subject" >
			</div>
			<div>
				<label for=""> 모집 인원 </label>
				<input type="number" name="member_number">
			</div>
			<div>
				<label for=""> 상세 설명 </label>
				<textarea name="description"></textarea>
			</div>
			<div>
				<button type="submit">생성</button>
			</div>
	
</form>
	</body>

	<script>
	$(document).ready(function (e) {
		let group = {};
		
		});
	});
	</script>
</html>


