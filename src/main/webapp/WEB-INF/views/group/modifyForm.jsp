<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Insert title here</title>
		<script src="//code.jquery.com/jquery-3.6.0.js"></script>
		<script src="/resources/js/fileUpload.js" type="text/javascript"></script>
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
				<label for="content"> 내용 </label>
				<textarea name="content">${board.content}</textarea>
			</div>
			<div>
				<label for="writer"> 저자 </label>
				<input name="writer" type="text" value="${board.writer}" />
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
				const uploadClone = $(".file").clone();
				getFileList('${cri.bno}')
				
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
							console.log(res)
						},
						error: (xhr, status, er) => console.log(xhr),
					}); //upload ajax
					
					// 업로드한 파일 삭제할경우
					
				}); //file
				
				$(".uploadResult").on("click", "button", function (e) {
					e.preventDefault();
					
					let fileName = $(this).data("file");
					let fileType = $(this).data("type");
					let targetLi = $(this).closest("li");
					let uuid = $(this).data("uuid");
					let data = { fileName, fileType };
					attachList = attachList.filter((i) => i.uuid !== uuid);
					console.log(data)

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
				
				const getForm = () => ({
					bno: "${cri.bno}",
					content: $('textarea[name="content"]').val(),
					group_name: $('input[name="group_name"]').val(),
					writer: $('input[name="writer"]').val(),
					title: $('input[name="title"]').val(),
				});

				
				$(".modify").click(function (e) {
					e.preventDefault();
					console.log(attachList)
					let modified = getForm();
					modified = {...modified, attachList}
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
			});
		</script>
	</body>
</html>
