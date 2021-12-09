<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link
			href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
			rel="stylesheet"
		/>
		<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
		<script src="//code.jquery.com/jquery-3.6.0.js"></script>
		<script src="/resources/image-resize.min.js"></script>
		<script src="/resources/image-drop.min.js"></script>
	
		
    <script src="/resources/js/fileUpload.js" type="text/javascript"></script>
    <script src="/resources/js/quill.js" type="text/javascript"></script>
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
          <div id="editor" style="max-height: 400px; overflow: auto"></div>
        </div>
        <div class="file">
          <input type="file" name="file" multiple />
        </div>
        <div class="uploadResult">
          <ul></ul>
        </div>
        <button class="create">입력</button>
        <button type="reset">리셋</button>
      </form>
    </div>

    <script>
      $(document).ready(function (e) {
        
		
        const uploadClone = $('.file').clone()
		
        // input file이 변할때
        $('input[type="file"]').change(function (e) {
          let formData = new FormData()
          let uploadFiles = $('input[name="file"]')[0].files
          let files = Object.values(uploadFiles)
          files.filter((file) => checkExtension(file.name, file.size)).map((file) => formData.append('uploadFile', file))
          $.ajax({
            type: 'post',
            url: '/upload',
            processData: false,
            contentType: false,
            data: formData,
            dataType: 'json',
            success: (res) => {
              $('.file').html(uploadClone.html())
              showUploadFile(res)
            },
            error: (xhr, status, er) => console.log(xhr),
          }) //upload ajax
          // 업로드한 파일 삭제할경우
          $('.uploadResult').on('click', 'button', function (e) {
            e.preventDefault()
            let fileName = $(this).data('file')
            let fileType = $(this).data('type')
            let targetLi = $(this).closest('li')
            let uuid = $(this).data('uuid')
            let data = {
              fileName,
              fileType,
            }
            attachList = attachList.filter((i) => i.uuid !== uuid)
            $.ajax({
              url: '/delete',
              type: 'post',
              data: data,
              dataType: 'text',
              success: (res) => {
                console.log(res)
                targetLi.remove()
              },
            })
          }) //uploadResult click
        }) //file
        // 글 작성
        $('.create').click(function (e) {
          e.preventDefault()
          board = {
            title: $('input[name="title"]').val(),
            content: myEditor.children[0].innerHTML,
            writer: $('input[name="writer"]').val(),
            group_name: '${group_name}',
            attachList,
          }
          console.log(board)
          $.ajax({
            type: 'post',
            url: '/group/board/',
            data: JSON.stringify(board),
            contentType: 'application/json; charset=utf-8',
            success: () => (location.href = '/group/board/${group_name}'),
            error: (xhr, staturs, er) => {
              console.log(xhr)
            },
          }) //ajax
        }) //click
      }) // docu ready
    </script>
  </body>
</html>