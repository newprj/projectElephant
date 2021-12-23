package com.green.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

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
import com.green.service.LetterService;
import com.green.service.QnaService;
import com.green.service.ReplyService;
import com.green.service.UserService;
import com.green.service.VisitService;
import com.green.vo.Criteria;
import com.green.vo.GUserVO;
import com.green.vo.GroupVO;
import com.green.vo.LetterVO;
import com.green.vo.PageDTO;
import com.green.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mypage/*")
@Slf4j
public class MypageController {
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
	
	@Setter(onMethod_=@Autowired)
	LetterService letterService;
	
	@Setter(onMethod_=@Autowired)
	VisitService visitService;
	
	//admin확인 함수 만들기
	
	
	@GetMapping("/admin")
	public String adminHome(Model model, HttpServletResponse response,HttpSession session) {
		UserVO login= (UserVO) session.getAttribute("user");
		String id=login.getUser_id();
		if(id==null || !(id.equals("admin"))) {
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
		
		
		System.out.println(visitService.weekCnt());
		
		model.addAttribute("week",visitService.weekCnt());
		model.addAttribute("visit",visitService.todayCnt());
		model.addAttribute("user",id);
		//model.addAttribute("list",userService.allList());	//allUser로 넘김
		model.addAttribute("group",gService.showAll());
		//model.addAttribute("qna",qnaService.list());		//allQna로 넘김
		model.addAttribute("letter",letterService.myLetter(id));	//allmessage로 넘김
		model.addAttribute("sendletter",letterService.sendLetter(id));
		return "/mypage/admin";
	}
	
	@GetMapping("/allUser")
	public String allUser(Model model,Criteria cri,HttpServletResponse response,HttpSession session) {
		UserVO login= (UserVO) session.getAttribute("user");
		String id=login.getUser_id();
		if(id==null || !(id.equals("admin"))) {
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
		cri.setAmount(12);
		int total=userService.totalCount(cri);
		model.addAttribute("user",id);
		model.addAttribute("list",userService.listWithPaging(cri));
		model.addAttribute("pageMarker",new PageDTO(cri, total));
		return "/mypage/allUser";
	}
	
	@GetMapping("/allQna")
	public String allQna(Model model,Criteria cri,HttpServletResponse response,HttpSession session) {
		UserVO login= (UserVO) session.getAttribute("user");
		String id=login.getUser_id();
		if(id==null || !(id.equals("admin"))) {
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
		
		int total=qnaService.totalCount(cri);
		
		model.addAttribute("qna",qnaService.listqnaWithPaging(cri));
		model.addAttribute("pageMarker",new PageDTO(cri, total));
		model.addAttribute("user",id);
		return "/mypage/allQna";
	}
	
	@GetMapping("/allMessage")
	public String allMessage(Model model,Criteria cri,HttpServletResponse response,HttpSession session) {
		UserVO login= (UserVO) session.getAttribute("user");
		String id=login.getUser_id();
		if(id==null || !(id.equals("admin"))) {
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
		
		
		int total=letterService.totalCount(cri);
		model.addAttribute("pageMarker",new PageDTO(cri, total));
		model.addAttribute("letter",letterService.listqnaWithPaging(cri, id));
		return "/mypage/allMessage";
	}
	
	@GetMapping("compose")
	public String composeLetter(Model model,Criteria cri,HttpServletResponse response,HttpSession session) {
		UserVO login= (UserVO) session.getAttribute("user");
		String id=login.getUser_id();
		if(id==null || !(id.equals("admin"))) {
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
		return "/mypage/compose";
	}
	@ResponseBody
	@PostMapping(value="/susp" , consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> suspInsert(@RequestBody UserVO vo){
		int susp=userService.userSusp(vo);
		log.info("들어온 정보"+vo);
		return susp==1 ? new ResponseEntity<>("success",HttpStatus.OK):
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/user")
	public void mypage(HttpSession session,Model model ) {
		UserVO login= (UserVO) session.getAttribute("user");
		String id=login.getUser_id();
		log.info("id="+id);

		model.addAttribute("myGroup",gUserService.listByUSer(id));
		model.addAttribute("user",login);
		model.addAttribute("myBoard",bService.myBoard(id));
		model.addAttribute("boardReply", replyService.myReply(id));
		model.addAttribute("qnaReply",qnaService.myReply(id));
		model.addAttribute("myqna",qnaService.myQna(id));
		model.addAttribute("letter",letterService.myLetter(id));
		model.addAttribute("sendletter",letterService.sendLetter(id));
	}
	
	@ResponseBody
	@PostMapping(value="/auth", consumes="application/json")
	public void GroupAuth(@RequestBody GroupVO vo) {
		gService.GroupAuth(vo.getGno(), vo.getAuthorized());
		
	}
	
	@ResponseBody
	@PostMapping(value="/letterRegister" , consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> letterReg(@RequestBody LetterVO vo){
		int letter=letterService.insert(vo);
		log.info("들어온 정보"+vo);
		return letter==1 ? new ResponseEntity<>("success",HttpStatus.OK):
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@ResponseBody
	@PostMapping(value="/deleLetter", consumes="application/json")
	public void deleLetter(@RequestBody Map<String,String> data) {
		System.out.println("들어온 정보"+data);
		letterService.delete(data.get("writer"),Long.valueOf(data.get("lno")));
		
	}
	
}
