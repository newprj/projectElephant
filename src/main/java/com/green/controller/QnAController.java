package com.green.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.service.QnaService;
import com.green.vo.Criteria;
import com.green.vo.PageDTO;
import com.green.vo.QnaVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/qna/*")
@Slf4j
public class QnAController {
	@Setter(onMethod_=@Autowired)
	QnaService service;
	
	@GetMapping("/list")
	public void list(Model model,Criteria cri) {
		log.info("QnA 게시판 리스트");
		log.info("===============");
		
		int total=service.totalCount(cri);
		model.addAttribute("list",service.listqnaWithPaging(cri));
		model.addAttribute("pageMarker",new PageDTO(cri, total));
		
	}
	@GetMapping("/write")
	public void write() {
		System.out.println("QnA 새글 쓰기");
		System.out.println("로그인 정보 가지고 와야함/write로 할것인가 register로 할것인가");
	}
	@PostMapping("/write")
	public String writepost(QnaVO vo,RedirectAttributes rttr) {
		
		log.info("받은 게시글 내용"+vo);
		if(vo.getAttachList()!=null) vo.getAttachList().forEach(i->log.info(""+i));
		
		service.insertQna(vo);
		rttr.addFlashAttribute("result",vo.getQno());
		return "redirect:/qna/list";
	}
	@GetMapping({"/detail","/modify"})
	public void detail(@RequestParam("qno") Long qno,Model model,@ModelAttribute("cri") Criteria cri) {
		System.out.println("QnA 세부내용 들어옴"+qno);
		model.addAttribute("get",service.get(qno));
		model.addAttribute("reply",service.replyList(qno));
		
	}

	@PostMapping("/modify")
	public String modifyPost(QnaVO vo,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		System.out.println("수정된 데이터"+vo);
		if(service.update(vo)) rttr.addFlashAttribute("result","success");		
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/qna/list";
	}
	
	@GetMapping("/remove")
	public String removeQno(Long qno) {
		service.deleteByQno(qno);
		return "redirect:/qna/list";
	}
}
