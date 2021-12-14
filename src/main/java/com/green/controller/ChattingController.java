package com.green.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ChattingController {
	
	@GetMapping("/chatting")
	public void chat(Model model, HttpServletRequest req) {
		log.info(req);
		UserVO user = (UserVO) req.getSession().getAttribute("user");
		log.info(user);
		model.addAttribute("userid" , user.getUser_id() );
	}
	
	
	@GetMapping("/chat/{group_name}")
	public void groupChat(Model model, HttpServletRequest req) {
		
	}
	
	
}
