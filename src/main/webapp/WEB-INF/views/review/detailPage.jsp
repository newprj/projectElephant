<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
<script src="https://kit.fontawesome.com/6584921572.js" crossorigin="anonymous"></script>
<link href="/resources/assets/css/bootstrap.css" rel="stylesheet" />

<link href="/resources/css/style.css" rel="stylesheet" />
<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <style>
    table {
      width: 100%;
    }
    table,
    th,
    td {
      border: 1px solid #bcbcbc;

      height: 50px;
    }
    th {
      color: #fff;
      background-color: #212529;
      border-color: #32383e;
      text-align: center;
    }
    #content {
      height: 500px;
    }
    #a {
      text-align: center;
    }
  </style>
  <body>
    <h2>후기 상세 페이지</h2>
    <hr />
    <div class="container">
      <table class="board_view">
        <label>상세보기</label>
        <colgroup>
          <col width="15%" />
          <col width="35%" />
          <col width="15%" />
          <col width="*" />
        </colgroup>
        <tbody>
          <tr id="a">
            <th>제목</th>
            <td>${detail.title}</td>
            <th>조회수</th>
            <td>${detail.view_count}</td>
          </tr>
          <tr id="a">
            <th>작성자</th>
            <td>${detail.writer}</td>
            <th>작성일</th>
            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${detail.regdate}" /></td>
          </tr>
          <tr id="content">
            <th>내용</th>
            <td colspan="3">${detail.content }</td>
          </tr>
          <tr id="a">
            <th>파일첨부</th>
            <td colspan="3">
              <c:forEach items="${attachFile}" var="attachFile">
                [ <a href="/reviewUpload/download?uuid=${attachFile.uuid}">${attachFile.fileName}</a> ]
              </c:forEach>
              <br />
            </td>
          </tr>
        </tbody>
      </table>
      <div>
        <button type="button" class="update_btn btn btn-warning" id="modifyBtn"><i class="far fa-edit"></i> 수정</button>
        <button type="button" class="btn btn-secondary" id="homeBtn"><i class="fas fa-list"></i> 목록으로</button>
      </div>
      <input type="hidden" id="userCheck" value="${login}" />
      <br />
      <hr />
      <div class="container">
        <div class="replyList"></div>
      </div>

      <div class="form-group">
        <label for="content">댓글작성</label>
        <form name="replyInsertForm">
          <input type="hidden" name="rno" value="${detail.rno}" />
          <textarea name="content" placeholder="내용을 입력하세요" class="form-control"></textarea>
          <span class="input-group-btn">
            <button type="button" name="replyInsertBtn" class="btn btn-outline-info"><i class="far fa-plus-square"></i>등록</button>
          </span>
        </form>
      </div>
    </div>
  </body>
  <script type="text/javascript">

    var user = $('#userCheck').val()
    var rno = '${detail.rno}'
    $("#modifyBtn").hide()
    console.log(`${detail.writer}`)
    if(user==`${detail.writer}`){
    	$("#modifyBtn").show()
    }
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
    				console.log(val.writer)
    				console.log(val.content)
    				str += '<label>댓 글</label> <i class="fas fa-comment-dots"></i><br><div>'+'작성자: '+val.writer+"<br>"+'작성일: '+dateString+" "+timeString+"<br>";
    				str += '<div class="replyContent'+val.cno+'"> <p> 내용 : '+val.content +'</p>';
    				str += '</div></div><br>';
    				str += '<button onclick="updateForm('+val.cno+','+val.content+')"class="update_btn btn btn-warning btn-sm"> 수정 </button>';
    				str += '<button onclick="remove('+val.cno+')" class="update_btn btn btn-danger btn-sm"> 삭제 </button> </div><hr>';
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
        str += '<button type="button" onclick="replyUpdate('+cno+')" class="update_btn btn btn-primary btn-sm">완료</button>';
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
</html>
