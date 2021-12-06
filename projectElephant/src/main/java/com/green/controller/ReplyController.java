package com.green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.service.ReplyService;
import com.green.vo.ReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reply")
public class ReplyController {
	@Setter(onMethod_=@Autowired)
	ReplyService service;
	
	@RequestMapping("/list") 
    @ResponseBody
    private List<ReplyVO> ReplyList(long rno){
		log.info("댓글 조회 컨트롤러 진입...................");
        return service.getList(rno);
    }
	
	@RequestMapping("/insert") 
    @ResponseBody
    private int insert(int rno, String content){
		log.info("댓글 인서트 컨트롤러 진입.............");
		ReplyVO vo = new ReplyVO();
		vo.setRno(rno);
		vo.setWriter("홍길동");
		vo.setContent(content);
		service.register(vo);
		return 1;
    }
	
	@RequestMapping("/update") //댓글 수정  
    @ResponseBody
    private int update(int cno, String content){
		log.info("댓글 수정 컨트롤러 진입...........");
		ReplyVO vo = new ReplyVO();
		vo.setCno(cno);
		vo.setContent(content);
		service.modify(vo);
        return 1;
    }

	@RequestMapping("/delete/{cno}")
    @ResponseBody
    private int delete(@PathVariable Long cno){
		log.info("삭제 컨트롤러 진입.............");
		System.out.println(cno);
        service.remove(cno);
        return 1;
    }


}
