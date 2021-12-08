<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
li {
	list-style-type:none;
}
</style>
<title>Q & A 등록</title>
</head>
<body>
	<h1>QnA 수정</h1>
	<form action="/qna/modify" method="post" id="modForm">
		<div>
			<label for="qno">게시물 번호</label>
			<input type="text" name="qno"  value="${get.qno}" /> 
		</div>
		<div>
			<label for="p_select">구분</label>
			<select id="p_select" onchange="selectOption(this.value);" >
				<option value="0">선택</option>
				<option value="public">공개글</option>
				<option value="private">비밀글</option>			
			</select>
		</div>
		<div>
			<label for="pwd">비밀번호</label>
			<input type="password" name="pwd"/> 
		</div>
		<div>
			<label for="title">제목</label>
			<input type="text" name="title"  value="${get.title}"/> 
		</div>
		<div>
			<label for="writer">글쓴이</label>
			<input type="text" name="writer"  value="${get.writer}"/> 
		</div>
		<div>
			<label for="q_content">내용</label>
			<textarea name="q_content">${get.q_content}</textarea>
		</div>
		
		<!-- 첨부파일 사진 -->
		<div class="row col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">첨부파일</div>
				
				<div class="panel-body">
					<input type="file" name="uploadFile" multiple />
					<div class="uploadResult">
						<ul></ul>
					</div>
				</div>
			</div>
			
		</div>
		<button type="submit" id="writeMod">수정</button>
		<button type="button" id="goList" >목록</button>
	</form>
	<form id='operForm' action="/qna/list" method="get">
		<input type='hidden' name='pageNum' value='${cri.pageNum}'>
		<input type='hidden' name='amount' value='${cri.amount}'>
		<input type="hidden" name='type' value='${pageMarker.cri.type}'/>
		<input type="hidden" name='keyword' value='${pageMarker.cri.keyword}'/>
	</form>
	
	
</body>

<script type="text/javascript">
	
	
	var today=new Date()
	
	var choice=''
	$("select").val("${get.p_group}")
	choice="<input type='hidden' name='p_group' value='${get.p_group}'/>"
	var selectOption=function(value){
		console.log(value)
		choice="<input type='hidden' name='p_group' value='"+value+"'/>"
		console.log(choice)
	}
	
	var regex=new RegExp("(.*?)\.(exe|sh|zip|alz)$");
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
	/* 썸네일 처리 */
	function showUploadResult(uploadResultArr){
		if(!uploadResultArr || uploadResultArr.length==0 ){return;}
		var uploadUL=$(".uploadResult ul")
		var str=""
		
		$(uploadResultArr).each(function(i,obj){

			if(obj.fileType){
				var fileCallPath=encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName)
				str+="<li data-path='"+obj.uploadPath+"'"
				str+=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'"
				str+="><div>"
				str+="<img src='/upload/display?fileName="+fileCallPath+"'>"
				str+="<span> "+obj.fileName+"</span>"
				str+="<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn-circle'><i>X</i></button>"
				str+="</div>"	
				str+="</li>"
			}else{
				var fileCallPath=encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName)
				var fileLink=fileCallPath.replace(new RegExp(/\\/g),"/")
				str+="<li data-path='"+obj.uploadPath+"'"
				str+=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'"
				str+="><div>"
				str+="<img src='/resources/img/attach.png' style=' width:20px; height:20px;' >"
				str+="<span> "+obj.fileName+"</span>"
				str+="  <button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn-circle'><i>X</i></button></br>"
				str+="</div>"	
				str+="</li>"
			}
		})
		uploadUL.append(str) 
	}
	
	$(document).ready(function () {
		
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
		
		$("input[type='file']").change(function(e){
			console.log("파일 등록")
			var formData=new FormData()
			var inputFile=$("input[name='uploadFile']")
			var files=inputFile[0].files
			
			for(var i=0; i<files.length; i++){
				if(!checkExtension(files[i].name, files[i].size)){
					return false
				}
				formData.append("uploadFile",files[i])
				console.log(formData)
			}
			$.ajax({
				url:'/upload/uploadAjaxAction',
				processData:false,
				contentType:false,
				data:formData,
				type:'post',
				dataType:'json',
				success:function(result){
					showUploadResult(result);
				}
			})
		})
		
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
	})
</script>
</html>