package com.green.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.green.mapper.ReviewAttachFileMapper;
import com.green.service.ReviewService;
import com.green.vo.Criteria;
import com.green.vo.PageDTO;
import com.green.vo.ReviewVO;
import com.green.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/review/*")
public class ReviewController {
	
	@Setter(onMethod_=@Autowired)
	ReviewService reviewService;
	@Setter(onMethod_=@Autowired)
	ReviewAttachFileMapper attachMapper;

	
	@RequestMapping(value = "/list", method = RequestMethod.GET)//리뷰 리스트 컨트롤러
	public void list(Model model, Criteria cri,HttpServletRequest request){
		log.info("리뷰 컨트롤러 list 접근.................");
		int total = reviewService.listCount(cri);
		PageDTO pageDTO = new PageDTO(cri,total);
		HttpSession session =request.getSession();
		UserVO login= (UserVO) session.getAttribute("user");
		if(login == null){
		    log.info("로그인 안됨");
		    model.addAttribute("login","cantLogin");
        }
		else {
			log.info("로그인 성공"+login.getUser_id());
			model.addAttribute("login",login.getUser_id());
		}
		model.addAttribute("list", reviewService.listqnaWithPaging(cri));
		model.addAttribute("pageMarker",pageDTO);
	}

	
	@RequestMapping("/detailPage") //상세 페이지 컨트롤러
	public void detailPage(Model model, long no,HttpServletRequest request) {
		System.out.println("리뷰 컨트롤러  detail 접근.................");
		long rno = no;
		reviewService.viewCount(rno);
		HttpSession session =request.getSession();
		UserVO login= (UserVO) session.getAttribute("user");
		if(login == null){
		    log.info("로그인 안됨");
		    model.addAttribute("login","cantLogin");
        }
		else {
			log.info("로그인 성공"+login.getUser_id());
			model.addAttribute("login",login.getUser_id());
		}
		model.addAttribute("detail", reviewService.get(no));
		model.addAttribute("attachFile", attachMapper.getList(no));
	}
	
	@GetMapping("/register")//리뷰생성 get 컨트롤러
	public void register(Model model,HttpServletRequest request) {
		System.out.println("리뷰 컨트롤러  register 접근.................");
		HttpSession session =request.getSession();
		UserVO login= (UserVO) session.getAttribute("user");
		model.addAttribute("login",login.getUser_id());
	}
	
	@PostMapping("/insert")//리뷰생성 post 컨트롤러
	public String insert(@RequestBody ReviewVO vo) {
		System.out.println("리뷰 컨트롤러  insert 접근.................");
		reviewService.register(vo);		
		return "redirect:/review/list";
	}
	
	@GetMapping("/update")//리뷰수정 get 컨트롤러
	public void update(Model model,long no,HttpServletRequest request) {
		System.out.println("리뷰 컨트롤러  update 접근................."+ no);
		HttpSession session =request.getSession();
		UserVO login= (UserVO) session.getAttribute("user");
		model.addAttribute("read", reviewService.get(no));
		model.addAttribute("attachFile", attachMapper.getList(no));
		model.addAttribute("login",login.getUser_id());
	}
	
	@PostMapping("/modify")//리뷰수정 post 컨트롤러
	public String modify(@RequestBody ReviewVO vo) {
		System.out.println("리뷰 컨트롤러  modify 접근................."+vo);
		reviewService.modify(vo);
		return "redirect:/review/list";
	}
	
	@GetMapping("/getReview/{bno}")
	public ResponseEntity<ReviewVO> readContent(@PathVariable("bno") Long bno){
		return new ResponseEntity<ReviewVO>(reviewService.get(bno), HttpStatus.OK);
	}
	
	
	/*
	 * @GetMapping("/list") public void list(Model model) {
	 * System.out.println("list 접근.................");
	 * System.out.println(service.getList()); model.addAttribute("list",
	 * service.getList()); }
	 */
	
}

