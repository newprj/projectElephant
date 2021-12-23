<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="/resources/assets/css/bootstrap.css" rel="stylesheet">
<link href="/resources/assets/css/bootstrap-theme.css" rel="stylesheet">

<link href="/resources/assets/css/simple-line-icons.css" rel="stylesheet">
<link href="/resources/stylesheets/responsive-nav.css" rel="stylesheet">
<link href="/resources/stylesheets/responsive-nav.css" rel="stylesheet">
<link href="/resources/stylesheets/quotes.css" rel="stylesheet">
<link href="/resources/stylesheets/services.css" rel="stylesheet">
<link href="/resources/stylesheets/animate.css" rel="stylesheet">
<link href="/resources/stylesheets/effects.css" rel="stylesheet">
<link href="/resources/stylesheets/jquery.easy-pie-chart.css" rel="stylesheet">
<link href="/resources/stylesheets/sidemenu.css" rel="stylesheet">
<link href="/resources/stylesheets/slidingmenu.css" rel="stylesheet">
<link href="/resources/stylesheets/metro-panel.css" rel="stylesheet">
<link href="/resources/stylesheets/style.css" rel="stylesheet">
<script src="/resources/javascripts/modernizr.custom.menu.js"></script>
<script src="/resources/javascripts/modernizr.custom.quotes.js"></script>
<script src="/resources/javascripts/modernizr.custom.services.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>	
</head>
<body>
	<div class="row">
	    <article class="col-md-12 text-left">
	      <h2 class="page-heading">후기 상세 페이지</h2>
	      <div class="liner"><span></span></div>
	    </article>
	</div>
	<div class="container">
			<section id="container">				
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">제목</label>
					<input type="text" id="title" name="title" class="form-control" value="${detail.title}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">내용</label><br>
					${detail.content}" 
				</div>
				<div class="form-group">
					<label for="writer" class="col-sm-2 control-label">작성자</label>
					<input type="text" id="writer" name="writer" class="form-control" value="${detail.writer}"  readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="group_name" class="col-sm-2 control-label">그룹명</label>
					<input type="text" id="group_name" name="group_name" class="form-control" value="${detail.group_name}"  readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
					<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${detail.regdate}"/>	
				</div>
				<div class="form-group">
					<label for="attachFile" class="col-sm-2 control-label">첨부파일</label>
					<c:forEach items="${attachFile}" var="attachFile">
						[ <a href="/reviewUpload/download?uuid=${attachFile.uuid}">${attachFile.fileName}</a> ]
					</c:forEach> <br>
				</div>
				<div>
					<button type="button" class="update_btn btn btn-warning" id="modifyBtn">수정</button>
					<button type="button" class="list_btn btn btn-primary"id="homeBtn">목록</button>	
				</div>
				<input type="hidden" id="userCheck" value='${login}'>
		
				<br>
				<div class="container">
					<label>댓 글 </label>
					<div class="replyList"></div>
				</div>
				<div class="form-group">
					<label for="content">댓글</label>
						<form name="replyInsertForm">
							<input type="hidden" name="rno" value="${detail.rno}"/>
							<input type="text" name="content" placeholder="내용을 입력하세요" class="form-control"/>
							<span class="input-group-btn">
								<button type="button" name="replyInsertBtn" class="btn btn-primary">등록</button>
							</span>
						</form>
				</div>
				</section>
		</div>
	
</body>
<script type="text/javascript">
	
	var user = $('#userCheck').val()
	var rno = '${detail.rno}'
	
	$('[name=replyInsertBtn]').click(function(){
		if($('[name=content]').val()==""){
		alert("내용을 입력해 주세요")
		return false;
		}
		var insertData = $('[name=replyInsertForm]').serialize();
		replyInsert(insertData);
	})
	$('#modifyBtn').click(function () {
	    location.href = '/review/update?no='+${detail.rno}
    }) 
  
    $('#homeBtn').click(function () {
	    location.href = '/review/list'
    }) 
    
    $('[name=content]').click(function(){
    	if(user == "cantLogin"){
			alert("로그인 후 이용해주세요")
			return false;
		}
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