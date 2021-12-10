const MAX_SIZE = 5242880;
const REGEX = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
let attachList = [];
console.log("파일업로드 js 파일과 연결")


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

// 파일 첨부를 위한 첨부파일 객체 만들기
const addAttachlist = (file) => {
	attach = {
		fileName: file.fileName,
		uploadPath: file.uploadPath,
		uuid: file.uuid,
		fileType: file.image,
	};
	console.log(attach)
	attachList.push(attach);
};

const getImgFileString = (file) => {
	let fileCallpath = encodeURIComponent(
			file.uploadPath + "/_s" + file.uuid + "_" + file.fileName
		);
	let str ="";
	
	str += "<li><div><span>" + file.fileName + "</span>";
	str +=
		"<button data-uuid=" +
		file.uuid +
		" data-file='" +
		fileCallpath +
		"' data-type='image' class='deleteFile'> 삭제 </button><br>";
	str += "<img src='/display?fileName=";
	str += fileCallpath + "'></div></li>";
	return str;
}



const getFileString = (file) =>{
	let str = "";
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
	return str;
}


// 업로드 파일을 화면에 표시
const showUploadFile = (arr) => {
	if (!arr || arr.length === 0) return;
	var str = "";
	arr.map((file) => {
		addAttachlist(file)
		console.log("1)");
		console.log(file);
		if (file.image) {
			str += getImgFileString(file)
		} else {
			str += getFileString(file)
		}
	});
	console.log("3)");
	console.log(attachList);
	$(".uploadResult > ul").append(str);
};


const getFileList = (bno) =>{
	
	$.getJSON("/group/getFileList", {bno} , (files) =>{
		
		let str =""
		files.map( file => {
			attachList.push(file) // 수정할때 넣음
			if(file.fileType){
				str += getImgFileString(file)
			}
			else{
				str += getFileString(file)
			}
		})//map
		$('.uploadResult ul').html(str)
	}) //getJSON
}

const getFileListAtRead = (bno) => {
	$.getJSON("/group/getFileList", {bno} , (files) =>{
		let str =""
		files.map( file => {
			attachList.push(file) // 수정할때 넣음
			if(file.fileType){
				let fileCallpath = encodeURIComponent(
						file.uploadPath + "/_s" + file.uuid + "_" + file.fileName
					);
				str += "<li><div><span>" + file.fileName + "</span>";
				str += "<img src='/display?fileName=";
				str += fileCallpath + "'></div></li>";
			}
			else{
				let fileCallpath = encodeURIComponent(
						file.uploadPath + "/" + file.uuid + "_" + file.fileName
					);
				str += "<li><div><span>" + file.fileName + "</span></div></li>";
			}
		})//map
		$('.uploadResult ul').html(str)
	}) //getJSON
}