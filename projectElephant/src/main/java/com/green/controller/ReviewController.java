package com.green.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.service.AttachFileService;
import com.green.service.ReviewService;
import com.green.vo.AttachFileDTO;
import com.green.vo.Criteria;
import com.green.vo.PageMaker;
import com.green.vo.ReviewVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/review/*")
public class ReviewController {
	
	@Setter(onMethod_=@Autowired)
	ReviewService service;
	@Setter(onMethod_=@Autowired)
	AttachFileService aService;
	
	/*
	 * @GetMapping("/list") public void list(Model model) {
	 * System.out.println("list 접근.................");
	 * System.out.println(service.getList()); model.addAttribute("list",
	 * service.getList()); }
	 */
	
	@RequestMapping("/detailPage")
	public void detailPage(Model model, long no) {
		System.out.println("detail 접근.................");
		model.addAttribute("detail", service.get(no));
		model.addAttribute("attachFile", aService.getList(no));
	}
	
	@RequestMapping("/register")
	public void register(Model model) {
		System.out.println("register 접근.................");
	}
	
	@PostMapping("/insert")
	public String insert(ReviewVO vo) {
		System.out.println("insert 접근.................");
		service.register(vo);		
		return "redirect:/review/list";
	}
	
	@GetMapping("/update")
	public void update(Model model,long no) {
		System.out.println("update 접근................."+ no);
		model.addAttribute("read", service.get(no));
	}
	
	@PostMapping("/modify")
	public String modify(ReviewVO vo) {
		System.out.println("modify 접근................."+vo);
		service.modify(vo);
		return "redirect:/review/list";
	}
	

	@GetMapping(value = "/download" ,produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody 
	public ResponseEntity<Resource> downloadFile(String uuid){
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
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, Criteria cri) throws Exception{
		log.info("list");
		
		model.addAttribute("list", service.listPage(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "review/list";
		
	}
}

