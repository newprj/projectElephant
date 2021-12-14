package com.green.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.green.service.ChatService;
import com.green.service.UserService;
import com.green.vo.ChatRoomVO;
import com.green.vo.ChatVO;
import com.green.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController{


	@Setter(onMethod_ = @Autowired)
	UserService userservice;
	
	@Setter(onMethod_ = @Autowired)
	ChatService chatService;
	
	@GetMapping("/chatting")
	public void chat(Model model, HttpServletRequest req) {
		UserVO user = (UserVO) req.getSession().getAttribute("user");
		log.info("user: "+user);
		model.addAttribute("userid" , user.getUser_id() );
	}
	
	
}
