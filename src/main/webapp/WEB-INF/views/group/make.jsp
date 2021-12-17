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
		<form method="post" action="./make">
			<div>
				<label for=""> 그룹 이름 </label>
				<input type="text" name="group_name" required />
			</div>
			<div>
				<span class="duplicated hidden">중복된 이름입니다 </span>
				<span class="unduplicated hidden">사용 가능한 이름입니다 </span>
			</div>
			<div>
				<label for=""> 리더 </label>
				<input type="text" name="leader" value="${user.user_id}" />
			</div>
			<div>
				<label for=""> 주제 </label>
				<input type="text" name="subject" />
			</div>
			<div>
				<label for=""> 모집 인원 </label>
				<input type="number" name="member_number" />
			</div>
			<div>
				<label for=""> 상세 설명 </label>
				<div id="editor" style="max-height: 400px; overflow: auto"></div>
				<input name="description" type="hidden" />
			</div>
			<div class="submit">
				<button type="submit" disabled="disabled">생성</button>
			</div>
		</form>
	</body>

	<script>
		$(document).ready(function (e) {
			let user = "${user}";
			if (!user) {
				alert("로그인 된 사용자만 그룹을 만들수 있습니다");
				location.href = "/group/";
			}
			let result;
			let myEditor = document.querySelector("#editor");
			$('input[name="group_name"]').on(
				"propertychange change keyup paste input",
				function (e) {
					let group_name = $('input[name="group_name"]').val();
					let data = { group_name };

					$.ajax({
						type: "post",
						url: "/group/duplicateCheck",
						data: data,
						success: (res) => {
							result = res;
							if (res === "duplicated") {
								$(".unduplicated").addClass("hidden");
								$(".duplicated").removeClass("hidden");
								$(".submit > button").attr("disabled", true);
							} else {
								$(".duplicated").addClass("hidden");
								$(".unduplicated").removeClass("hidden");
								$(".submit > button").attr("disabled", false);
							}
						},
					}); //ajax
				}
			); //namecheck

			$("button").click(function (e) {
				e.preventDefault();
				$('input[name="description"]').val(myEditor.children[0].innerHTML);
				console.log($('input[name="description"]').val());
				$("form").submit();
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
		}); //docu ready
	</script>
</html>
