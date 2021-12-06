<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	번호 : ${detail.rno}<br>
	모임명 : ${detail.group_name}<br>
	제목 : ${detail.title}<br>
	내용 : ${detail.content}<br>
	작성자 : ${detail.writer}<br>
	작성일 : ${detail.regdate}<br>
	<a href="update?no=${detail.rno}">수정하기</button>
	<br>
	<div class="container">
		<label for="content">댓글</label>
		<form name="replyInsertForm">
			<input type="hidden" name="rno" value="${detail.rno}"/>
			<input type="text" name="content" placeholder="내용을 입력하세요">
			<span class="input-group-byn">
				<button type="button" name="replyInsertBtn">등록</button>
			</span>
		</form>
	</div>
	<div class="container">
		<div class="replyList"></div>
	</div>
	
</body>
<script type="text/javascript">
	var rno = '${detail.rno}'
	
	$('[name=replyInsertBtn]').click(function(){
		var insertData = $('[name=replyInsertForm]').serialize();
		replyInsert(insertData);
	})

	const replyList = () =>{
		$.ajax({
			url : '/reply/list',
			type:'get',
			data:{'rno':rno},
			success: function(data){
				var str='';
				$.each(data,function(key,value){
					str += '<div class="replyArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
					str += '<div class="replyInfo'+value.cno+'">'+'댓글번호 : '+value.cno+' / 작성자 : '+value.writer;
					str += '<a onclick="modify('+value.cno+',\''+value.content+'\');"> 수정 </a>';
					str += '<a onclick="remove('+value.cno+');"> 삭제 </a> </div>';
					str += '<div class="replyContent'+value.cno+'"> <p> 내용 : '+value.content +'</p>';
					str += '</div></div>';

					str +='<div class="replyArea" style="border-bottom:1px solid darkgray; margin bottom: 15px">';
					str += '<div class="replyInfo'+value.cno+'">'+'댓글번호 : '+value.cno+' / 작성자 : '+value.writer;
					str += '<a onclick="modify('+value.cno+',\''+value.content+'\');">수정</a>';
					str += '<a onclick="remove('+value.cno+');">삭제</a> </div>';
					str += '<div class="replyContent'+value.cno+'"><p> 내용 : 'value.content'</p>';
					str += '</div></div>'
				})
				$(".replyList").html(str);
			}
		})
	}
</script>
</html>