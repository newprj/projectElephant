<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Insert title here</title>
		<script src="//code.jquery.com/jquery-3.6.0.js"></script>
		<style>
			.hidden {
				display: none;
			}
		</style>
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
		<form method="post" >
			<div>
				<label for=""> 그룹 이름 </label>
				<input type="text" name="group_name" value = "${one.group_name}"/>
			</div>
			
			<div>
				<label for=""> 리더 </label>
				<input type="text" name="leader" value="${user.user_id}" />
			</div>
			<div>
				<label for=""> 주제 </label>
				<input type="text" name="subject" value="${one.subject }" />
			</div>
			<div>
				<label for=""> 모집 인원 </label>
				<input type="number" name="member_number" value="${one.member_number}"/>
			</div>
			<div>
				<label for=""> 상세 설명 </label>
				<div id="editor" style="max-height: 400px; overflow: auto"></div>
				<input name="description" type="hidden" />
			</div>
			<div class="submit">
				<button type="submit" >수정</button>
			</div>
		</form>
	</body>
ggg
	<script>
		$(document).ready(function (e) {
			
			let result;
			let myEditor = document.querySelector("#editor");
			
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
									res[0].uploadPath + "/" + res[0].uuid + "_" + res[0].fileName
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
			
			$.getJSON("/group/getDetail/${group_name}", (res) =>{
				console.log(res)
				let content = res.description
				quill.container.firstChild.innerHTML = content 
			})
			
			
			$('button').click((e)=>{
				e.preventDefault()
				console.log(" hhhh")
				const data = {
					gno : '${one.gno}',
					group_name : "${one.group_name}",
					leader : $("input[name='leader']").val(),
					subject : $('input[name="subject"]').val(),
					description : myEditor.children[0].innerHTML,
					member_number : $('input[name="member_number"]').val()
				}
					$.ajax({
						type: "PUT",
						url: "/group/gather/${one.group_name}/modify",
						data: JSON.stringify(data),
						contentType: "application/json; charset=utf-8",
						success: () =>location.href = "/group/gather/${one.group_name}",
						error: (xhr, status, er) => {
							console.log(status); 
						}, //error
					}); //ajax
				}); // modify c*/

			
			
			
			
		}); //docu ready
	</script>
</html>
