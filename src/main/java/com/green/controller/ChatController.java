package com.green.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.service.UserService;
import com.green.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {


	@Setter(onMethod_ = @Autowired)
	UserService userservice;
	
	@GetMapping("/chat")
	public void chat(Model model,HttpServletRequest req) {
		HttpSession session=req.getSession();
		UserVO login= (UserVO) session.getAttribute("user");
		
		log.info("==================================");
		log.info("@ChatController, GET Chat / Username : " + login.getUser_id());
		
		model.addAttribute("userid", login.getUser_id());
	}
}
