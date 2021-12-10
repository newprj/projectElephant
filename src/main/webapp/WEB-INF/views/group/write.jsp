<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Insert title here</title>

		<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
		<script src="//code.jquery.com/jquery-3.6.0.js"></script>
		<link
			href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
			rel="stylesheet"
		/>
		<script src="/resources/image-resize.min.js"></script>
		<script src="/resources/image-drop.min.js"></script>
		<script src="/resources/js/fileUpload.js" type="text/javascript"></script>
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
				var myEditor = document.querySelector("#editor");

				const uploadClone = $(".file").clone();

				// input file이 변할때
				$('input[type="file"]').change(function (e) {
					let formData = new FormData();
					let uploadFiles = $('input[name="file"]')[0].files;
					let files = Object.values(uploadFiles);
					files
						.filter((file) => checkExtension(file.name, file.size))
						.map((file) => formData.append("uploadFile", file));
					$.ajax({
						type: "post",
						url: "/upload",
						processData: false,
						contentType: false,
						data: formData,
						dataType: "json",
						success: (res) => {
							$(".file").html(uploadClone.html());
							showUploadFile(res);
						},
						error: (xhr, status, er) => console.log(xhr),
					}); //upload ajax
					// 업로드한 파일 삭제할경우
					$(".uploadResult").on("click", "button", function (e) {
						e.preventDefault();
						let fileName = $(this).data("file");
						let fileType = $(this).data("type");
						let targetLi = $(this).closest("li");
						let uuid = $(this).data("uuid");
						let data = {
							fileName,
							fileType,
						};
						attachList = attachList.filter((i) => i.uuid !== uuid);
						$.ajax({
							url: "/delete",
							type: "post",
							data: data,
							dataType: "text",
							success: (res) => {
								console.log(res);
								targetLi.remove();
							},
						});
					}); //uploadResult click
				}); //file
				// 글 작성
				$(".create").click(function (e) {
					e.preventDefault();
					board = {
						title: $('input[name="title"]').val(),
						content: myEditor.children[0].innerHTML,
						writer: $('input[name="writer"]').val(),
						group_name: "${group_name}",
						attachList,
					};
					console.log(board);
					$.ajax({
						type: "post",
						url: "/group/board/",
						data: JSON.stringify(board),
						contentType: "application/json; charset=utf-8",
						success: () => (location.href = "/group/board/${group_name}"),
						error: (xhr, staturs, er) => {
							console.log(xhr);
						},
					}); //ajax
				}); //click

				const imageHandler = (e) => {
					console.log(e);
					let input = $('<input type="file" accept="image/*">');
					input.click();
					$(input).change(function (e) {
						let formData = new FormData();
						let uploadFile = $(input)[0].files[0];

						formData.append("uploadFile", uploadFile);

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
								const IMG_URL =
									"/display?fileName=" +
									encodeURIComponent(
										res[0].uploadPath +
											"/" +
											res[0].uuid +
											"_" +
											res[0].fileName
									);

								let range = quill.getSelection();
								console.log(range);
								quill.insertEmbed(range, "image", IMG_URL);
							},
							error: (xhr, status, er) => console.log(xhr),
						}); // ajax
					}); // click
				}; //imageHandletr

				const toolbarOptions = [
					[{ header: [1, 2, 3, 4, 5, 6, false] }],
					[{ list: "ordered" }, { list: "bullet" }],
					["bold", "italic", "underline", "strike"],
					[{ color: [] }, { background: [] }],
					[{ align: [] }],
					["image"],
					["clean"],
				];
				let quill = new Quill("#editor", {
					theme: "snow",
					modules: {
						toolbar: toolbarOptions,
						imageDrop: true,
						imageResize: {
							displaySize: true,
						},
					},
				});

				let toolbar = quill.getModule("toolbar");
				toolbar.addHandler("image", imageHandler);
			}); // docu ready
		</script>
	</body>
</html>
