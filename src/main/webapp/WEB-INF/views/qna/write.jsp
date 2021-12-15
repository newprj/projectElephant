<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<script
  src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!DOCTYPE html>
<html>
<head>
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
			<input type="text" name="writer"/> 
		</div>
		<div>
			<label for="q_content">내용</label>
			<textarea name="q_content"></textarea>
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
				str+="<span> "+obj.fileName+"</span>"
				str+="<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn-circle'><i>X</i></button></br>"
				str+="<img src='/upload/display?fileName="+fileCallPath+"'>"
				str+="</div>"	
				str+="</li>"
			}
			else{
				var fileCallPath=encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName)
				var fileLink=fileCallPath.replace(new RegExp(/\\/g),"/")
				str+="<li data-path='"+obj.uploadPath+"'"
				str+=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'"
				str+="><div>"
				str+="<span> "+obj.fileName+"</span>"
				str+="<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn-circle'><i>X</i></button></br>"
				str+="<img src='/resources/img/attach.png' style=' width:15px; height:15px;'></a>"
				str+="</div>"	
				str+="</li>"
			}
		})
		uploadUL.append(str)
	}
	
	
	$(document).ready(function () {
		
		/* 파일 등록 */
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
				},
				error:function(){
					alert("실패")
				}
			})
		})
		
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
					alert(obj)
					str+="<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>"
					str+="<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>"
					str+="<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>"
					str+="<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>"
				})
				
				$("form").append(str);
				$("form").append(choice);
				$("form").append("<input type='hidden' name='reg_date' pattern ='yy/MM/dd hh:mm' value='"+today+"'>");
				$("form").append("<input type='hidden' name='up_date' pattern ='yy/MM/dd hh:mm' value='"+today+"'>");
				$("form").submit() 
				
				
			}
			
			
		})
		
	})
	
</script>
</html>