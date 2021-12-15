package com.green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.service.ReviewReplyService;
import com.green.service.ReviewService;
import com.green.vo.ReviewReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reply")
public class ReviewReplyController {
	@Setter(onMethod_=@Autowired)
	ReviewReplyService service;
	@Setter(onMethod_=@Autowired)
	ReviewService rService;
	
	@RequestMapping("/list") //댓글 리스트 컨트롤러
    @ResponseBody
    private List<ReviewReplyVO> ReplyList(long rno){
		log.info("댓글 조회 컨트롤러 진입...................");
        return service.getList(rno);
    }
	
	@RequestMapping("/insert") //댓글 입력 컨트롤러
    @ResponseBody
    private int insert(int rno, String content){
		log.info("댓글 인서트 컨트롤러 진입.............");
		ReviewReplyVO vo = new ReviewReplyVO();
		vo.setRno(rno);
		vo.setWriter("홍길동");
		vo.setContent(content);
		service.register(vo);
		rService.updateReplyCount((long)rno);
		return 1;
    }
	
	@RequestMapping("/update") //댓글 수정 컨트롤러 
    @ResponseBody
    private int update(int cno, String content){
		log.info("댓글 수정 컨트롤러 진입...........");
		ReviewReplyVO vo = new ReviewReplyVO();
		vo.setCno(cno);
		vo.setContent(content);
		service.modify(vo);
        return 1;
    }

	@RequestMapping("/delete/{cno}")//댓글 삭제 컨트롤러 
    @ResponseBody
    private int delete(@PathVariable Long cno){
		log.info("삭제 컨트롤러 진입............."+cno);
		log.info("이것은?"+service.get(cno).getRno());
		long a = service.get(cno).getRno();
        service.remove(cno);
        rService.updateReplyCount(a);
        return 1;
    }


}
