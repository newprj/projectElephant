<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<script
  src="https://code.jquery.com/jquery-3.6.0.js"></script>
  
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script src="//code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
	rel="stylesheet"
/>
<script src="/resources/image-resize.min.js"></script>
<script src="/resources/image-drop.min.js"></script>
<script src="/resources/js/fileUpload.js" type="text/javascript"></script>

<!DOCTYPE html>
<html>
<head>
<style>
li {
	list-style-type:none;
}
</style>
<meta charset="UTF-8">
<title>Q & A 등록</title>
</head>
<body>
	<h1>QnA 등록</h1>
	<h3>로그인되면 임시저장 도전</h3>
	<form action="/qna/write" method="post" name="write">
		<div>
			<label for="p_select">구분</label>
			<select id="p_select" onchange="selectOption(this.value);">
				<option value="0">선택</option>
				<option value="public">공개글</option>
				<option value="private">비밀글</option>			
			</select>
		</div>
		<div>
			<label for="pwd">비밀번호</label>
			<input type="password" id="pwd" name="pwd"/> 
		</div>
		<div>
			<label for="title">제목</label>
			<input type="text" name="title"/> 
		</div>
		<div>
			<label for="writer">글쓴이</label>
			<input type="text" name="writer" value='${id}' readonly="readonly"/> 
		</div>
		<div>
			<label for="q_content">내용</label>
			<div id="editor" style="max-height: 400px; overflow: auto"></div>
			<input name="q_content" type="hidden" />
		</div>
		<div>
			<div class="panel-heading">첨부파일</div>
			<div>
				<div class="form-group uploadDiv">
					<input type="file" name="uploadFile" multiple />
				</div>
				<div class="uploadResult">
					<ul>
					
					</ul>
				</div>
			</div>
		</div>
		<button >임시저장(될까?sessionStorage사용)</button>
		<button id="sbtn" type="submit">등록</button>
		<button type="button" onclick="location.href='/qna/list'">취소</button>
		
	</form>
</body>

<script>

	var today=new Date()
	
	console.log(today)	
	var choice=''
	var p=''

	var selectOption=function(value){
	if(value=='private')
		$("#pwd").attr("disabled",false)
	else
		$("#pwd").attr("disabled",true)
	p=value
	choice="<input type='hidden' name='p_group' id='p_group' value='"+value+"'/>"
	console.log(choice)
	console.log($("#pwd").val())
}
$(document).ready(function () {
	
	let myEditor = document.querySelector("#editor");
	
	
	
	var regex=new RegExp("(.*?)\.(exe|sh|alz)$");
	var maxSize=10485760
	
	function checkExtension(fileName,fileSize){
		if(fileSize >= maxSize){
			alert("사이즈 초과")
			return false
		}
		
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.")
			return false
		}
		return true
	}	
	
	const imageHandler = (e) => {
		/* 파일 등록 */
		let input = $('<input type="file" accept="image/*">');
		input.click();
		$(input).change(function(e){
			console.log("파일 등록")
			let formData=new FormData()
			let uploadFile=$(input)[0].files[0];
			formData.append("uploadFile", uploadFile);
			
			$.ajax({
				url:'/upload/uploadAjaxAction',
				processData:false,
				contentType:false,
				data:formData,
				type:'post',
				dataType:'json',
				success:function(res){
					const IMG_URL =
						"/upload/display?fileName=" +
						encodeURIComponent(
							res[0].uploadPath + "/" + res[0].uuid + "_" + res[0].fileName
						);

					let range = quill.getSelection();
					console.log(range);
					quill.insertEmbed(range, "image", IMG_URL);
				},
				error:function(){
					alert("실패")
				}
			})
		})
	};
		/* 파일 삭제 */
		$(".uploadResult").on("click","button",function(e){
			console.log('파일 삭제')
			var targetFile=$(this).data("file")
			var type=$(this).data("type")
			var targetLi=$(this).closest("li")
			
			$.ajax({
				url:'/upload/deleteFile',
				data:{fileName:targetFile,type:type},
				dataType:'text',
				type:'post',
				success:function(result){
					alert(result);
					targetLi.remove();
				}
			
			})
		})
		
		/* 등록 버튼 눌름 */
		$("#sbtn").click(function(e){
			if(p=='private' && $("#pwd").val()==''){
				e.preventDefault();
				alert('비밀번호를 입력하세요')
				$("#pwd").focus()
			}
			else{
				e.preventDefault();
				console.log("등록하기")
				var str=""
				$(".uploadResult ul li").each(function(i,obj){
					var jobj=$(obj)
					console.log(jobj.data("filename"))
					
					str+="<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>"
					str+="<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>"
					str+="<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>"
					str+="<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>"
				})
				
				
				$('input[name="q_content"]').val(myEditor.children[0].innerHTML);
				console.log($('input[name="q_content"]').val());
				$("form").append(str);
				$("form").append(choice);
				$("form").append("<input type='hidden' name='reg_date' pattern ='yy/MM/dd hh:mm' value='"+today+"'>");
				$("form").append("<input type='hidden' name='up_date' pattern ='yy/MM/dd hh:mm' value='"+today+"'>");
				$("form").submit() 
				
				
			}
			
			
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
		
	})
	
</script>
</html>