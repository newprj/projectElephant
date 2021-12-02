package com.green.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.service.QnaService;
import com.green.vo.QnaVO;

import lombok.Setter;

@Controller
@RequestMapping("/qna/*")
public class QnAController {
	@Setter(onMethod_=@Autowired)
	QnaService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		System.out.println("QnA 게시판 리스트");
		model.addAttribute("list",service.list());
		
	}
	@GetMapping("/write")
	public void write() {
		System.out.println("QnA 새글 쓰기");
		System.out.println("로그인 정보 가지고 와야함/write로 할것인가 register로 할것인가");
	}
	@PostMapping("/write")
	public String writepost(QnaVO vo) {
		System.out.println("받은 게시글 내용"+vo);
		service.insertQna(vo);
		return "redirect:/qna/list";
	}
	@GetMapping({"/detail","/modify"})
	public void detail(Model model,Long qno) {
		System.out.println("QnA 세부내용 들어옴"+qno);
		model.addAttribute("get",service.get(qno));
		model.addAttribute("reply",service.replyList(qno));
		
	}
//	@GetMapping("/modify")
//	public String modify(Model model,Long) {
//		System.out.println("QnA 수정 페이지 ");
//		model.addAttribute("get");
//		return "/qna/modify";
//	}
//	
	@PostMapping("/modify")
	public String modifyPost(QnaVO vo) {
		//RedirectAttributes rttr
		System.out.println("수정된 데이터"+vo);
		service.update(vo);		
		return "redirect:/qna/list";
	}
}
