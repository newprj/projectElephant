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
	public String check(String id, HttpServletResponse response) {
		String res="";
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
            
			res= "redirect:/user/login";
		}
		return res;
	}
	
	//admin
	@GetMapping("/admin")
	public String adminHome(Model model, HttpServletResponse response,HttpSession session) {
		UserVO login= (UserVO) session.getAttribute("user");
		String id=login.getUser_id();
		
		
		check(id,response);
		System.out.println(visitService.weekCnt());
		
		//model.addAttribute("week",visitService.weekCnt());
		model.addAttribute("visit",visitService.todayCnt());
		model.addAttribute("user",login);
		
		model.addAttribute("letter",letterService.myLetter(id));	
		model.addAttribute("sendletter",letterService.sendLetter(id));
		return "/mypage/admin";
	}
	
	@GetMapping("/allUser")
	public String allUser(Model model,Criteria cri,HttpServletResponse response,HttpSession session) {
		UserVO login= (UserVO) session.getAttribute("user");
		String id=login.getUser_id();
		
		check(id,response);
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
		
		check(id,response);
		int total=qnaService.totalCount(cri);
		
		model.addAttribute("qna",qnaService.listqnaWithPaging(cri));
		model.addAttribute("pageMarker",new PageDTO(cri, total));
		model.addAttribute("user",id);
		return "/mypage/allQna";
	}
	
	
	
	@GetMapping("/allGroup")
	public String allGroup(Model model,Criteria cri,HttpServletResponse response,HttpSession session) {
		UserVO login= (UserVO) session.getAttribute("user");
		String id=login.getUser_id();
		
		check(id,response);
		
		int total=gService.getTotalCount(cri);//total 승인 ,비승인 구하기
		model.addAttribute("group",gService.getListWithPaging(cri));
		model.addAttribute("Nauth",gService.NotAuthList(cri));
		model.addAttribute("pageMarker",new PageDTO(cri, total));
		return "/mypage/allGroup";
	}

	@ResponseBody
	@PostMapping(value="/susp" , consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> suspInsert(@RequestBody UserVO vo){
		int susp=userService.userSusp(vo);
		log.info("들어온 정보"+vo);
		return susp==1 ? new ResponseEntity<>("success",HttpStatus.OK):
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//user
	@GetMapping("/user")
	public void mypage(HttpSession session,Model model ) {
		UserVO login= (UserVO) session.getAttribute("user");
		String id=login.getUser_id();

		
		model.addAttribute("letter",letterService.myLetter(id));
		model.addAttribute("sendletter",letterService.sendLetter(id));
		
	}
	
	@GetMapping("/userGroup")
	public String userGroup(Model model,Criteria cri,HttpServletResponse response,HttpSession session) {
		UserVO login= (UserVO) session.getAttribute("user");
		String id=login.getUser_id();
		
		
		model.addAttribute("allGroup",gUserService.listByUSer(id)); //userGroup
		model.addAttribute("myGroup",gService.myGroup(cri, id)); //userGroup
		model.addAttribute("user",login);
		model.addAttribute("myBoard",bService.myBoard(id));	//userGroup
		model.addAttribute("boardReply", replyService.myReply(id));	//userGroup
		
		return "/mypage/userGroup";
	}
	
	@GetMapping("/userQna")
	public String userQna(Model model,Criteria cri,HttpServletResponse response,HttpSession session) {
		UserVO login= (UserVO) session.getAttribute("user");
		String id=login.getUser_id();
		
		
		int total=qnaService.totalCount(cri);
		model.addAttribute("qnaReply",qnaService.myReply(id));	//userQna
		model.addAttribute("myqna",qnaService.myQna(id));	//userQna
		model.addAttribute("user",login);
		model.addAttribute("pageMarker",new PageDTO(cri, total));
		
		return "/mypage/userQna";
	}
	
	//admin, user 공용
	@GetMapping("/calendar")
	public String calendar(Model model,Criteria cri,HttpServletResponse response,HttpSession session) {
		UserVO login= (UserVO) session.getAttribute("user");
		String id=login.getUser_id();
		
		//check(id,response);
		
		return "/mypage/calendar";
	}
	
	@GetMapping("/allMessage")
	public String allMessage(Model model,Criteria cri,HttpServletResponse response,HttpSession session) {
		UserVO login= (UserVO) session.getAttribute("user");
		String id=login.getUser_id();
		
		//check(id,response);
		
		int total=letterService.totalCount(id);
		model.addAttribute("pageMarker",new PageDTO(cri, total));
		model.addAttribute("letter",letterService.listqnaWithPaging(cri, id));
		model.addAttribute("user",login);
		model.addAttribute("total",total);
		return "/mypage/allMessage";
	}
	
	@GetMapping("/sendMessage")
	public String sendMessage(Model model,Criteria cri,HttpServletResponse response,HttpSession session) {
		UserVO login= (UserVO) session.getAttribute("user");
		String id=login.getUser_id();
		
		//check(id,response);
		
		int total=letterService.sendCount(id);
		model.addAttribute("pageMarker",new PageDTO(cri, total));
		model.addAttribute("letter",letterService.sendLetter(id));
		model.addAttribute("user",login);
		model.addAttribute("total",total);
		return "/mypage/sendMessage";
	}
	
	@GetMapping("/compose")
	public String composeLetter(Model model,Criteria cri,HttpServletResponse response,HttpSession session) {
		UserVO login= (UserVO) session.getAttribute("user");
		String id=login.getUser_id();
		
		check(id,response);
		
		model.addAttribute("user",id);
		return "/mypage/compose";
	}
	
	@PostMapping("/compose")
	public String sendLetter(LetterVO letter) {
		System.out.println("보내는 메일"+letter);
		
		letterService.insert(letter);
		return "/mypage/compose";
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
