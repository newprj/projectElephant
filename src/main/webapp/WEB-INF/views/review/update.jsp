<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet" />
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script src="/resources/js/fileUpload.js" type="text/javascript"></script>
<link href="/resources/css/style.css" rel="stylesheet" />
<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
  <div class="row">
	    <article class="col-md-12 text-left">
	      <h2 class="page-heading">후기 수정 페이지</h2>
	      <div class="liner"><span></span></div>
	    </article>
	</div>
  <form>
  	<div class="container">
			<section id="container">				
				<div class="form-group">
					<label for="rno" class="col-sm-2 control-label">번호</label>
					<input type="text" id="rno" name="rno" class="form-control" value="${read.rno}" readonly/>
				</div>
				<div class="form-group">
					<label for="group_name" class="col-sm-2 control-label">그룹명</label>
					<input type="text" id="group_name" name="group_name" value="${read.group_name}" class="form-control"/>
				</div>
				<div class="form-group">
					<input type="hidden" name="writer" value="${login}"/>
				</div>
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">제목</label>
					<input type="text" id="title" name="title" value="${read.title}" class="form-control"/>
				</div>
				<div class="form-group">
					<div id="editor" style="max-height: 400px; overflow: auto"></div>
				</div>
				<div class="form-group">
					<input type="file" name="uploadFile" multiple />
				</div>
				<div class="form-group">
					<label for="attachFile" class="col-sm-2 control-label">첨부파일</label>
					<c:forEach items="${attachFile}" var="attachFile">
						[ <a href="/reviewUpload/download?uuid=${attachFile.uuid}">${attachFile.fileName}</a> ]
					</c:forEach> 
				</div>
				<div class="form-group">
					<label for="attachFileDelete" class="col-sm-2 control-label">첨부파일 삭제</label>
					<c:forEach items="${attachFile}" var="attachFile">
				        <div class="delete" name="${attachFile.uuid}">${attachFile.fileName}</div>
				     </c:forEach>
				</div>
				<div>
					<button type="button" id="update" class="btn btn-primary">등록하기</button>
     				<button type="button" class="btn btn-primary" onclick="location.href='/review/list'">목록</button>
				</div>
			</section>
		</div>
	</form> 
  </body>
  <script>
    var regex = new RegExp('(.*?)\.(exe|sh|alz)$') //정규 표현식
    var maxSize = 10485760 // 10MB 제한
    //파일 사이즈 10MB 초과 또는 파일형식이 정규표현식이 아닌것을 업로드 시 alert창 띄우는 메서드
    function checkExtension1(fileName, fileSize) {
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
    var myEditor = document.querySelector('#editor')
    let form = $('form')
    // 폼데이터 얻기
    $(document).ready(function (e) {
      $("input[type='file']").change(function (e) {
        attachList = []
        var formData = new FormData()
        var inputFile = $("input[name='uploadFile']")
        var files = inputFile[0].files
        console.log(files)
        for (let i = 0; i < files.length; i++) {
          if (!checkExtension1(files[i].name, files[i].size)) return false
          formData.append('uploadFile', files[i])
        }
        $.ajax({
          url: '/reviewUpload/uploadAjaxAction',
          processData: false,
          contentType: false,
          data: formData,
          type: 'POST',
          dataType: 'json',
          success: function (result) {
            console.log(result)
            showUploadFile(result)
            
          },
          error: function () {
            alert('실패')
          },
        }) //ajax
      }) //file change
      $('#update').click(function (e) {
        e.preventDefault()
        review = {
          rno: $('input[name="rno"]').val(),
          title: $('input[name="title"]').val(),
          content: myEditor.children[0].innerHTML,
          writer: $('input[name="writer"]').val(),
          group_name: $('input[name="group_name"]').val(),
          attachList,
        }
        $.ajax({
          type: 'post',
          url: '/review/modify',
          data: JSON.stringify(review),
          contentType: 'application/json; charset=utf-8',
          success: () => (location.href = '/review/list'),
          error: (xhr, staturs, er) => {
            console.log(xhr)
          },
        }) //ajax
      }) //click
      $('.delete').on('click', function (e) {
        console.log('여기가 왜 안눌려?')
        var uuid = $(this).attr('name')
        console.log(uuid)
        $.ajax({
          url: '/reviewUpload/delete',
          data: { uuid: uuid },
          dataType: 'text',
          type: 'POST',
          success: (result) => {
            alert(result)
            location.reload()
          },
        })
      })
      const imageHandler = (e) => {
        console.log(e)
        let input = $('<input type="file" accept="image/*">')
        input.click()
        $(input).change(function (e) {
          let formData = new FormData()
          let uploadFile = $(input)[0].files[0]
          formData.append('uploadFile', uploadFile)
          $.ajax({
            type: 'post',
            url: '/reviewUpload/uploadAjaxAction',
            processData: false,
            contentType: false,
            data: formData,
            dataType: 'json',
            success: (res) => {
              console.log('2)')
              console.log(res)
              const IMG_URL =
                '/reviewUpload/display?fileName=' + encodeURIComponent(res[0].uploadPath + '/' + res[0].uuid + '_' + res[0].fileName)
              let range = quill.getSelection()
              console.log(range)
              quill.insertEmbed(range, 'image', IMG_URL)
            },
            error: (xhr, status, er) => console.log(xhr),
          }) // ajax
        }) // click
      } //imageHandletr
    
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
    $.getJSON('/review/getReview/${read.rno}', (res) => {
      let content = res.content
      quill.container.firstChild.innerHTML = content
    })
    let toolbar = quill.getModule('toolbar')
    toolbar.addHandler('image', imageHandler)
    })
  </script>
</html>