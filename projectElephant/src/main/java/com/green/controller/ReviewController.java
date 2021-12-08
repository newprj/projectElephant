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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.service.AttachFileService;
import com.green.service.ReplyService;
import com.green.service.ReviewService;
import com.green.vo.AttachFileDTO;
import com.green.vo.PageMaker;
import com.green.vo.ReviewVO;
import com.green.vo.SearchCriteria;

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

	
	@RequestMapping(value = "/list", method = RequestMethod.GET)//리뷰 리스트 컨트롤러
	public void list(Model model, @ModelAttribute("scri") SearchCriteria scri){
		log.info("리뷰 컨트롤러 list 접근.................");
		model.addAttribute("list", service.list(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping("/detailPage") //상세 페이지 컨트롤러
	public void detailPage(Model model, long no) {
		System.out.println("리뷰 컨트롤러  detail 접근.................");
		long rno = no;
		service.viewCount(rno);
		model.addAttribute("detail", service.get(no));
		model.addAttribute("attachFile", aService.getList(no));
	}
	
	@RequestMapping("/register")//리뷰생성 get 컨트롤러
	public void register(Model model) {
		System.out.println("리뷰 컨트롤러  register 접근.................");
	}
	
	@PostMapping("/insert")//리뷰생성 post 컨트롤러
	public String insert(ReviewVO vo) {
		System.out.println("리뷰 컨트롤러  insert 접근.................");
		service.register(vo);		
		return "redirect:/review/list";
	}
	
	@GetMapping("/update")//리뷰수정 get 컨트롤러
	public void update(Model model,long no) {
		System.out.println("리뷰 컨트롤러  update 접근................."+ no);
		model.addAttribute("read", service.get(no));
		model.addAttribute("attachFile", aService.getList(no));
	}
	
	@PostMapping("/modify")//리뷰수정 post 컨트롤러
	public String modify(ReviewVO vo) {
		System.out.println("리뷰 컨트롤러  modify 접근................."+vo);
		service.modify(vo);
		return "redirect:/review/list";
	}
	
	
	
	/*
	 * @GetMapping("/list") public void list(Model model) {
	 * System.out.println("list 접근.................");
	 * System.out.println(service.getList()); model.addAttribute("list",
	 * service.getList()); }
	 */
	
}

