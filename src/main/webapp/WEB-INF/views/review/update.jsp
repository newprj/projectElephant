<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <h1>후기 수정 페이지</h1>
  <body>
    <form action="/review/modify" method="post">
      번호 <input type="text" name="rno" value="${read.rno}" readonly /><br />
      그룹명 <input type="text" name="group_name" value="${read.group_name}" /><br />
      제목 <input type="text" name="title" value="${read.title}" /><br />
      내용 <input type="text" name="content" value="${read.content}" /><br />
      작성자 <input type="text" name="writer" value="${read.writer}" /> <br />
      <input type="file" name="uploadFile" multiple="multiple" /><br />
      <br />
      첨부파일 삭제 :
      <c:forEach items="${attachFile}" var="attachFile">
        <div class="delete" name="${attachFile.uuid}">${attachFile.fileName}</div>
      </c:forEach>
      <br />
      <button type="submit" id="uploadBtn">수정완료</button>
      <button type="button" id="back">홈으로</button>
    </form>
  </body>
  <script>
     var regex = new RegExp('(.*?)\.(exe|sh|alz)$') //정규 표현식
     var maxSize = 10485760 // 10MB 제한

     //파일 사이즈 10MB 초과 또는 파일형식이 정규표현식이 아닌것을 업로드 시 alert창 띄우는 메서드
     function checkExtension(fileName, fileSize) {
       if (fileSize >= maxSize) {
         alert('파일 사이즈 초과')
         return false
       }
       if (regex.test(fileName)) {
         alert('해당 종류의 파일은 업로드 할 수 없습니다. ')
         return false
       }
       return true
     }

     $(document).ready(function (e) {
     	var rno = ${read.rno}
       $('#uploadBtn').click(function (e) {
         var formData = new FormData()
         var inputFile = $("input[name='uploadFile']")
         var files = inputFile[0].files
         console.log(files)
         for (let i = 0; i < files.length; i++) {
           if (!checkExtension(files[i].name, files[i].size)) return false
           formData.append('uploadFile', files[i])
           formData.append('rno', rno)
         }
         $.ajax({
           url: '/reviewUpload/uploadAjaxAction',
           processData: false,
           contentType: false,
           data: formData,
           type: 'POST',
           dataType: 'json',
           success: function (result) {
           },
         })
       })

       $('.delete').on('click', function (e) {
           console.log('여기가 왜 안눌려?')
           var uuid = $(this).attr('name')
           console.log(uuid)
            $.ajax({
         		url:'/reviewUpload/delete',
         		data:{'uuid':uuid},
         		dataType:'text',
         		type:'POST',
         		success:(result)=>{
         			alert(result);
         			location.reload();  
         		}
         	})
         })

    $('#back').click(function () {
        self.location = '/review/list'
     	})
     })
  </script>
</html>
