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
${group_name}
	<div class="board">
      <form>
        
        <div>
          <label>title</label>
          <input name="title" />
        </div>
        <div>
          <label>writer</label>
          <input name="writer" />
        </div>
        <div>
          <label> content </label>
          <textarea name="content"></textarea>
        </div>
        <button class="create">입력</button>
        <button type="reset">리셋</button>
      </form>
    </div>

     <script>
	
	$('.create').click(function(e){
			e.preventDefault()
			board = {
				title: $('input[name="title"]').val(),
	            content: $('textarea[name="content"]').val(),
	            writer : $('input[name="writer"]').val(),
	            group_name:'${group_name}'
			}
			$.ajax({
				type:'post',
				url : "/group/board/",
				data : JSON.stringify(board),
				contentType: 'application/json; charset=utf-8',
				success : () => location.href = "/group/board/${group_name}",
				error:(xhr, staturs, er) =>{
					console.log(xhr)
				}
			})//ajax
		})//click
		

	
	</script>
</body>
</html>