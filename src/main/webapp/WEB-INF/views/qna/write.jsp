<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<script
  src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q & A 등록</title>
</head>
<body>
	<h1>QnA 등록</h1>
	<h3>첨부파일(db 추가), 임시저장,private public 비밀번호</h3>
	<form action="/qna/write" method="post" name="write">
		<div>
			<label for="p_select">구분</label>
			<select id="p_select" onchange="selectOption(this.value);">
				<option value="0">선택</option>
				<option value="public">공개글</option>
				<option value="private">비밀글</option>			
			</select>
		</div>
		<div>
			<label for="pwd">비밀번호</label>
			<input type="password" id="pwd" name="pwd"/> 
		</div>
		<div>
			<label for="title">제목</label>
			<input type="text" name="title"/> 
		</div>
		<div>
			<label for="writer">글쓴이</label>
			<input type="text" name="writer"/> 
		</div>
		<div>
			<label for="q_content">내용</label>
			<textarea name="q_content"></textarea>
		</div>
		
		<button >임시저장(될까?)</button>
		<button id="sbtn" type="submit">등록</button>
		<button type="button" onclick="location.href='/qna/list'">취소</button>
		
	</form>
</body>

<script type="text/javascript">
	var today=new Date()
	
	console.log(today)	
	var choice=''
	var p=''
	var selectOption=function(value){
		if(value=='private')
			$("#pwd").attr("disabled",false)
		else
			$("#pwd").attr("disabled",true)
		p=value
		choice="<input type='hidden' name='p_group' id='p_group' value='"+value+"'/>"
		console.log(choice)
		console.log(p)
		console.log($("#pwd").val())
	}
	
	
	$(document).ready(function () {
		
		
		
		$("#sbtn").click(function(e){
			if(p=='private' && $("#pwd").val()==''){
				e.preventDefault();
				alert('비밀번호를 입력하세요')
				$("#pwd").focus()
			}
			else{
				e.preventDefault();
				$("form").append(choice);
				$("form").append("<input type='hidden' name='reg_date' pattern ='yy/MM/dd hh:mm' value='"+today+"'>");
				$("form").submit()
			}
			
		})
		
	})
	
</script>
</html>