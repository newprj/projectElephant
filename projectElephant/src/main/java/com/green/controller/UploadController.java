package com.green.controller;

import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.green.service.AttachFileService;
import com.green.service.ReviewService;
import com.green.vo.AttachFileDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/upload/*")
public class UploadController {
	@Setter(onMethod_=@Autowired)
	AttachFileService aService;
	@Setter(onMethod_=@Autowired)
	ReviewService service;
	
	
	private String getFolder() { //오늘날짜를 이용하여 폴더를 생성하는 함수
		log.info("★오늘날짜를 이용");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str =  sdf.format(date);
		return str.replace("-", File.separator);//문자열중 "-"를 파일의 구분자(separator)로 교체함 
	}

	
	@PostMapping(value = "/uploadAjaxAction",produces = MediaType.APPLICATION_JSON_UTF8_VALUE) 
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile,@RequestParam(value="rno") long rno) { //업로드 컨트롤러
		
		log.info("★업로드아작스 포스트 접근"+rno);
		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "c:\\upload";
		String uploadFolderPath = getFolder(); 
		File uploadPath = new File(uploadFolder,uploadFolderPath); 
		log.info("파일 업로드된 경로 :" +  uploadPath);
		if(!uploadPath.exists()) uploadPath.mkdirs();
		for(MultipartFile i : uploadFile) {
			log.info(".............컨트롤러에서의 파일 업로드 post ajax 이용  "  );
			AttachFileDTO attachDTO = new AttachFileDTO();
			String uploadFileName = i.getOriginalFilename();
			log.info("업로드 파일명: " +  uploadFileName);
			log.info("업로드 파일 크기: " +  i.getSize());
			UUID uuid = UUID.randomUUID(); //파일의 중복된 이름의 파일을 저장하지 않기 위해 UUID 키값 생성
			log.info("UUID"+uuid );
			String originalFileName = uploadFileName;
			uploadFileName= uuid.toString()+"_" + uploadFileName; //실제 저장할 파일명 = UUID _ 원본파일명 결합
			/*
			 * if(rno==null) { rno = service.rnoRead(); }
			 */
			try {
				File saveFile = new File(uploadPath,uploadFileName);
				i.transferTo(saveFile); 
				attachDTO.setUuid(uuid.toString()); 
				attachDTO.setUploadPath(uploadFolderPath); 
				attachDTO.setFileSize(i.getSize());
				attachDTO.setFileName(originalFileName); 
				if(rno==99999999) attachDTO.setRno(0l);
				else if(rno > 0) {
					attachDTO.setRno(rno);
				}
				else {
					rno = service.rnoRead();
					attachDTO.setRno(rno);
				}
				attachDTO.setRno(rno);
				aService.register(attachDTO);
				list.add(attachDTO);
				
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		} 
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@GetMapping(value = "/download" ,produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody 
	public ResponseEntity<Resource> downloadFile(String uuid){ //다운로드 컨트롤러
		log.info("컨트롤러 파일 다운로드 uuid : " +  uuid);
		AttachFileDTO dto = aService.read(uuid);
		Resource resource = new FileSystemResource("c:\\upload\\"+dto.getUploadPath()+"\\"+uuid+"_"+dto.getFileName());
		String resourceName = resource.getFilename();
		log.info("resource: " +resource);
		HttpHeaders headers = new HttpHeaders();
		String downloadName = null;
		try {
			downloadName = new String(resourceName.getBytes("UTF8"),"ISO-8859-1");
			headers.add("Content-Disposition" , "attachment; fileName=" + downloadName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource,headers , HttpStatus.OK);
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String uuid){
		log.info("deletFile: " + uuid);
		AttachFileDTO dto = aService.read(uuid);
		String uuidSql = uuid;
		File file;
		try {
			 file = new File("c:\\upload\\"+dto.getUploadPath()+"\\"+uuid+"_"+dto.getFileName());
			 file.delete(); 
			 aService.remove(uuidSql);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("삭제되었습니다.", HttpStatus.OK);
	}
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImages(String fileName){
		File file = new File("c:\\upload\\" + fileName);
		ResponseEntity<byte[]> result = null; 
		try {
			HttpHeaders header = new HttpHeaders(); 
			header.add("Content-type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
	
