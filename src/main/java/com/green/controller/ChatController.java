package com.green.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.service.ChatService;
import com.green.service.UserService;
import com.green.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController{


	@Setter(onMethod_=@Autowired)
	UserService userservice;
	
	@Setter(onMethod_=@Autowired)
	ChatService chatService;
	
	@GetMapping("/chatting")
	public void chat(Model model, HttpServletRequest req) {
		UserVO user = (UserVO) req.getSession().getAttribute("user");
		log.info("user: "+user);
		model.addAttribute("userid" , user.getUser_id() );
	}
	@GetMapping("/chat/{group_name}")
	public void groupChat(Model model, HttpServletRequest req) {

	}
	
}
