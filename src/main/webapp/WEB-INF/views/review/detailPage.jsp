<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h1>후기 게시판 상세 페이지</h1>
<body>
	번호 : ${detail.rno}<br>
	작성자 : ${detail.writer}<br>
	모임명 : ${detail.group_name}<br>
	제목 : ${detail.title}<br>
	내용 : ${detail.content}<br>
	작성일 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${detail.regdate}"/><br>
	첨부파일 : <c:forEach items="${attachFile}" var="attachFile">
		[ <a href="/reviewUpload/download?uuid=${attachFile.uuid}">${attachFile.fileName}</a> ]
	</c:forEach> <br>
	<button type="button" id="modifyBtn">수정</button>
	<button type="button" id="homeBtn">후기 홈으로</button>
	<hr>
	<div class="container">
		<label for="content">댓글</label>
		<form name="replyInsertForm">
			<input type="hidden" name="rno" value="${detail.rno}"/>
			<input type="text" name="content" placeholder="내용을 입력하세요"/>
			<span class="input-group-btn">
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
	$('#modifyBtn').click(function () {
	    location.href = '/review/update?no='+${detail.rno}
    }) 
  
    $('#homeBtn').click(function () {
	    location.href = '/review/list'
    }) 
    	
    	
	function replyList(){
		$.ajax({
			url : '/reply/list',
			type:'get',
			data:{'rno':rno},
			success: function(data){
				var str='';
				$.each(data,function(key,val){
					var timestamp = val.regdate;
					var date = new Date(timestamp);
					var year = date.getFullYear();
					var month = ('0' + (date.getMonth() + 1)).slice(-2);
					var day = ('0' + date.getDate()).slice(-2);
					var dateString = year + '-' + month  + '-' + day; 
					var hours = ('0' + date.getHours()).slice(-2); 
					var minutes = ('0' + date.getMinutes()).slice(-2);
					var seconds = ('0' + date.getSeconds()).slice(-2); 
					var timeString = hours + ':' + minutes  + ':' + seconds;
					str += '<div>'+'no.'+val.cno+' / 작성자 : '+val.writer+" / " +'작성일: '+dateString+" "+timeString+ " /";
					str += '<a onclick="updateForm('+val.cno+',\''+val.content+'\');"> 수정 / </a>';
					str += '<a onclick="remove('+val.cno+');"> 삭제 </a> </div>';
					str += '<div class="replyContent'+val.cno+'"> <p> 내용 : '+val.content +'</p>';
					str += '</div></div>';
				})
				$(".replyList").html(str)
			}
		})//아작스 끝
	}//댓글 리스트 메서드 끝
	
	//댓글 등록
	function replyInsert(insertData){
	    $.ajax({
	        url : '/reply/insert',
	        type : 'post',
	        data : insertData,
	        success : function(data){
	            if(data == 1) {
	            	replyList(); //댓글 작성 후 댓글 목록 reload
	                $('[name=content]').val(''); // 초기화
	            }
	        }
	    });
	}
	
	//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
	function updateForm(cno, content){
	    var str ='';  
	    str += '<div class="input-group">';
	    str += '<input type="text" name="content_'+cno+'" value="'+content+'"/>';
	    console.log(cno)
	    str += '<span class="input-group-btn"><button type="button" onclick="replyUpdate('+cno+');">수정</button> </span>';
	    str += '</div>';
	    $('.replyContent'+cno).html(str);
	    
	}
	 
	//댓글 수정
	function replyUpdate(cno){
	    var updateContent = $('[name=content_'+cno+']').val();
	    
	    $.ajax({
	        url : '/reply/update',
	        type : 'post',
	        data : {'content' : updateContent, 'cno' : cno},
	        success : function(data){
	            if(data == 1) replyList(rno); //댓글 수정후 목록 출력 
	        }
	    });
	}

	//댓글삭제
	function remove(cno){
	    $.ajax({
	        url : '/reply/delete/'+cno,
	        type : 'post',
	        success : function(data){
	            if(data == 1) replyList(rno); //댓글 삭제후 목록 출력 
	        }
	    });
	}
	
	$(document).ready(function(){
		replyList()
	});
	 

	
</script>