package com.green.controller;

import java.util.Date;

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

import com.green.service.GUserService;
import com.green.service.GroupService;
import com.green.service.LetterService;
import com.green.vo.GUserVO;
import com.green.vo.LetterVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;




@Slf4j
@Controller
@RequestMapping("/cpage")
public class CPageController {
	
	@Setter(onMethod_=@Autowired)
	GroupService groupService;
	
	@Setter(onMethod_=@Autowired)
	GUserService groupuserSevice;
	
	@Setter(onMethod_=@Autowired)
	LetterService letterService;
	
	@GetMapping("/first") 
    private void first(){
		log.info("처음...................");
    }
	
	@RequestMapping("/list") 
    private void list(Model model, String input){
		log.info("야호..................."+input);
		
		GUserVO userVO = groupuserSevice.listByGroupAll(input)
				.stream().filter(i -> i.getLeader().equals("Y")).findFirst().orElse(null);
		
		// 그룹 생성과 동시에 유저는 그룹에 setAthorize(y) 즉 membership이 승인된 상태로 가입되도록 수정했습니다. 그래서 생략했어요 
		
		int memberLimit = groupuserSevice.memberLimit(input);
		log.info("회원수..................."+memberLimit);
		
		
		model.addAttribute("limit", groupService.showOne(input).getMember_number());
		model.addAttribute("list",groupuserSevice.listByGroupAll(input));
		model.addAttribute("leader",userVO);
		model.addAttribute("memberLimit",memberLimit);
    }
	
	@RequestMapping("/update/{member}/{group_name}")
    @ResponseBody
    private ResponseEntity<String> update(@PathVariable String member, @PathVariable String group_name){
		log.info("수락 컨트롤러 진입............."+member);
		
		GUserVO gUserVO = groupuserSevice.listByUSer(member).stream()
				.filter(i -> i.getGroup_name().equals(group_name)).findAny().orElse(null);
		
		LetterVO letter = new LetterVO();
		letter.setContent("그룹에 가입되었습니다.");
		letter.setRecipient(member);
		letter.setWriter("관리자");
		letter.setReg_date(new Date());
		
		gUserVO.setAuthorized("Y");
		groupuserSevice.update(gUserVO);
		letterService.insert(letter);
		return new ResponseEntity<>("success",HttpStatus.OK);
    }
	
	@RequestMapping("/remove/{member}/{group_name}")
    @ResponseBody
    private ResponseEntity<String> remove(@PathVariable String member, @PathVariable String group_name){
		log.info("탈퇴 컨트롤러 진입............."+member);

		LetterVO letter = new LetterVO();
		letter.setContent("그룹에서 탈퇴되었습니다.");
		letter.setRecipient(member);
		letter.setWriter("관리자");
		letter.setReg_date(new Date());
		GUserVO gUserVO = groupuserSevice.listByUSer(member).stream()
				.filter(i -> i.getGroup_name().equals(group_name)).findAny().orElse(null);
		gUserVO.setAuthorized("N");
		groupuserSevice.update(gUserVO);
		letterService.insert(letter);
		return new ResponseEntity<>("success",HttpStatus.OK);
    }
	
	@RequestMapping("/delete/{member}/{group_name}")
    @ResponseBody
    private ResponseEntity<String> delete(@PathVariable String member, @PathVariable String group_name){
		log.info("삭제 컨트롤러 진입............."+member);

		LetterVO letter = new LetterVO();
		letter.setContent("그룹 가입에 거절되었습니다.");
		letter.setRecipient(member);
		letter.setWriter("관리자");
		letter.setReg_date(new Date());
		GUserVO gUserVO = groupuserSevice.listByUSer(member).stream()
				.filter(i -> i.getGroup_name().equals(group_name)).findAny().orElse(null);
		
		groupuserSevice.delete(gUserVO);
		letterService.insert(letter);
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
