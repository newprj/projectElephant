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

import com.green.service.BoardService;
import com.green.service.CalendarService;
import com.green.service.GUserService;
import com.green.service.GroupService;
import com.green.vo.BoardVO;
import com.green.vo.CalendarVO;
import com.green.vo.GUserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/group/*")
@Slf4j
public class GRestController {
	
	@Setter(onMethod_=@Autowired)
	GroupService groupservice;
	
	@Setter(onMethod_=@Autowired)
	GUserService groupUserService;
	
	@Setter(onMethod_=@Autowired)
	BoardService boardService;
	
	@Setter(onMethod_=@Autowired)
	CalendarService calendarService;
	
	// 스터디 그룹 삭제
	@DeleteMapping("/{group_name}")
	public void delete(@PathVariable("group_name") String group_name) {
		
		groupservice.deleteGroup(group_name);
		 		
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
	
	// 게시글 조회
	@GetMapping(value="/temp/{bno}",  produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<BoardVO> readOne(@RequestParam("bno") Long bno){
		BoardVO board = boardService.read(bno);
		return new ResponseEntity<BoardVO>(board, HttpStatus.OK);
	}
	
	//게시글 삭제d
	@DeleteMapping(value="/temp/{bno}")
	public void boardDelete(@PathVariable("bno") Long bno) {
		boardService.delete(bno);
	}
	
	// 게시글 수정
	@PutMapping(value="/temp/{bno}",
			consumes= "application/json")
	public void boardUpdate(@RequestBody BoardVO board) {
		boardService.update(board);
	}
	
	// 게시글 입력 
	
	@PostMapping(value="/temp", consumes= "application/json")
	public void boardCreate(@RequestBody BoardVO board) {
		boardService.register(board);
	}
	
//	@GetMapping("/model")
//	public ModelAndView testView(Model model) {
//		model.addAttribute("abc" , boardService.showList("테스트"));
//		return new ModelAndView("/group/abc");
//	}
	
	@GetMapping("/test/{group_name}")
	public ModelAndView test(Model model, @PathVariable String group_name) {
		System.out.println(" 들어오니 ?" + group_name);
		model.addAttribute("group", group_name);
		model.addAttribute("member", groupUserService.listByGroup(group_name));
		return new ModelAndView("/group/test");
	}
	
	@GetMapping(value= "/event/{group}",
			produces =MediaType.APPLICATION_JSON_UTF8_VALUE )
	public ResponseEntity<List<CalendarVO>> getEvents(@PathVariable String group){
		System.out.println(" 잘들어왔나요? ");
		
		return new ResponseEntity<List<CalendarVO>>(calendarService.showEventByGroup(group), HttpStatus.OK );
	}
	
	@GetMapping("/model")
	public ModelAndView testView(Model model) {
		return new ModelAndView("/abc");
	}
	
	@PostMapping("/test")
	public void createEvent(@RequestBody CalendarVO vo) {
		calendarService.createEvent(vo);
	}
	
	@PutMapping(value="/test/{cid}",
			consumes= "application/json")
	public void eventUpdate(@RequestBody CalendarVO vo) {
		System.out.println(" 풋매핑");
		System.out.println(vo);
		calendarService.updateEvent(vo);
	}
	
	@DeleteMapping(value = "/test/{cid}")
	public void eventDelete(@PathVariable("cid") Long cid) {
		calendarService.deleteEvent(cid);
	}
	

	

}
