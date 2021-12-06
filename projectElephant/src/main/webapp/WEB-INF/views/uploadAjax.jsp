<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>ajax로 파일 업로드</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  </head>
  <body>
    <h1>파일 업로드</h1>
    <div class="uploadDiv">
     
    </div>
    <script>
      var regex = new RegExp('(.*?)\.(exe|sh|alz)$') //정규 표현식
      var maxSize = 10485760 // 10MB 제한
      
      //파일 사이즈 10MB 초과 또는 파일형식이 정규표현식이 아닌것을 업로드 시 alert창 띄우는 메서드 
      function checkExtension(fileName, fileSize) {
        //확장자 체크함수 정의
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
        var cloneObj = $('.uploadDiv').clone()
            
        $('#uploadBtn').click(function (e) {
          var formData = new FormData()
          var inputFile = $("input[name='uploadFile']")
          var files = inputFile[0].files
          console.log(files)
          //formData에 파일 목록 추가
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
              showUploadFile(result) 
              $('.uploadDiv').html(cloneObj.html())
            },
          }) 
        }) //#uploadBtn
      })
    </script>
  </body>
</html>
