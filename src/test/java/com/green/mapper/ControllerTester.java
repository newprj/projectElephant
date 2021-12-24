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

import com.green.service.GroupService;
import com.green.service.QnaService;
import com.green.service.UserService;
import com.green.service.VisitService;
import com.green.vo.QnaVO;
import com.green.vo.UserVO;
import com.green.vo.Criteria;
import com.green.vo.GUserVO;
import com.green.vo.GroupVO;
import com.green.vo.QnaReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ControllerTester {
	@Setter(onMethod_=@Autowired)
	private QnaService service;
	
	@Setter(onMethod_=@Autowired)
	private UserService userService;
	
	@Setter(onMethod_=@Autowired)
	private GroupService gService;
	
	@Setter(onMethod_=@Autowired)
	private VisitService visit;
	
	Date date=new Date();
	
	//@Test
	public void weekHit() {
		visit.weekCnt();
	}
	
	//@Test
	public void hit() {
		service.updateHit(162L, 0L);
	}
	
	//@Test
	public void vtest() {
		//visit.insertVisitor();
		//visit.totalCnt();
		visit.todayCnt();
	}
	@Test
	public void gtest() {
		
			GroupVO vo=new GroupVO();
			vo.setDescription("설명_a");
			vo.setGroup_name("name_a");
			vo.setLeader("a");
			vo.setMember_number(5);
			vo.setSubject("주제_a");
			vo.setProfile(null);
			gService.makeGroup(vo);
		
	}
	
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
