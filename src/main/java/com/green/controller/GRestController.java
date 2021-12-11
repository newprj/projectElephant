package com.green.controller;

import java.io.Console;
import java.util.List;

import javax.security.auth.login.LoginContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import javax.swing.border.EmptyBorder;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.aop.aspectj.annotation.LazySingletonAspectInstanceFactoryDecorator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.green.mapper.BoardMapper;
import com.green.service.BoardService;
import com.green.service.CalendarService;
import com.green.service.GUserService;
import com.green.service.GroupService;
import com.green.service.ReplyService;
import com.green.vo.BoardReplyVO;
import com.green.vo.BoardVO;
import com.green.vo.CalendarVO;
import com.green.vo.Criteria;
import com.green.vo.FileVO;
import com.green.vo.GUserVO;
import com.green.vo.GroupVO;
import com.green.vo.PageDTO;
import com.green.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;



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
	public ModelAndView main(Model model, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		ModelAndView mv =  new ModelAndView("/group/main");
		mv.addObject("user", user);
		mv.addObject("group", groupService.showAll());
		return mv;
	}
	
	// 그룹별 가입 유저 가지고 오기 
	@GetMapping(value ="/getMemberlistByGroup/{group_name}")
	public ResponseEntity<List<GUserVO>> getMemberlistByGroup(
			@PathVariable("group_name") String group_name){
		List<GUserVO> userList = groupUserService.listByGroup(group_name);
		log.info("list" + userList);
		return new ResponseEntity<>(userList, HttpStatus.OK);
	}
	
	// 그룹 모집 페이지
	@GetMapping("/gather/{group_name}")
	public ModelAndView groupDetail(@PathVariable("group_name") String group_name, HttpSession session ) {
		UserVO user = (UserVO) session.getAttribute("user");
		ModelAndView mv = new ModelAndView("/group/detail");
		mv.addObject("one", groupService.showOne(group_name));
		mv.addObject("user", user);
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
	
	
	// 그룹별 페이지 = 일정, 게시판
	@GetMapping("/{group_name}")
	public ModelAndView gatherGroup(@PathVariable String group_name, HttpSession session) {

		ModelAndView mv = new ModelAndView("/group/study");
		try {
			UserVO user = (UserVO) session.getAttribute("user");
			mv.addObject("user", user.getUser_id());
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return mv;
		
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
	@GetMapping("/board/{group_name}/{pageNum}/{amount}")
	public ModelAndView tempGroupPage(@ModelAttribute("cri") Criteria cri,  HttpSession session ) {
		ModelAndView mv = new ModelAndView("/group/board");
		int total = boardService.getTotalCount(cri);
		try {
			UserVO user = (UserVO) session.getAttribute("user");
			mv.addObject("user", user.getUser_id());
			mv.addObject("name", cri.getGroup_name());
			mv.addObject("board", boardService.getListWithPaging(cri));
			mv.addObject("pageMaker" , new PageDTO(cri, total));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	
	
	@GetMapping("/board/{group_name}")
	public ModelAndView tempGroupPage( @PathVariable("group_name") String group_name, 
			Criteria cri,  HttpSession session) {
		ModelAndView mv = new ModelAndView("/group/board");
		cri.setGroup_name(group_name);
		int total = boardService.getTotalCount(cri);
		try {
			UserVO user = (UserVO) session.getAttribute("user");
			mv.addObject("user", user.getUser_id());
			mv.addObject("name", cri.getGroup_name());
			mv.addObject("board", boardService.getListWithPaging(cri));
			mv.addObject("pageMaker" , new PageDTO(cri, total));
			mv.addObject("name", group_name);
		}catch(Exception e) {
			e.printStackTrace();
		}
	
		return mv;
	}

	// 게시글 조회
	@GetMapping(value="/board/{group_name}/{bno}/{pageNum}/{amount}",  
			produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ModelAndView readOne(@ModelAttribute("cri") Criteria cri, HttpSession session){
		ModelAndView mv = new ModelAndView("/group/getBoardForm");

		try {
			UserVO user = (UserVO) session.getAttribute("user");
			Long bno = cri.getBno();
			BoardVO board = boardService.read(bno);
			List<BoardReplyVO> replies = replyService.getReplysByBno(bno);
			
			mv.addObject("user", user.getUser_id());
			mv.addObject("replies", replies);
			mv.addObject("board",board);

		}catch(Exception e) {
			e.printStackTrace();
		}

		return mv;
	}
	
	@GetMapping(value="/board/{group_name}/write")
	public ModelAndView boardWrite(@PathVariable("group_name")String group_name, 
			HttpSession session) {
		ModelAndView mv = new ModelAndView("/group/write");	
		try {
			UserVO user = (UserVO) session.getAttribute("user");
			mv.addObject("user", user.getUser_id());
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	// 게시글 입력 
	@PostMapping(value="/board", consumes= "application/json")
	public void boardCreate(@RequestBody BoardVO board) {
		boardService.register(board);
		
	}
	
	@GetMapping(value="/getFileList" ,
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<FileVO>> getAttachList(Long bno){
		System.out.println(" 파일 리스트 가져오기 ");
		System.out.println(bno);
		
		
		return new ResponseEntity<List<FileVO>>(boardService.getFileListByBno(bno), HttpStatus.OK);
	}
	
	
	
	
	//게시글 삭제d
	@DeleteMapping(value="/board/{bno}")
	public void boardDelete(@PathVariable("bno") Long bno) {
		boardService.delete(bno);
	}
	// 게시글 수정
	@GetMapping("/modify/{group_name}/{bno}/{pageNum}/{amount}")
	public ModelAndView boardModify(@ModelAttribute("cri") Criteria cri, HttpSession session ) {
		Long bno = cri.getBno();
		ModelAndView mv = new ModelAndView("/group/modifyForm");
		BoardVO board = boardService.read(bno);
		try {
			UserVO user = (UserVO) session.getAttribute("user");
			List<FileVO> files = boardService.getFileListByBno(bno);
			mv.addObject("user", user.getUser_id());
			mv.addObject("board",board);
			mv.addObject("files", files);

		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return mv;
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
		
		return new ResponseEntity<>(replyService.getReplyOne(rno), HttpStatus.OK);
	}

	// 리플 등록
	@PostMapping(value="/reply", consumes= "application/json")
	public void registerReply(@RequestBody BoardReplyVO vo) {
	
		replyService.registerReply(vo);
	}
	
	// 리플 수정
	@PutMapping(value="/reply/{rno}", consumes= "application/json")
	public void replyModify(@PathVariable("rno") Long rno, @RequestBody BoardReplyVO vo) {
		
		replyService.updateReply(vo);
	}

	//리플 삭제 
	@DeleteMapping(value="/reply/{rno}")
	public void ReplyDelete(@PathVariable("rno") Long rno) {
		
		replyService.deleteReply(rno);
	}
	
	
	//캘린더 그룹별
	@GetMapping("/test/{group_name}")
	public ModelAndView test(@PathVariable String group_name, HttpSession session) {
		ModelAndView mv = new ModelAndView("/group/test");
		
		try {
			UserVO user = (UserVO) session.getAttribute("user");
			GroupVO vo = groupService.showOne(group_name);
			mv.addObject("user", user.getUser_id());
			mv.addObject("group", vo);
			mv.addObject("member", groupUserService.listByGroup(group_name));
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	// 그룹별 이벤트 가져오기
	@GetMapping(value= "/event/{group}",
			produces =MediaType.APPLICATION_JSON_UTF8_VALUE )
	public ResponseEntity<List<CalendarVO>> getEvents(@PathVariable String group){
		
		
		return new ResponseEntity<List<CalendarVO>>(calendarService.showEventByGroup(group), HttpStatus.OK );
	}
	
	// 이벤트 등록
	@PostMapping("/test")
	public long createEvent(@RequestBody CalendarVO vo) {
		long cid= calendarService.createEvent(vo);
		System.out.println(cid);
		return cid;
	}
	
	//이벤트 수정
	@PutMapping(value="/test/{cid}",
			consumes= "application/json")
	public void eventUpdate(@RequestBody CalendarVO vo,  @PathVariable Long cid) {
		
		CalendarVO calendar = calendarService.showEventOne(cid);
		calendar.setStartDate(vo.getStartDate());
		calendar.setEndDate(vo.getEndDate());
		System.out.println(calendar);
		calendarService.updateEvent(calendar);
	}
	
	// 이벤트 삭제 
	@DeleteMapping(value = "/test/{cid}")
	public void eventDelete(@PathVariable("cid") Long cid) {
		System.out.println(cid);
		calendarService.deleteEvent(cid);
	}
	

	
	@GetMapping("/model")
	public ModelAndView testView(Model model) {
		return new ModelAndView("/abc");
	}
	


}