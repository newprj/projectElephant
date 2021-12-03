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
import com.green.vo.QnaVO;
import com.green.vo.QnaReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ControllerTester {
	@Setter(onMethod_=@Autowired)
	private QnaService service;
	Date date=new Date();
	
	//@Test
	public void test() {
		QnaVO vo =new QnaVO();
		vo.setP_group("public");
		vo.setQ_content("내용");
		vo.setReg_date(date);
		vo.setTitle("제목5");
		vo.setWriter("사용자");
		vo.setPwd(null);
		service.insertQna(vo);
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
	@Test
	public void replySelect() {
		service.replyList(2L);
	}
}
