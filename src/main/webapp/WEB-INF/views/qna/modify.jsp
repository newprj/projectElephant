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
         <h3><i class="fa fa-home"></i> Q&A</h3>
         <div class="breadcrumb-wrapper">
             <span class="label">You are here:</span>
             <ol class="breadcrumb">
                 <li> <a href="/qna/list"> Q&A</a> </li>
                 <li class="active"> Q&A 수정</li>
             </ol>
         </div>
     </div>
	
	<div class="col-xs-12 col-md-9 col-lg-9">
         <div class="panel">
             <div class="panel-body">
                 <!-- Multiple Select Choosen -->
                 <!--===================================================-->
                 
                 <div class="form-group nb">
                         <label class="control-label col-md-2">No. </label>
                         <div class="col-md-10">
                         <input type="text" name="qno"  value="${get.qno}" readonly="readonly"/> 
                         </div>
                     </div>
                 <form class="form-horizontal form-bordered"   action="/qna/modify" method="post" id="modForm">
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
                            <input type="text" class="form-control" value="${get.pwd}">
                         </div>
                     </div>
                     <div class="form-group nb">
                         <label class="control-label col-md-2">제목: </label>
                         <div class="col-md-10">
                            <input type="text" name="title"  value="${get.title}"/> 
                         </div>
                     </div>
                     <div class="form-group nb">
                         <label class="control-label col-md-2">글쓴이: </label>
                         <div class="col-md-10">
                            <input type="text" name="writer"  value="${get.writer}" readonly="readonly"/> 
                         </div>
                     </div>
                     
                    
                     <!--Summernote-->
                     <!--===================================================-->
                     <div id="demo-summernote">
                     	
						<input name="q_content" type="hidden" />
						<div>
							<div id="editor" style="max-height: 400px; overflow: auto"></div>
						</div>
                     </div>
                     <!--===================================================-->
                     <!-- End Summernote -->
                     <div class="pad-top text-right"> 
                         <button class="btn btn-danger" id="writeMod" type="submit"><i class="fa fa-send"></i> Modify </button>
                         <button class="btn btn-default" id="goList" type="button" onclick="location.href='/qna/list'"> Cancel </button>
                     </div>
                 </form>
             </div>
         </div>
     </div>
     
	<form id='operForm' action="/qna/list" method="get">
		<input type='hidden' name='pageNum' value='${cri.pageNum}'>
		<input type='hidden' name='amount' value='${cri.amount}'>
		<input type="hidden" name='type' value='${pageMarker.cri.type}'/>
		<input type="hidden" name='keyword' value='${pageMarker.cri.keyword}'/>
	</form>

</div>
</div>
<%@ include file="../includes/admin_footer.jsp" %> 

<script>
	var choice=''
	$("select").val("${get.p_group}")
	choice="<input type='hidden' name='p_group' value='${get.p_group}'/>"
	var selectOption=function(value){
		console.log(value)
		choice="<input type='hidden' name='p_group' value='"+value+"'/>"
		console.log(choice)
	}
	
$(document).ready(function () {
	var today=new Date()
	

	var regex=new RegExp("(.*?)\.(exe|sh|alz)$");
	var maxSize=5242880
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
		
	var myEditor = document.querySelector("#editor");
		
		$("#goList").click(function(e){
	        $("#operForm").submit()
		})
		
		$("#writeMod").click(function(e){
			e.preventDefault();
			
			console.log("수정하기")
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
			$("#modForm").append(str);
			$("#modForm").append(choice);
			$("#modForm").append("<input type='hidden' name='up_date' pattern ='yy/MM/dd hh:mm' value='"+today+"'/>");
			$("#modForm").submit()
		})
		
		
		var qno='<c:out value="${get.qno}"/>';
		$.getJSON("/upload/getAttachList",{qno:qno},function(arr){
			console.log(arr)
			
			var str=""
			$(arr).each(function(i,attach){
				if(attach.fileType){
					var fileCallPath=encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName)
					str+="<li data-path='"+attach.uploadPath+"'"
					str+=" data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'"
					str+="><div>"
					str+="</br><img src='/upload/display?fileName="+fileCallPath+"'>"
					str+="<span> "+attach.fileName+"</span>"
					str+="<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn-circle'><i>X</i></button>"
					str+="</div>"	
					str+="</li>"
				}else{
					var fileCallPath=encodeURIComponent(attach.uploadPath+"/"+attach.uuid+"_"+attach.fileName)
					var fileLink=fileCallPath.replace(new RegExp(/\\/g),"/")
					str+="<li data-path='"+attach.uploadPath+"'"
					str+=" data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'"
					str+="><div>"
					str+="<img src='/resources/img/attach.png' style=' width:20px; height:20px;' >"
					str+="<span> "+attach.fileName+"</span>  "
					str+="<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn-circle'><i>X</i></button>"
					str+="</div>"	
					str+="</li>"
				}
			})
			$(".uploadResult ul").html(str)
		})
		
		const imageHandler = (e) => {
			let input = $('<input type="file" accept="image/*">');
			input.click();
		
			$(input).change(function(e){
				console.log("파일 등록")
				let formData = new FormData();
				let uploadFile = $(input)[0].files[0];

				formData.append("uploadFile", uploadFile);

				$.ajax({
					url:'/upload/uploadAjaxAction',
					processData:false,
					contentType:false,
					data:formData,
					type:'post',
					dataType:'json',
					success:function(res){
						const encodURL = encodeURIComponent(`\${res[0].uploadPath}/\${res[0].uuid}_\${res[0].fileName}`)
						const IMG_URL =  `/upload/display?fileName=\${encodURL}`

						let range = quill.getSelection();
						console.log(range);
						quill.insertEmbed(range, "image", IMG_URL);
					}
				})
			})
		};
		$(".uploadResult").on("click","button",function(e){
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
 

		quill.container.firstChild.innerHTML ='${get.q_content}'
		
		let toolbar = quill.getModule("toolbar");
		toolbar.addHandler("image", imageHandler);
		
	})
</script>
</html>