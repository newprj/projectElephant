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
		<script
			src="https://kit.fontawesome.com/eab4c34ae3.js"
			crossorigin="anonymous"
		></script>

		<link href="/resources/css/style.css" rel="stylesheet" />

		<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
		<script src="/resources/js/bootstrap.js"></script>
		<script src="/resources/js/bootstrap.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


		<style>
			
			body {
				background-color: #f6f9fc;
				font-family: "Noto Sans KR", sans-serif, -apple-system,
					BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell,
					"Open Sans", "Helvetica Neue", sans-serif;
				display: flex;
				flex-direction: column;
				align-items: center;
				padding: 50px 0;
			}
			div.wrapper {
				width: 70%;
				height: 90%;
				background-color: white;
				box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11),
					0 1px 3px rgba(0, 0, 0, 0.08);
				overflow-x: hidden;
				overflow-y: auto;
				padding-bottom: 3rem;
			}
			div.head {
				color: #000;
				border-left: 5px solid #5ec2dd;
				padding: 10px 3em 8px 15px;
				margin-bottom: 10px;
			}
			.uploadResult{
				display: block;
				width: 100%;
				min-height: 7rem;
				padding: 6px 12px;
				font-size: 14px;
				color: #555;
				background-color: #fff;
				background-image: none;
				border: 1px solid #ccc;
				border-radius: 4px;
				-webkit-box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
				box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
				transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
			}
			.uploadResult >ul{
				list-style: none;
				display: flex;
				flex-direction: row;
			}
			div.button{
				display: flex;
				flex-flow: row nowrap;
				justify-content: center;
				align-items: center;
			}
			.btn{
				margin-left: 4px;
			}
			.fileBtn{
				cursor: pointer;
			}
			div.uploadResult > ul > li > div > img {
				width: 50px;
				height: 50px;
				border-radius: 50%;
			}
		</style>
	</head>

	<body>
		<div class="wrapper">
			<div class="head">
				<div class="media-left">
					<img
						src="/resources/img/elephantIcon.png"
						style="height: 50px; width: 50px; border-radius: 50%"
					/>
				</div>
				<div class="media-body">
					<h1 class="alert-title">${group_name}</h1>
				</div>
			</div>

			<form class="panel-body form-horizontal">
				<div class="form-group">
						<label class="col-md-2 control-label" for="demo-text-input">Title</label>
						<div class="col-md-9">
								<input type="text" name="title" id="demo-text-input" class="form-control" placeholder="????????? ???????????????">
						</div>
				</div>
				<!--Readonly Input-->
				<div class="form-group">
						<label class="col-md-2 control-label" for="demo-readonly-input"> ????????? </label>
						<div class="col-md-9">
								<input type="text" name="writer" id="demo-readonly-input" class="form-control" value="${user}" readonly>
						</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"><i class="fas fa-check"></i></label>
					<div class="col-md-9">
							<div class="col-md-6 pad-no form-block">
									<div class="checkbox">
											<label class="form-checkbox form-icon">
											<input type="checkbox" name="notice"> ???????????? </label>
									</div>
							</div>
					</div>
			</div>
			<div class="form-group">
					<label class="col-md-2 control-label" for="demo-textarea-input"></label>
					<div class="col-md-9">
						<div id="editor" rows="9" class="form-control" style="height: 400px; overflow: auto"></div>
					</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label" for="demo-textarea-input">	<i class="fa fa-file"></i> <span class="fileBtn" >?????? </span></label>
				<div class="col-md-9">
					<div class="uploadResult"><ul></ul> </div>
				</div>
			</div>
			<div class="button">
				<button class="create btn btn-default">??????</button>
				<button type="reset" class="btn btn-default">??????</button>
			</div>

		<script>
			$(document).ready(function (e) {
				var myEditor = document.querySelector("#editor");
				const uploadClone = $(".file").clone();
				const loginUser = "${user}";
				$.getJSON("/group/getMemberlistByGroup/${group_name}", (list) => {
					console.log(list);
					console.log(loginUser);
					let joinCheck = list.memberList.find(
						(user) => user.user_id === loginUser
					);
					if (!joinCheck) {
						alert("?????? ????????? ?????? ????????? ??????????????????");
						location.href = "/group/";
					}
				}); //get Json
				
				$('.fileBtn').click( (e) => {
					let fileUpload = $('<input type="file" name="file" multiple />')
					fileUpload.click()
					$(fileUpload).change(function (e) {
					let formData = new FormData();
					let uploadFiles = $(fileUpload)[0].files;
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
					// ???????????? ?????? ???????????????
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
				});
				}) //file
				// input file??? ?????????
				
				// ??? ??????
				$(".create").click(function (e) {
					e.preventDefault();
					const title = $('input[name="title"]').val();
					const content = myEditor.children[0].innerHTML;
					if (title == "" || content == "<p><br></p>") {
						if (title == "") {
							$('input[name="title"]').focus();
						} else {
							myEditor.children[0].focus();
						}
					} else {
						board = {
							title,
							content,
							writer: $('input[name="writer"]').val(),
							group_name: "${group_name}",
							attachList,
							notice: $('input[name="notice"]').is(":checked") ? "Y" : "N",
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
					} //else
				}); //click
				const imageHandler = (e) => {
					console.log(e);
					let input = $('<input type="file" accept="image/*">');
					input.click();
					$(input).change(function (e) {
						let formData = new FormData();
						let uploadFile = $(input)[0].files[0];
						console.log("uploadFile", uploadFile);
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
				$('input[name="notice"]').click((e) =>{
					$(e.target).prop('checked') ? $('label.form-icon').addClass('active')
																	: $('label.form-icon').removeClass('active')
				})
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