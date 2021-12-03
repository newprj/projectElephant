<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Insert title here</title>
		<script src="//code.jquery.com/jquery-3.6.0.js"></script>
	<style>
		.hidden{
			display : none;
		}
	</style>
	
	</head>
	<body>
		
<form method="post" action="./make">
	
		<div>
				<label for=""> 그룹 이름 </label>
				<input type="text" name="group_name" required>
			</div>
			<div>
				<span class="duplicated hidden">중복된 이름입니다 </span>
				<span class="unduplicated hidden">사용 가능한 이름입니다 </span>
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
			<div class="submit">
				<button type="submit" disabled="disabled">생성</button>
			</div>
	
</form>
	</body>

	<script>
	$(document).ready(function (e) {
		let result
		
		$('input[name="group_name"]').on('propertychange change keyup paste input', function(e){
			
			let group_name = $('input[name="group_name"]').val()
			let data = {group_name}
			
			$.ajax({
				type:'post',
				url : '/group/duplicateCheck',
				data : data,
				success : (res) => {
					result= res
					if(res === "duplicated"){
						$('.unduplicated').addClass('hidden')
						$('.duplicated').removeClass('hidden')
						$('.submit > button').attr('disabled', true)
					}
					else{
						$('.duplicated').addClass('hidden')
						$('.unduplicated').removeClass('hidden')
						$('.submit > button').attr('disabled', false)
					}
				}
			})//ajax
		})//namecheck
	});//docu ready
	</script>
</html>


