<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	${one}
	<button> 삭제 </button>
</body>
<script>
	const deleteGroup = () => {
		
	}
	
	$(document).ready(function(e){
		$('button').click(function(e){
			$.ajax({
				type : "delete",
				url : "/group/"+'${one.group_name}',
				success: () => {
					location.href="/group/main"
				},
				error: (xhr, status, er) => {
					console.log(status)

				} 
			})
		})
	})
	
</script>

</html>


