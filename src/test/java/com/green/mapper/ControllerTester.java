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
	
	@Test
	public void get() {
		service.get(2L);
	}
}