package com.green.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.bytecode.stackmap.BasicBlock.Catch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.service.QnaService;
import com.green.vo.Criteria;
import com.green.vo.PageDTO;
import com.green.vo.QnaVO;
import com.green.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/qna/*")
@Slf4j
public class QnAController {
	@Setter(onMethod_=@Autowired)
	QnaService service;

	@GetMapping("/list")
	public void list(Model model,Criteria cri,HttpServletRequest req ) {
		
		HttpSession session=req.getSession();
		UserVO login= (UserVO) session.getAttribute("user");
		
		int total=service.totalCount(cri);
		
		model.addAttribute("loginId", login.getUser_id());
		model.addAttribute("list",service.listqnaWithPaging(cri));
		model.addAttribute("pageMarker",new PageDTO(cri, total));
	}
	
	
	@GetMapping("/write")
	public void write(Model model,HttpServletRequest req) {
		
		HttpSession session=req.getSession();
		UserVO login= (UserVO) session.getAttribute("user");
		
		model.addAttribute("id",login.getUser_id());
	}
	@PostMapping("/write")
	public String writepost(QnaVO vo,RedirectAttributes rttr) {
		
		log.info("받은 게시글 내용"+vo);
		if(vo.getAttachList()!=null) vo.getAttachList().forEach(i->log.info(""+i));
		
		service.insertQna(vo);
		rttr.addFlashAttribute("result",vo.getQno());
		return "redirect:/qna/list";
	}
	
	
	@GetMapping({"/detail","/modify"})
	public void detail(@RequestParam("qno") Long qno,Model model,@ModelAttribute("cri") Criteria cri,HttpServletRequest req) {
		
		HttpSession session=req.getSession();
		UserVO login= (UserVO) session.getAttribute("user");
		
		model.addAttribute("get",service.get(qno));
		model.addAttribute("reply",service.replyList(qno));
		model.addAttribute("loginId",login.getUser_id());
	}

	@PostMapping("/modify")
	public String modifyPost(QnaVO vo,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		service.update(vo);	
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/qna/list";
	}
	
	@GetMapping("/remove")
	public String removeQno(Long qno) {
		service.deleteByQno(qno);
		return "redirect:/qna/list";
	}
	
	@ResponseBody
	@PostMapping(value="/hitUp", consumes="application/json")
	public void updateHit(@RequestBody Map<String,Long> data) {
		service.updateHit(data.get("qno"), data.get("hit"));
		
	}
}
