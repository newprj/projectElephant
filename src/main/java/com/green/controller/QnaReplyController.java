package com.green.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.green.service.QnaService;
import com.green.vo.QnaAttachDTO;
import com.green.vo.QnaReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/reply/*")
@Slf4j
public class QnaReplyController {
	
	@Setter(onMethod_=@Autowired)
	private QnaService service;

	@GetMapping(value="/count", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> replyCnt(Long qno){
		//log.info("1)reply qno"+qno);
		String cnt=Integer.toString(service.replyCount(qno));
		//log.info("1)reply 갯수"+cnt);
		
		return new ResponseEntity<>(cnt,HttpStatus.OK);
	}
	
	@PostMapping(value="/insert", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> replyRegister(@RequestBody QnaReplyVO vo){
		log.info("1)reply ajax 등록"+vo);
		int reg=service.register(vo);
		return reg==1? new ResponseEntity<>("success",HttpStatus.OK) : 
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR
				);
	}
	
	@PostMapping(value="/modify",consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> replyModify(@RequestBody QnaReplyVO vo){
		log.info("1)reply ajax 수정"+vo);
		int update=service.replyUpdate(vo);
		return update==1? new ResponseEntity<>("success",HttpStatus.OK) : 
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR
				);
	}
	
	@PostMapping(value="/delete", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> replyDelete(@RequestBody Map<String,Long> rno){
		log.info("1)reply ajax 삭제"+rno);
		log.info("1)reply ajax 삭제"+rno.get("rno"));
		
		int del=service.replyDelete(rno.get("rno"));
		return del==1? new ResponseEntity<>("success",HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
