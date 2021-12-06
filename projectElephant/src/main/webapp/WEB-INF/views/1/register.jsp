<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <form action="/review/insert" method="post">
      그룹명 <input type="text" name="group_name" /><br />
      제목 <input type="text" name="title" /><br />
      내용 <input type="text" name="content" /><br />
      작성자 <input type="text" name="writer" /><br />
    <input type="file" name="uploadFile" multiple="multiple" />
    <button type="button" id="uploadBtn">파일업로드</button><br>
    <button type="submit">등록하기</button>
    </form>
  </body>
  <script>
    var regex = new RegExp('(.*?)\.(exe|sh|zip|alz)$') //정규 표현식
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
      $('#uploadBtn').click(function (e) {
        var formData = new FormData()
        var inputFile = $("input[name='uploadFile']")
        var files = inputFile[0].files
        console.log(files)
        for (let i = 0; i < files.length; i++) {
          if (!checkExtension(files[i].name, files[i].size)) return false
          formData.append('uploadFile', files[i])
        }
        $.ajax({
          url: '/uploadAjaxAction',
          processData: false,
          contentType: false,
          data: formData,
          type: 'POST',
          dataType: 'json',
          success: function (result) {
          },
        })
      }) 
    })
  </script>
</html>
