package com.green.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.service.CPageService;
import com.green.vo.CPageVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cpage")
public class CPageController { //1 2
	@Setter(onMethod_=@Autowired)
	CPageService service;

	
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
		captain =" ";
		
		model.addAttribute("list",service.getList(input));
		model.addAttribute("str",str);
    }
	
	@RequestMapping("/update/{member}")
    @ResponseBody
    private int update(@PathVariable String member){
		log.info("수락 컨트롤러 진입............."+member);
		CPageVO vo = new CPageVO();
		vo.setMember(member);
		vo.setMembership("Y");
		service.update(vo);
        return 1;
    }
	
	@RequestMapping("/remove/{member}")
    @ResponseBody
    private int remove(@PathVariable String member){
		log.info("탈퇴 컨트롤러 진입............."+member);
		CPageVO vo = new CPageVO();
		vo.setMember(member);
		vo.setMembership("N");
		service.update(vo);
        return 1;
    }

}
