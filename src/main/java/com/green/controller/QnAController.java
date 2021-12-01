package com.green.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.green.service.QnaService;

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
}
