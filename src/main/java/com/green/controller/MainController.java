package com.green.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.service.BoardService;
import com.green.service.GroupService;
import com.green.vo.GroupVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/group/*")
@Slf4j
public class MainController {
	
	@Setter(onMethod_=@Autowired)
	GroupService groupService;
	
	@Setter(onMethod_=@Autowired)
	BoardService boardService;
	
	
	
	
	@GetMapping("/make")
	public void createGroup() {
		System.out.println("get make group ");
		
	}
	
	@PostMapping("/make")
	public String createGroup(GroupVO vo){
		
		int res = groupService.makeGroup(vo);

		return "redirect:/group/";
	}
	
	
	


}
