package com.green.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.service.CPageService;
import com.green.service.LetterService;
import com.green.vo.CPageVO;
import com.green.vo.LetterVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cpage")
public class CPageController {
	@Setter(onMethod_=@Autowired)
	CPageService service;
	
	@Setter(onMethod_=@Autowired)
	LetterService letterService;
	
	@GetMapping("/first") 
    private void first(){
		log.info("처음...................");
    }
	
	@RequestMapping("/list") 
    private void list(Model model, String input){
		log.info("야호..................."+input);
		
		List<String> str = new ArrayList<>();
		String captain = "";
		CPageVO vo = new CPageVO();
		
		for(CPageVO i:service.getList(input)) {
			if(i.getCaptain().equals("Y")) {
				log.info("이거??"+i.getMember());
				captain = i.getMember();
			}
		}
		vo.setMember(captain);
		vo.setMembership("Y");
		service.update(vo);
		str.add(captain);
		str.add(service.getList(input).get(0).getGroup_name());
		int memberLimit = service.memberLimit(input);
		log.info("회원수..................."+memberLimit);
		captain =" ";
		
		model.addAttribute("list",service.getList(input));
		model.addAttribute("str",str);
		model.addAttribute("memberLimit",memberLimit);
    }
	
	@RequestMapping("/update/{member}")
    @ResponseBody
    private ResponseEntity<String> update(@PathVariable String member){
		log.info("수락 컨트롤러 진입............."+member);
		CPageVO vo = new CPageVO();
		LetterVO letter = new LetterVO();
		letter.setContent("그룹에 가입되었습니다.");
		letter.setRecipient(member);
		letter.setWriter("관리자");
		letter.setReg_date(new Date());
		vo.setMember(member);
		vo.setMembership("Y");
		service.update(vo);
		return new ResponseEntity<>("success",HttpStatus.OK);
    }
	
	@RequestMapping("/remove/{member}")
    @ResponseBody
    private ResponseEntity<String> remove(@PathVariable String member){
		log.info("탈퇴 컨트롤러 진입............."+member);
		CPageVO vo = new CPageVO();
		LetterVO letter = new LetterVO();
		letter.setContent("그룹 가입에 실패하였습니다.");
		letter.setRecipient(member);
		letter.setWriter("관리자");
		letter.setReg_date(new Date());
		vo.setMember(member);
		vo.setMembership("N");
		service.update(vo);
		return new ResponseEntity<>("success",HttpStatus.OK);
    }
	@PostMapping(value="/letter",consumes = "application/json")
    @ResponseBody
    private ResponseEntity<String> letter(@RequestBody LetterVO letter){
		log.info("쪽지............."+letter);
		letterService.insert(letter);
		return new ResponseEntity<>("success",HttpStatus.OK);
    }
	
	

}
