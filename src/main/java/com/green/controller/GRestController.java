package com.green.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.green.service.BoardService;
import com.green.service.GUserService;
import com.green.service.GroupService;
import com.green.vo.BoardVO;
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
	
	@DeleteMapping("/{group_name}")
	public void delete(@PathVariable("group_name") String group_name) {
		System.out.println("delete 컨트롤러로 들어옴   ");
		System.out.println(group_name);
		groupservice.deleteGroup(group_name);
		 		
	}
	
	@PostMapping(value= "/", 
			consumes= "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> signupGroup(@RequestBody GUserVO vo) {
		System.out.println("vo" + vo);
		groupUserService.groupSignUp(vo);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@GetMapping(value="/temp/{bno}",  produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<BoardVO> readOne(@RequestParam("bno") Long bno){
		BoardVO board = boardService.read(bno);
		return new ResponseEntity<BoardVO>(board, HttpStatus.OK);
	}
	
	@DeleteMapping(value="/temp/{bno}")
	public void boardDelete(@PathVariable("bno") Long bno) {
		boardService.delete(bno);
	}
	
	@PutMapping(value="/temp/{bno}",
			consumes= "application/json")
	public void boardUpdate(@RequestBody BoardVO board) {
		boardService.update(board);
	}
	
	@PostMapping(value="/temp", consumes= "application/json")
	public void boardCreate(@RequestBody BoardVO board) {
		boardService.register(board);
	}
	

}
