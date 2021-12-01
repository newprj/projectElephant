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
	
	@GetMapping("/main")
	public void main(Model model) {
		model.addAttribute("group", groupService.showAll());
		log.info(" 여기는 메인 페이지 " );
		
	}
	
	
	@GetMapping("/make")
	public void createGroup() {
		System.out.println("get make group ");
		
	}
	
	@PostMapping("/make")
	public String createGroup(GroupVO vo){
		System.out.println("컨트롤러 vo post " + vo);
		int res = groupService.makeGroup(vo);
		System.out.println(res );
		return "redirect:main";
	}
	
	@GetMapping("/detail")
	public void getDetail(String group_name, Model model){
		model.addAttribute("one", groupService.showOne(group_name));
	}
	
	@GetMapping("/temp")
	public void tempGroupPage(Model model, String group_name) {
		model.addAttribute("name", group_name);
		model.addAttribute("board", boardService.showList(group_name));
	}
	
	@GetMapping("/test")
	public void test() {
		
	}


}
