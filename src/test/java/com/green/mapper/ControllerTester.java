package com.green.mapper;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.green.service.QnaService;
import com.green.service.UserService;
import com.green.vo.QnaVO;
import com.green.vo.UserVO;
import com.green.vo.Criteria;
import com.green.vo.QnaReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ControllerTester {
	@Setter(onMethod_=@Autowired)
	private QnaService service;
	
	@Setter(onMethod_=@Autowired)
	private UserService userService;
	
	
	
	Date date=new Date();
	
	//@Test
	public void test() {
		for (int i = 0; i <50; i++) {
			QnaVO vo =new QnaVO();
			vo.setP_group("public");
			vo.setQ_content("내용"+i);
			vo.setReg_date(date);
			vo.setTitle("제목"+i);
			vo.setWriter("사용자"+i);
			vo.setPwd(null);
			service.insertQna(vo);
		}
		
	}
	
		
	//@Test
	public void studytest() {
		for (int i = 0; i <10; i++) {
		
		}
		
	}
	//@Test
	public void sele() {
		service.list();
	}
	
	//@Test
	public void get() {
		service.get(2L);
	}
	
	//@Test
	public void insert() {
		QnaReplyVO vo=new QnaReplyVO();
		vo.setR_content("댓글");
		vo.setR_reg_date(date);
		vo.setR_up_date(null);
		vo.setR_writer("사용자");
		vo.setQno(2L);
		service.register(vo);
	}
	//@Test
	public void replySelect() {
		service.replyList(2L);
	}
	//@Test
	public void testPaging() {
		Criteria cri=new Criteria();
		List<QnaVO> list =service.listqnaWithPaging(cri);
		list.forEach(qna->log.info(qna));
	}
}
