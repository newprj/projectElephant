<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Insert title here</title>
		<script src="//code.jquery.com/jquery-3.6.0.js"></script>
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
					<textarea name="content"></textarea>
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
				const MAX_SIZE = 5242880;
				const REGEX = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
				let attachList = [];

				const checkExtension = (fileName, fileSize) => {
					if (fileSize >= MAX_SIZE) {
						alert("파일 사이즈 초과");
						return false;
					}
					if (REGEX.test(fileName)) {
						alert("해당 파일 타입은 업로드 할 수 없습니다");
						return false;
					}
					return true;
				};

				const addAttachlist = (file) => {
					attach = {
						fileName: file.fileName,
						uploadPath: file.uploadPath,
						uuid: file.uuid,
						fileType: file.image,
					};
					attachList.push(attach);
				};

				const showUploadFile = (arr) => {
					if (!arr || arr.length === 0) return;
					var str = "";
					arr.map((file) => {
						addAttachlist(file);
						console.log("1)");
						console.log(file);
						if (file.image) {
							let fileCallpath = encodeURIComponent(
								file.uploadPath + "/_s" + file.uuid + "_" + file.fileName
							);
							str += "<li><div><span>" + file.fileName + "</span>";
							str +=
								"<button data-uuid=" +
								file.uuid +
								" data-file='" +
								fileCallpath +
								"' data-type='image' class='deleteFile'> 삭제 </button><br>";
							str += "<img src='/display?fileName=";
							str += fileCallpath + "'></div></li>";
						} else {
							let fileCallpath = encodeURIComponent(
								file.uploadPath + "/" + file.uuid + "_" + file.fileName
							);
							str += "<li><div><span>" + file.fileName + "</span>";
							str +=
								"<button data-uuid=" +
								file.uuid +
								" data-file='" +
								fileCallpath +
								"' data-type='file' class='deleteFile'> 삭제 </button></div></li>";
						}
					});
					console.log("3)");
					console.log(attachList);
					$(".uploadResult > ul").append(str);
				};

				const uploadClone = $(".file").clone();

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
							console.log("2)");
							console.log(res);
							$(".file").html(uploadClone.html());
							showUploadFile(res);
						},
						error: (xhr, status, er) => console.log(xhr),
					}); //upload ajax

					$(".uploadResult").on("click", "button", function (e) {
						e.preventDefault();
						let fileName = $(this).data("file");
						let fileType = $(this).data("type");
						let targetLi = $(this).closest("li");
						let uuid = $(this).data("uuid");
						let data = { fileName, fileType };
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

				$(".create").click(function (e) {
					e.preventDefault();
					board = {
						title: $('input[name="title"]').val(),
						content: $('textarea[name="content"]').val(),
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
			}); // docu ready
		</script>
	</body>
</html>
