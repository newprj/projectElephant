package com.green.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.green.service.AttachFileService;
import com.green.service.ReviewService;
import com.green.vo.AttachFileDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
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
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("★업로드아작스 포스트 접근");
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
			int rno = service.rnoRead();
			
			try {
				File saveFile = new File(uploadPath,uploadFileName);
				i.transferTo(saveFile); 
				attachDTO.setUuid(uuid.toString()); 
				attachDTO.setUploadPath(uploadFolderPath); 
				attachDTO.setFileSize(i.getSize());
				attachDTO.setFileName(originalFileName); 
				
				attachDTO.setRno(rno);
				aService.register(attachDTO);
				list.add(attachDTO);
				
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		} 
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
}
