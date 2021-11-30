package com.green.controller;

import java.io.Console;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.green.mapper.GroupMapper;
import com.green.service.GroupService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/group/*")
@Slf4j
public class GRestController {
	
	@Setter(onMethod_=@Autowired)
	GroupService groupservice;
	
	@DeleteMapping("/{group_name}")
	public String delete(@PathVariable("group_name") String group_name) {
		System.out.println("delete 컨트롤러로 들어옴   ");
		System.out.println(group_name);
		groupservice.deleteGroup(group_name);
		
		return "redirect:main";
		 		
	}

}
