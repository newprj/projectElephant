package com.green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.green.mapper.FileMapper;
import com.green.mapper.ReplyMapper;
import com.green.service.BoardService;
import com.green.service.CalendarService;
import com.green.service.GUserService;
import com.green.service.GroupService;
import com.green.service.ReplyService;
import com.green.vo.BoardReplyVO;
import com.green.vo.BoardVO;
import com.green.vo.CalendarVO;
import com.green.vo.FileVO;
import com.green.vo.GUserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import oracle.net.aso.i;


@RestController
@RequestMapping("/group/*")
@Slf4j
public class GRestController {
	
	@Setter(onMethod_=@Autowired)
	GroupService groupService;
	
	@Setter(onMethod_=@Autowired)
	GUserService groupUserService;
	
	@Setter(onMethod_=@Autowired)
	BoardService boardService;
	
	@Setter(onMethod_=@Autowired)
	CalendarService calendarService;
	
	@Setter(onMethod_=@Autowired)
	ReplyService replyService;

	
	
	// 메인 페이지
	@GetMapping("/")
	public ModelAndView main(Model model) {
		model.addAttribute("group", groupService.showAll());
		return new ModelAndView("/group/main");
	}
	
	// 그룹 모집 페이지
	@GetMapping("/{group_name}")
	public ModelAndView groupDetail(@PathVariable("group_name") String group_name, Model model) {
		ModelAndView mv = new ModelAndView("/group/detail");
		mv.addObject("one", groupService.showOne(group_name));
		return mv;
	}
	
	//그룹 이름 중복체크
	@PostMapping("/duplicateCheck")
	public String groupNameCheck(String group_name) {
		int result = groupService.groupNameCheck(group_name);
		if(result >=1)
			return "duplicated";
		else return "unduplicated";
	}
	
	
	// 스터디 그룹 삭제
	@DeleteMapping("/{group_name}")
	public void delete(@PathVariable("group_name") String group_name) {
		groupService.deleteGroup(group_name);
		 		
	}
	
	
	// 그룹에 가입 신청
	@PostMapping(value= "/", 
			consumes= "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> signupGroup(@RequestBody GUserVO vo) {
		System.out.println("vo" + vo);
		groupUserService.groupSignUp(vo);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	// 그룹별 게시판 페이지
	@GetMapping("/board/{group_name}")
	public ModelAndView tempGroupPage( @PathVariable("group_name") String group_name) {
		ModelAndView mv = new ModelAndView("/group/board");
		mv.addObject("name", group_name);
		mv.addObject("board", boardService.showList(group_name));
		return mv;
	}

	// 게시글 조회
	@GetMapping(value="/board/{group_name}/{bno}",  produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ModelAndView readOne(@PathVariable("bno") Long bno, @PathVariable("group_name") String group_name){
		BoardVO board = boardService.read(bno);
		List<BoardReplyVO> replies = replyService.getReplysByBno(bno);
		List<FileVO> files = boardService.getFileListByBno(bno);
		ModelAndView mv = new ModelAndView("/group/boardDetail");
		mv.addObject("replies", replies);
		mv.addObject("board",board);
		mv.addObject("files", files);
		return mv;
	}
	
	@GetMapping(value="/board/{group_name}/write")
	public ModelAndView boardWrite(@PathVariable("group_name")String group_name) {
		ModelAndView mv = new ModelAndView("/group/write");
		return mv;
	}
	// 게시글 입력 
	@PostMapping(value="/board", consumes= "application/json")
	public void boardCreate(@RequestBody BoardVO board) {
		boardService.register(board);
		
	}
	
	
	
	
	//게시글 삭제d
	@DeleteMapping(value="/board/{bno}")
	public void boardDelete(@PathVariable("bno") Long bno) {
		boardService.delete(bno);
	}
	
	// 게시글 수정
	@PutMapping(value="/board/{bno}",
			consumes= "application/json")
	public void boardUpdate(@RequestBody BoardVO board) {
		boardService.update(board);
	}
	
	// 리플 1개 읽기
	@GetMapping(value="reply/{rno}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<BoardReplyVO> getReply(@PathVariable("rno") Long rno) {
		System.out.println(" 리플 하나 읽기");
		System.out.println(rno);
		return new ResponseEntity<>(replyService.getReplyOne(rno), HttpStatus.OK);
	}

	// 리플 등록
	@PostMapping(value="/reply", consumes= "application/json")
	public void registerReply(@RequestBody BoardReplyVO vo) {
		System.out.println("리플라이 포스트 방식");
		System.out.println(vo);
		replyService.registerReply(vo);
	}
	
	// 리플 수정
	@PutMapping(value="/reply/{rno}", consumes= "application/json")
	public void replyModify(@PathVariable("rno") Long rno, @RequestBody BoardReplyVO vo) {
		System.out.println(" 리플라이 풋매핑");
		System.out.println(rno);
		replyService.updateReply(vo);
	}

	//리플 삭제 
	@DeleteMapping(value="/reply/{rno}")
	public void ReplyDelete(@PathVariable("rno") Long rno) {
		System.out.println(" 리플라이 삭제");
		System.out.println(rno);
		replyService.deleteReply(rno);
	}
	
	
	//캘린더 그룹별
	@GetMapping("/test/{group_name}")
	public ModelAndView test(@PathVariable String group_name) {
		ModelAndView mv = new ModelAndView("/group/test");
		mv.addObject("group", group_name);
		mv.addObject("member", groupUserService.listByGroup(group_name));
		return mv;
	}
	
	// 그룹별 이벤트 가져오기
	@GetMapping(value= "/event/{group}",
			produces =MediaType.APPLICATION_JSON_UTF8_VALUE )
	public ResponseEntity<List<CalendarVO>> getEvents(@PathVariable String group){
		System.out.println(" 잘들어왔나요? ");
		
		return new ResponseEntity<List<CalendarVO>>(calendarService.showEventByGroup(group), HttpStatus.OK );
	}
	
	// 이벤트 등록
	@PostMapping("/test")
	public void createEvent(@RequestBody CalendarVO vo) {
		calendarService.createEvent(vo);
	}
	
	//이벤트 수정
	@PutMapping(value="/test/{cid}",
			consumes= "application/json")
	public void eventUpdate(@RequestBody CalendarVO vo) {
		
		calendarService.updateEvent(vo);
	}
	
	// 이벤트 삭제 
	@DeleteMapping(value = "/test/{cid}")
	public void eventDelete(@PathVariable("cid") Long cid) {
		calendarService.deleteEvent(cid);
	}
	

	@GetMapping("/model")
	public ModelAndView testView(Model model) {
		return new ModelAndView("/abc");
	}
	
	

}
