<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link
			href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
			rel="stylesheet"
		/>
		<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
		<meta charset="UTF-8" />
		<title>Insert title here</title>
	</head>
	<body>
		<br /><br />
		<div id="editor" style="max-height: 400px; overflow: auto">
			<p>Click on the Image Below to resize</p>
			<p><img src="https://source.unsplash.com/random/200x200" /></p>
			<p>Some initial <strong>bold</strong> text</p>
			<p><img src="https://source.unsplash.com/random/400x400" /></p>
		</div>
		<p>
			Also see
			<a href="https://github.com/kensnyder/quill-image-drop-module"
				>quill-image-drop-module</a
			>, a module that enables copy-paste and drag/drop for Quill.
		</p>

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

			let quill = new Quill("#editor", {
				modules: {
					toolbar: {
						toolbar: toolbarOptions,
					},
				},
			});
		</script>
	</body>
</html>
