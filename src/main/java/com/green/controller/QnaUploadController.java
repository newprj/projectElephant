package com.green.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.green.service.QnaService;
import com.green.vo.QnaAttachDTO;
import com.green.vo.QnaReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;
import oracle.jdbc.proxy.annotation.Post;

@RestController
@RequestMapping("/upload/*")
@Slf4j
public class QnaUploadController {
	
	@Setter(onMethod_=@Autowired)
	private QnaService service;

	
	@GetMapping(value="/count", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> replyCnt(Long qno){
		//log.info("1)reply qno"+qno);
		String cnt=Integer.toString(service.attachCount(qno));
		//log.info("1)reply 갯수"+cnt);
		
		return new ResponseEntity<>(cnt,HttpStatus.OK);
	}
	
	@GetMapping(value="/getAttachList",  produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<QnaAttachDTO>> replyRegister(Long qno){
		log.info("1)첨부파일 ajax 가져오기"+qno);
		return new ResponseEntity<>(service.getAttachList(qno),HttpStatus.OK);
	}
	
	private String getFolder() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		
		Date date=new Date();
		String str=sdf.format(date);
		return str.replace("-", File.separator);
	}
	private boolean checkImageType(File file) {
		try {
			String contentType=Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	@PostMapping(value="/uploadAjaxAction", produces="application/json;charset=UTF-8" )
	public ResponseEntity<List<QnaAttachDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("첨부파일 ajax등록");
		
		List<QnaAttachDTO> list=new ArrayList<>();
		String uploadFolder="c:\\upload";
		
		String uploadFolderPath=getFolder();
		File uploadPath=new File(uploadFolder,uploadFolderPath);
		log.info("파일 업로드된 경로:"+uploadPath);
		
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}//make yyyy/mm/dd folder
		
		for(MultipartFile multipartFile :uploadFile) {
			QnaAttachDTO attachDTO=new QnaAttachDTO();
			
			log.info("upload 파일이름: "+ multipartFile.getOriginalFilename());
			log.info("upload 파일 사이즈: "+ multipartFile.getSize());
			
			String uploadFileName=multipartFile.getOriginalFilename();
			uploadFileName=uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			log.info("only file name: "+uploadFileName);
			attachDTO.setFileName(uploadFileName);
			UUID uuid=UUID.randomUUID();
			
			uploadFileName=uuid.toString()+"_"+uploadFileName;
			try {
				File saveFile=new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				if(checkImageType(saveFile)) {
					attachDTO.setFileType(true);
					
					FileOutputStream thumbnail=new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
					CommonsMultipartFile commons=(CommonsMultipartFile)multipartFile;
					Thumbnailator.createThumbnail(commons.getInputStream(),thumbnail,100,100);
					thumbnail.close();
				}
				list.add(attachDTO);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileName){
		log.info("fileName :" +fileName);
		
		File file =new File("c:\\upload\\"+fileName);
		log.info("file"+file);
		ResponseEntity<byte[]> result=null;
		
		try {
			HttpHeaders header=new HttpHeaders();
			
			header.add("Content-type",Files.probeContentType(file.toPath()));
			result=new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName,String type){
		log.info("deleteFile:" +fileName);
		
		File file;
		try {
			file=new File("c:\\upload\\"+URLDecoder.decode(fileName,"UTF-8"));
			file.delete();
			if(type.equals("image")) {
				String largeFileName=file.getAbsolutePath().replace("s_", "");
				log.info("largeFileName"+largeFileName);
				file=new File(largeFileName);
				file.delete();
			}
		}catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	
	@GetMapping(value="/download" , produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> downloadFile(String fileName){
		Resource resource=new FileSystemResource("c:\\upload\\"+fileName);
		if(resource.exists()==false) return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		
		String resourceName=resource.getFilename();
		HttpHeaders headers=new HttpHeaders();
		String downloadName=null;
		
		try {
			downloadName=new String(resourceName.getBytes("UTF-8"),"ISO-8859-1");
			headers.add("Content-Disposition","attachment; fileName="+downloadName);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource,headers,HttpStatus.OK);
	}

}
