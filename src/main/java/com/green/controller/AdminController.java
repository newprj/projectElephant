package com.green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.service.QnaService;
import com.green.service.StudyService;
import com.green.service.UserService;
import com.green.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/*")
@Slf4j
public class AdminController {
	@Setter(onMethod_=@Autowired)
	UserService userService;
	
	@Setter(onMethod_=@Autowired)
	StudyService studyService;

	@Setter(onMethod_=@Autowired)
	QnaService qnaService;
	
	@GetMapping("/home")
	public void adminHome(Model model) {
		log.info("admin page");
		model.addAttribute("list",userService.allList());
		model.addAttribute("group",studyService.allList());
		model.addAttribute("qna",qnaService.list());
		
	}
	
	@ResponseBody
	@PostMapping(value="/susp" , consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> suspInsert(@RequestBody UserVO vo){
		int susp=userService.userSusp(vo);
		return susp==1 ? new ResponseEntity<>("success",HttpStatus.OK):
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
