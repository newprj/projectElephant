package com.green.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.sound.midi.MidiDevice.Info;

import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.green.vo.FileDTO;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@RestController
@Slf4j
public class FileController {
	
	private String getFolder() { 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str =  sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@PostMapping(value= "/upload")
	public ResponseEntity<List<FileDTO>> uploadPost(MultipartFile[] uploadFile ) {
		System.out.println(" 파일업로드 ");
		List<FileDTO> list = new ArrayList<FileDTO>();
		String uploadFolder ="c:\\upload";
		String uploadFolderPath = getFolder(); 
		File uploadPath = new File(uploadFolder,uploadFolderPath);
		
		if(!uploadPath.exists()) uploadPath.mkdirs();
		
		for (MultipartFile file : uploadFile) {
			
			FileDTO dto = new FileDTO();
			String uploadFileName= file.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") +1 );
			
			dto.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			uploadFileName= uuid.toString() + "_" + uploadFileName;
			
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				file.transferTo(saveFile);
				
				dto.setUuid(uuid.toString());
				dto.setUploadPath(uploadFolderPath);
				
				if(checkImageType(saveFile)) {
					dto.setImage(true);
					FileOutputStream thumbnail = new FileOutputStream( new File(uploadPath, "_s"+uploadFileName));
					Thumbnailator.createThumbnail(file.getInputStream(), thumbnail, 100, 100 );
					thumbnail.close();
				}
				list.add(dto);
			
			}catch(Exception e) {
				e.printStackTrace();
				
				
			}
		
		}//for
		return new ResponseEntity<List<FileDTO>>(list, HttpStatus.OK);
	}
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImages(String fileName){
		File file = new File("c:\\upload\\" + fileName);
		ResponseEntity<byte[]> result = null; //
		try {
			HttpHeaders header = new HttpHeaders(); // prob~ 무슨 파일인지 확인하기 좋음?
			header.add("Content-type", Files.probeContentType(file.toPath())); //헤더에 추가
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK); // body, header , status
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@PostMapping(value="/delete")
	public ResponseEntity<String> deleteFile(String fileName, String fileType){
		File file;
		try {
			file = new File("c\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			if(fileType.equals("image")) {
				String Largefile = file.getAbsolutePath().replace("_s", "");
				file = new File(Largefile);
				file.delete();
			
			}
		}catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>(" delete " , HttpStatus.OK);
	}
	
	
	
}
