<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet" />
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <form>
      그룹명 <input type="text" name="group_name" /><br />
      작성자 <input type="text" name="writer" /><br />
      제목 <input type="text" name="title" /><br />
      <div id="editor" style="max-height: 400px; overflow: auto"></div>
      <br />
      <input type="file" name="uploadFile" multiple="multiple" /><br>
      <hr>
      <button type="button" id="create">등록하기</button>
      <button type="button" id="back">돌아가기</button>
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
    	
      $('#back').click(function () {
        self.location = '/review/list'
      })
   

    /*     ------------------------------------------------------------------------------------------------------------ */

    var myEditor = document.querySelector('#editor')
    let form = $('form')
    // 폼데이터 얻기

    const getData = () => {
      let content = $('input[name="content"]')
      content.val(JSON.stringify(quill.getContents()))
      return content.val()
    }

    const imageHandler = (e) => {
      var rno = 99999999;
      console.log(e)
      let input = $('<input type="file" accept="image/*">')
      input.click()
      $(input).change(function (e) {
        let formData = new FormData()
        let uploadFile = $(input)[0].files[0]
        formData.append('uploadFile', uploadFile)
        formData.append('rno', rno)
        $.ajax({
          type: 'post',
          url: '/upload/uploadAjaxAction',
          processData: false,
          contentType: false,
          data: formData,
          dataType: 'json',

          success: (res) => {
            console.log('2)')
            console.log(res)
            const IMG_URL = '/upload/display?fileName=' + encodeURIComponent(res[0].uploadPath + '/' + res[0].uuid + '_' + res[0].fileName)

            let range = quill.getSelection()
            console.log(range)
            quill.insertEmbed(range, 'image', IMG_URL)
          },
          error: (xhr, status, er) => console.log(xhr),
        }) // ajax
      }) // click
    } //imageHandletr

    

    $('#create').click(function (e) {
      e.preventDefault()
      let attachList
      review = {
        title: $('input[name="title"]').val(),
        content: myEditor.children[0].innerHTML,
        writer: $('input[name="writer"]').val(),
        group_name: $('input[name="group_name"]').val(),
        attachList,
      }
      $.ajax({
        type: 'post',
        url: '/review/insert/',
        data: JSON.stringify(review),
        contentType: 'application/json; charset=utf-8',
        success: () => (location.href = '/review/list'),
        error: (xhr, staturs, er) => {
          console.log(xhr)
        },
      }) //ajax
      var rno = 0;
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
        url: '/upload/uploadAjaxAction',
        processData: false,
        contentType: false,
        data: formData,
        type: 'POST',
        dataType: 'json',
        success: function (result) {},
      })
    }) //click

    const toolbarOptions = [
      [{ header: [1, 2, 3, 4, 5, 6, false] }],
      [{ list: 'ordered' }, { list: 'bullet' }],
      ['bold', 'italic', 'underline', 'strike'],
      [{ color: [] }, { background: [] }],
      [{ align: [] }],
      ['image'],
      ['clean'],
    ]

    let quill = new Quill('#editor', {
      theme: 'snow',
      modules: {
        toolbar: toolbarOptions,
      },
    })

    let toolbar = quill.getModule('toolbar')
    toolbar.addHandler('image', imageHandler)
    })
  </script>
</html>
