<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
	</head>
	<body>
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
					<input type="text" name="content" />
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
		<input type="file" accept="image/*" />

		<script>

			const toolbarOptions = [
							[{ header: [1, 2, 3, 4, 5, 6, false] }],
			        [{ 'list': 'ordered'}, { 'list': 'bullet' }],
							["bold", "italic", "underline", "strike"],
							[{ color: [] }, { background: [] }],
							[{ align: [] }],
							["link", "image"],
							["clean"],
						];

				var quill = new Quill("#editor", {
					theme: "snow",
					modules: {
						toolbar: toolbarOptions,
					},
				});

				var form = $('form')
				const getData = () => {
					let content = $('input[name="content"]')
					content.val(JSON.stringify(quill.getContents()))
					console.log(content.val())
				}
				$('button.ql-image').click(function(e){
					e.preventDefault
					console.log(' 눌렸어 ')
					getImage()
				}) 
				const getImage = () => {
					let input = $('<input type="file" accept="image/*">')
					input.click()
					$(input).change(function(e){
						
						let formData = new FormData();
						let uploadFiles = $(input)[0].files;
						let files = Object.values(uploadFiles);
						files
							.map((file) => formData.append("uploadFile", file));
						$.ajax({
							type: "post",
							url: "/upload",
							processData: false,
							contentType: false,
							data: formData,
							dataType: "json",
							
							success: (res) => {
								console.log("2)");
								console.log(res);
								const IMG_URL = encodeURIComponent(
								res.uploadPath + "/" + res.uuid + "_" + res.fileName
								);
								// const editor = $('#editor')
								// const range = editor.getSelection()
								// editor.insertEmbed(range, 'image', IMG_URL);


								},
							error: (xhr, status, er) => console.log(xhr),
					})
				})
			}

				$('.create').click(function(e){
					e.preventDefault();
					getData()
				})
		</script>
	</body>
</html>
