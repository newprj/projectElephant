<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Insert title here</title>
		<script src="//code.jquery.com/jquery-3.6.0.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

		<style>
			.hidden {
				display: none;
			}
			body{
      background-color: #f6f9fc;
      font-family: 'Noto Sans KR', sans-serif, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif; 
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 50px 0;
    }
    div.wrapper{
      padding: 30px;
  
      background-color: white;
      box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0,0,0,0.08); 
    }
    div.profile{
      padding-left: 50px;
    }
    .hidden {
      display: none;
    }
    .form-container {
      width: 500px;
    }
    .row {
        margin-top: 15px;
      }
    .row.form-group {
      padding-left: 15px;
      padding-right: 15px;
    }
    .btn {
      margin-left: 15px;
      width:100px;
      margin:auto;
      display:block;
    }
    
    span.profile {
      background-color: #000;
      border-bottom-left-radius: 6px;
      border-bottom-right-radius: 6px;
      bottom: 0;
      color: #fff;
      opacity: 0.8;
      padding: 4px;
      position: absolute;
      text-align: center;
      width: 300px;
      margin-left: 50px;
    }
    span.profile:hover {
      cursor: pointer;
    }
    
    img.profile{
   	 height: 200px;
    }
  
    
    #editor {
      height: 500px;
      overflow: auto;
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

		<div class="wrapper">
			<div id="form-container" class="container">
				<form method="post" action="./make">
					<div class="row">
						<div class="col-xs-5 imgContainer">
							<div class="profile">
								<img class="profile img-rounded" src="${one.profile}" />
							</div>
							<span class="profile"> 프로필 이미지 바꾸기 </span>
						<input type="hidden" name="profile" value="${one.profile}"/>
					</div>
		
					<div class="col-xs-7">
						<div class="form-group row">
							<label class="col-sm-2 col-form-label"> 그룹 이름 </label>
								<div class="col-sm-10">
									<input type="text" name="group_name"  class="form-control" value="${one.group_name}" readonly />
								</div>
						</div>
						
						<div class="form-group row ">
							<label class="col-sm-2 col-form-label"> 리더 </label>
							<div class="col-sm-10">
								<input type="text" name="leader" value="${user.user_id}" class="form-control" readonly />
							</div>
						</div>
					
						<div class="form-group row">
							<label class="col-sm-2 col-form-label"> 주제 </label>
							<div class="col-sm-10">
								<input type="text" name="subject" class="form-control" value="${one.subject}" />
							</div>
						</div>
		
						<div class="form-group row">
							<label class="col-sm-2 col-form-label"> 모집 인원 </label>
							<div class="col-sm-10">
								<input type="number" name="member_number" value="${one.member_number}" min="1" required class="form-control"/>
							</div>
						</div>
					</div>
				</div> <!-- class row -->
				<div class="row">
						<label for="description"> 상세 설명 </label>
						<div id="editor" style="max-height: 400px; overflow: auto"></div>
						<input name="description" type="hidden" />
				</div>
				<div class="row">
						<button class="btn btn-outline-secondary" type="submit" > 수정 </button>
				</div>
			</form>
		
		</div>
		</div>
	
	<script>
		$(document).ready(function (e) {
			
			let result;
			let myEditor = document.querySelector("#editor");
		
			$('span.profile').click((e) => {
				let profileImg= $('<input type="file" accept="image/*">');
				profileImg.click()
				$(profileImg).change(function (e) {
					let formData = new FormData();
					let uploadFile = $(profileImg)[0].files[0];
					formData.append("uploadFile", uploadFile);
					$.ajax({
						type: "post",
						url: "/upload",
						processData: false,
						contentType: false,
						data: formData,
						dataType: "json",
						success: (res) => {
							console.log(" 2 프로필)");
							console.log(res);
							const encodeURI = encodeURIComponent(`\${res[0].uploadPath}/\${res[0].uuid}_\${res[0].fileName}`)
							const IMG_URL = `/display?fileName=\${encodeURI}`
							console.log(IMG_URL)
							$('input[name="profile"]').val(IMG_URL)
							$('div.profile')[0].innerHTML =''
							const newProfile= $(`<img class="profile" src="\${IMG_URL}">`)
							$('div.profile').append(newProfile)
							$('img.profile').css({ "height" : "200px "})
						},
						error: (xhr, status, er) => console.log(xhr),
					}); // ajax
				}); // change
				
			})//click
			
			
			
			
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
				if ( "${user.user_id}" !== "${one.leader}"){
					alert(" 작성자가 아니면 수정할 수 없습니다 ")
					return false;
				}
				const data = {
					gno : '${one.gno}',
					group_name : "${one.group_name}",
					leader : $("input[name='leader']").val(),
					subject : $('input[name="subject"]').val(),
					description : myEditor.children[0].innerHTML,
					member_number : $('input[name="member_number"]').val(),
					profile : $('input[name="profile"]').val()
					
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