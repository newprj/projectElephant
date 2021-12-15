package com.green.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.green.service.BoardService;
import com.green.service.GUserService;
import com.green.service.GroupService;
import com.green.service.QnaService;
import com.green.service.ReplyService;
import com.green.service.UserService;
import com.green.vo.GUserVO;
import com.green.vo.GroupVO;
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
	GroupService gService;

	@Setter(onMethod_=@Autowired)
	QnaService qnaService;
	
	@Setter(onMethod_=@Autowired)
	GUserService gUserService;
	
	@Setter(onMethod_=@Autowired)
	BoardService bService;
	
	@Setter(onMethod_=@Autowired)
	ReplyService replyService;
	
	@GetMapping("/home")
	public String adminHome(Model model, HttpServletResponse response,HttpSession session) {
		UserVO login= (UserVO) session.getAttribute("user");
		log.info("id="+login.getUser_id());
		
		log.info("admin page");
		String id=login.getUser_id();
		if(id==null || !(id.equals("admin"))) {
			log.info("관리자가 아닌 접근");
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('관리자가 아닌 접근입니다.'); history.go(-1);</script>");
	            out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
            
			return "redirect:/user/login";
		}
		model.addAttribute("list",userService.allList());
		model.addAttribute("group",gService.showAll());
		model.addAttribute("qna",qnaService.list());
		return "/admin/home";
	}
	
	@ResponseBody
	@PostMapping(value="/susp" , consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> suspInsert(@RequestBody UserVO vo){
		int susp=userService.userSusp(vo);
		log.info("들어온 정보"+vo);
		return susp==1 ? new ResponseEntity<>("success",HttpStatus.OK):
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/mypage")
	public void mypage(HttpSession session,Model model) {
		UserVO login= (UserVO) session.getAttribute("user");
		String id=login.getUser_id();
		log.info("id="+id);
		model.addAttribute("myGroup",gUserService.listByUSer(id));
		model.addAttribute("user",login);
		model.addAttribute("myBoard",bService.myBoard(id));
		model.addAttribute("boardReply", replyService.myReply(id));
		model.addAttribute("qnaReply",qnaService.myReply(id));
		model.addAttribute("myqna",qnaService.myQna(id));
	}
	
	@ResponseBody
	@PostMapping(value="/auth", consumes="application/json")
	public void GroupAuth(@RequestBody GroupVO vo) {
		gService.GroupAuth(vo.getGno(), vo.getAuthorized());
		
	}
}
