<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 	
 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>회원정보수정</title>
    <style>
    .form_section_content label {
  display: inline-block;
  padding: .5em .75em;
  color: #fff;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #f7ab07;
  cursor: pointer;
  border-radius: .25em;
  -webkit-transition: background-color 0.2s;
  transition: background-color 0.2s;
}

.form_section_content label:hover {
  background-color: #f7704e;
}

.form_section_content label:active {
  background-color: #f7ab07;
}

.form_section_content input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}
.imgDeleteBtn {
	display: inline-block;
	padding: .5em .75em;
	color: #fff;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #e91010;
	border:none;
	border-radius: .25em;
}
.imgDeleteBtn:hover {
  background-color: #382323;
}

 	 </style>

  </head>
  <script type="text/javascript">
		$(document).ready(function(){
			$("#submit").on("click", function(){
				if($("#password").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#password").focus();
					return false;
				}
				if($("#name").val()==""){
					alert("이름을 입력해주세요.");
					$("#name").focus();
					return false;
				}
			})
			$("#pwCheck").click(function(){
				if($("#password2").val() != $("#password").val()){
					$(".result2 .msg2").text("비밀번호가 일치하지 않습니다")
					$(".result2 .msg2").attr("style", "color:#f00")
					$("#submit").attr("disabled", "disabled")
				}
				else{
					$(".result2 .msg2").text("비밀번호 일치")
					$(".result2 .msg2").attr("style", "color:#00f")
					$("#submit").removeAttr("disabled")
				}
			})
			$("#password").keyup(function(){
				$(".result2 .msg2").text("비밀번호를 확인해주세요")
				$(".result2 .msg2").attr("style", "color:#000")
				$("#submit").attr("disabled", "disabled")
			})
			$("#password2").keyup(function(){
				$(".result2 .msg2").text("비밀번호를 확인해주세요")
				$(".result2 .msg2").attr("style", "color:#000")
				$("#submit").attr("disabled", "disabled")
			})
			
			/* 이미지 업로드 */
			$("input[type='file']").on("change", function(e){
				
				if($(".imgDeleteBtn").length>0){
					deleteFile();
				}
				
				let formData = new FormData();
				let fileInput = $('input[name="uploadFile"]');
				let fileList = fileInput[0].files;
				let fileObj = fileList[0];
		
				formData.append("uploadFile", fileObj);
				
				$.ajax({
					url: '/user/upload',
			    	processData : false,
			    	contentType : false,
			    	data : formData,
			    	type : 'POST',
			    	dataType : 'json',
			    	success : function(result){
			    		console.log(result);
			    		showUploadImage(result);
			    	},
			    	error : function(result){
			    		alert("이미지 파일이 아닙니다")
			    	}
				});	
			});
			
			let regex = new RegExp("(.*?)\.(jpg|png|PNG)$");
			let maxSize = 1048576; //1MB	
			
			function fileCheck(fileName, fileSize){

				if(fileSize >= maxSize){
					alert("파일 사이즈 초과");
					return false;
				}
					  
				if(!regex.test(fileName)){
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
				
				return true;		
				
			}
			function showUploadImage(uploadResultArr){
				if(!uploadResultArr || uploadResultArr.length == 0){return}

				let  uploadResult = $("#uploadResult");
				let obj = uploadResultArr[0];
				let str = "";
				let fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
				let profilePath = `/display?fileName=\${fileCallPath}`
				$("body > form > div.form_section > div.form_section_title > img").attr('src', profilePath)
				$('input[name="profile"]').val(profilePath)
			}
			$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
				deleteFile();
			});
			
			function deleteFile(){
				let targetFile = $(".imgDeleteBtn").data("file");
				let targetDiv =$("#result_card");
				
				$.ajax({
					url : '/user/deleteFile',
					data : {fileName : targetFile},
					dataType : 'text',
					type : 'POST',
					success : function(result){
						console.log(result);
						targetDiv.remove();
						$("input[type='file']").val("");
					},
					error: function(result){
						console.log(result);
						alert("파일을 삭제하지 못했습니다")
					}
				})
			}
		})
  </script>
		
  <body>
    <h4>회원정보수정</h4>
		
      <form action="/user/modify" method="post">
      	<div class="form_section">
   			<div class="form_section_title">
   				<input type="hidden" name="profile" value="${user.profile}"/>
   				<img src="${user.profile}" style="max-width: 30%; height: auto;">
   			</div>
   			<div class="form_section_content">
   			   	<label for="fileItem">사진 변경</label>
				<input type="file" id ="fileItem" name='uploadFile' >
   			</div>
   		</div> 
	   
        <div class="form-group">
          <label for="user_id">아이디</label>
          <input type="text" class="form-control" name="user_id" value="${user.user_id}" readonly/>
        </div>
        <div class="form-group">
          <label for="password">비밀번호</label>
          <input type="password" class="form-control" name="password" id="password"/>
        </div>
        <div class="form-group">
          <label for="password2">비밀번호 재입력</label>
          <input type="password" class="form-control" name="password2" id="password2" />
          <button class="btn btn-primary" type="button" id="pwCheck">비밀번호 확인</button>
          <p class="result2">
          	<span class="msg2">비밀번호를 확인해주세요</span>
          </p>
        </div>
         <div class="form-group">
          <label for="name">이름</label>
          <input type="text" class="form-control" value="${user.name}" name="name" id="name"/>
        </div>
         <div class="form-group">
          <label for="email">이메일</label>
          <input type="text" class="form-control" name="email" value="${user.email }"/>
          
        </div>
        <button class="btn btn-info" id="submit">수정</button>
        <button class="btn btn-warning" type="button" onclick="location.href='/group/' ">수정 취소</button>
      </form>

  </body>
</html>