<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../includes/header.jsp" %>

<style>
li {
	list-style-type:none;
}
</style>

<div class="boxed">
<div id="content-container">

	<div class="pageheader">
         <h3><i class="fa fa-home"></i> Q&A 등록</h3>
         <div class="breadcrumb-wrapper">
             <span class="label">You are here:</span>
             <ol class="breadcrumb">
                 <li> <a href="/qna/list"> Q&A </a> </li>
                 <li class="active"> Q&A 등록</li>
             </ol>
         </div>
     </div>
     
     <div class="col-xs-12 col-md-9 col-lg-9">
         <div class="panel">
             <div class="panel-body">
                 <!-- Multiple Select Choosen -->
                 <!--===================================================-->
                 <form class="form-horizontal form-bordered"  action="/qna/write" method="post" >
                     <div class="form-group nb">
                         <label class="control-label col-md-2">구분: </label>
                         <div class="col-md-10">
                             <select id="p_select" onchange="selectOption(this.value);">
								<option value="0">선택</option>
								<option value="public">공개글</option>
								<option value="private">비밀글</option>			
							</select>
                         </div>
                     </div>
                     <div class="form-group nb">
                         <label class="control-label col-md-2">비밀번호: </label>
                         <div class="col-md-10">
                            <input type="text" class="form-control" name="pwd">
                         </div>
                     </div>
                     <div class="form-group nb">
                         <label class="control-label col-md-2">제목: </label>
                         <div class="col-md-10">
                            <input type="text" class="form-control" name="title"> 
                         </div>
                     </div>
                     <div class="form-group nb">
                         <label class="control-label col-md-2">글쓴이: </label>
                         <div class="col-md-10">
                            <input type="text" name="writer" value='${id}' readonly="readonly" class="form-control"/> 
                         </div>
                     </div>
                     
                    
                     <!--Summernote-->
                     <!--===================================================-->
                     <div id="demo-summernote">
                     	<div id="editor" rows="9" class="form-control" style="height: 400px; overflow: auto"></div>
						<input name="q_content" type="hidden" />
                     </div>
                     <!--===================================================-->
                     <!-- End Summernote -->
                     <div class="pad-top text-right"> 
                         <button class="btn btn-danger" id="sbtn" type="submit"><i class="fa fa-send"></i> Send </button>
                         <button class="btn btn-default" type="button" onclick="location.href='/qna/list'"><i class="fa fa-trash-o"></i> Discard </button>
                     </div>
                 </form>
             </div>
         </div>
     </div>
</div>
</div>
<%@ include file="../includes/admin_footer.jsp" %> 

<script type="text/javascript">

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
			
		var myEditor = document.querySelector("#editor");
		
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
		function imageHandler(e){
			/* 파일 등록 */
			let input = $('<input type="file" accept="image/*">');
			input.click();
			$(input).change(function(e){
				console.log("파일 등록")
				let formData=new FormData()
				let uploadFile=$(input)[0].files[0];
				formData.append("uploadFile", uploadFile);
				
				attachList = attachList.filter((i) => i.uuid !== uuid);

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
			}else{
				e.preventDefault();
				$('input[name="q_content"]').val(myEditor.children[0].innerHTML);
				console.log($('input[name="q_content"]').val());
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