<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />

		<link
			href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
			rel="stylesheet"
		/>
		<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
		<script src="//code.jquery.com/jquery-3.6.0.js"></script>
		<script src="/resources/image-resize.min.js"></script>
		<script src="/resources/image-drop.min.js"></script>
		<script src="/resources/js/fileUpload.js" type="text/javascript"></script>

		<title>Insert title here</title>
	</head>
	<body>
		<form>
			<div>
				<label for="title"> 제목 </label>
				<input name="title" type="text" value="${board.title}" />
			</div>
			<div>
				<label for="group_name"> 그룹 이름 </label>
				<input name="group_name" type="text" value="${board.group_name}" />
			</div>
			<div>
				<label for="writer"> 저자 </label>
				<input name="writer" type="text" value="${board.writer}" />
			</div>
			<div>
				<div id="editor" style="max-height: 400px; overflow: auto"></div>
			</div>

			<div class="file">
				<input type="file" name="file" multiple />
			</div>
			<div class="uploadResult">
				<ul></ul>
			</div>
			<div>
				<button class="modify">수정</button>
				<button class="delete">삭제</button>
				<button class="go_board">목록</button>
			</div>
		</form>

		<script>
			$(document).ready(function (e) {
				
				let loginUser= "${user}"
			  	if(! loginUser){
					console.log('로그인안됨')
					alert("로그인 해야 접근 가능합니다")
					location.href="/group/"
				}else{
					console.log("로그인됨")
					$.getJSON(
						"/group/getMemberlistByGroup/${cri.group_name}", (list) =>{
							console.log(list)
							console.log(loginUser)
							let joinCheck = list.find( user => user.user_id === loginUser)
							if(!joinCheck){
								alert("그룹 회원만 접근 가능한 페이지입니다")
								location.href="/group/"
							}else if(loginUser !== "${board.writer}"){
								alert(" 글 작성자만 수정할 수 있습니다")
								history.back()
							}
						})
				}
				
				const uploadClone = $(".file").clone();
				var myEditor = document.querySelector("#editor");
				let content = "${board.content}";
				getFileList("${cri.bno}");

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
							console.log(res);
						},
						error: (xhr, status, er) => console.log(xhr),
					}); //upload ajax
				}); //file change

				$(".uploadResult").on("click", "button", function (e) {
					e.preventDefault();

					let fileName = $(this).data("file");
					let fileType = $(this).data("type");
					let targetLi = $(this).closest("li");
					let uuid = $(this).data("uuid");
					let data = { fileName, fileType };
					attachList = attachList.filter((i) => i.uuid !== uuid);
					console.log(data);
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
				}); //uploadResult의 버튼  click

				const getForm = () => ({
					bno: "${cri.bno}",
					content: myEditor.children[0].innerHTML,
					group_name: $('input[name="group_name"]').val(),
					writer: $('input[name="writer"]').val(),
					title: $('input[name="title"]').val(),
				});

				$(".modify").click(function (e) {
					e.preventDefault();
					console.log(attachList);
					let modified = getForm();
					console.log(modified);
					modified = { ...modified, attachList };
					console.log(modified);
					$.ajax({
						type: "PUT",
						url: "/group/board/${cri.bno}",
						data: JSON.stringify(modified),
						contentType: "application/json; charset=utf-8",
						success: () =>
							(location.href =
								"/group/board/${cri.group_name}/${cri.bno}/${cri.pageNum}/${cri.amount}"),
						error: (xhr, status, er) => {
							console.log(status);
						}, //error
					}); //ajax
				}); // modify c
				$(".delete").click(function (e) {
					e.preventDefault();
					$.ajax({
						type: "delete",
						url: "/group/board/${cri.bno}",
						success: () => {
							location.href =
								"/group/board/${cri.group_name}/${cri.pageNum}/${cri.amount}";
						},
						error: (xhr, status, er) => {
							console.log(status);
						},
					}); //ajax
				}); //delete click
				$(".go_board").click((e) => {
					e.preventDefault();
					location.href =
						"/group/board/${cri.group_name}/${cri.pageNum}/${cri.amount}";
				});

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
				quill.clipboard.dangerouslyPasteHTML(content);
			}); // docu ready
		</script>
	</body>
</html>
