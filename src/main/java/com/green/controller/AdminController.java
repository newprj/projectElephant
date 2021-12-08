package com.green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.service.QnaService;
import com.green.service.StudyService;
import com.green.service.UserService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/*")
@Slf4j
public class AdminController {
	@Setter(onMethod_=@Autowired)
	UserService service;
	
	@Setter(onMethod_=@Autowired)
	StudyService studyService;

	@Setter(onMethod_=@Autowired)
	QnaService qnaService;
	
	@GetMapping("/home")
	public void adminHome(Model model) {
		log.info("admin page");
		model.addAttribute("list",service.allList());
		model.addAttribute("group",studyService.allList());
		model.addAttribute("qna",qnaService.list());
		
	}
}
