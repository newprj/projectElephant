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
		<style>
			div.uploadResult > ul > li > div > img {
				width: 50px;
				height: 50px;
				border-radius: 50%;
			}
		</style>
	</head>
	<body>
		<form>
			<div>
				<label for="title"> 제목 </label>
				<input name="title" type="text" value="${board.title}" />
			</div>
			<div>
				<label for="group_name"> 그룹 이름 </label>
				<input name="group_name" type="text" value="${board.group_name}" readonly/>
			</div>
			<div>
				<label for="writer"> 저자 </label>
				<input name="writer" type="text" value="${board.writer}" readonly/>
			</div>
			<div>
					<label>공지사항 </label>
					<input type="checkbox" name="notice" value="${board.notice}"/>
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
				let loginUser = "${user}";
			
			
					$.getJSON("/group/getMemberlistByGroup/${cri.group_name}", (list) => {
						console.log(list);
						console.log(loginUser);
						let joinCheck = list.memberList.find( user => user.user_id === loginUser)
						if (!joinCheck) {
							alert("그룹 회원만 접근 가능한 페이지입니다");
							location.href = "/group/";
						} else if (loginUser !== "${board.writer}") {
							alert(" 글 작성자만 수정할 수 있습니다");
							history.back();
						}
					});//get json
				

				if("${board.notice}" ==='Y') $('input[name="notice"]').prop('checked', true); 

				const uploadClone = $(".file").clone();
				var myEditor = document.querySelector("#editor");

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
					let modified = getForm();
					modified = { ...modified, attachList, notice: $('input[name="notice"]').is(":checked") ? "Y" : "N" }
					$.ajax({
						type: "PUT",
						url: "/group/board/${cri.bno}",
						data: JSON.stringify(modified),
						contentType: "application/json; charset=utf-8",
						success: () =>{
							let url = "/group/board/${cri.group_name}/${cri.bno}/${cri.pageNum}/${cri.amount}"
							url += "${cri.keyword}" ? "/${cri.type}/${cri.keyword}" : ""
							location.href = url
						},
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
								let url = "/group/board/${cri.group_name}/${cri.pageNum}/${cri.amount}"
								url += "${cri.keyword}" ? "/${cri.type}/${cri.keyword}" : ""
								location.href = url
						},
						error: (xhr, status, er) => {
							console.log(status);
						},
					}); //ajax
				}); //delete click
				$(".go_board").click((e) => {
					e.preventDefault();
					let url = "/group/board/${cri.group_name}/${cri.pageNum}/${cri.amount}"
					url += "${cri.keyword}" ? "/${cri.type}/${cri.keyword}" : ""
					location.href = url
				});

				const imageHandler = (e) => {
					console.log(e);
					let input = $('<input type="file" accept="image/*">');
					input.click();
					$(input).change( (e) =>{
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
								const encodURL = encodeURIComponent(
									`\${res[0].uploadPath}/\${res[0].uuid}_\${res[0].fileName}`
								);
								const IMG_URL = `/display?fileName=\${encodURL}`;

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

				$.getJSON("/group/getBoard/${board.bno}", (res) => {
					let content = res.content;
					quill.container.firstChild.innerHTML = content;
				});

				let toolbar = quill.getModule("toolbar");
				toolbar.addHandler("image", imageHandler);
			}); // docu ready
		</script>
	</body>
</html>
