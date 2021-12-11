package com.green.mapperTests;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.green.mapper.ReviewMapper;
import com.green.vo.ReviewVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class ReviewMapperTests {
	@Setter(onMethod_=@Autowired)
	private ReviewMapper mapper;
	
	//@Test
	public void insertTest() {
		
		ReviewVO vo = new ReviewVO();
		for(int i=0;i<100;i++) {
			vo.setGroup_name("공부하자"+i);
			vo.setContent("모이자"+i);
			vo.setTitle("모집"+i);
			vo.setWriter("홍길동"+i);
			mapper.insert(vo);
		}
	}
	
	//@Test
	public void readTest() {
		mapper.read(43l);
	}
	
	//@Test
	public void updateTest() {
		ReviewVO vo = new ReviewVO();
		vo.setRno(1l);
		vo.setGroup_name("공부하지말자");
		vo.setContent("모이지말자");
		vo.setTitle("모집안함");
		vo.setWriter("홍말자");
		mapper.update(vo);
	}
	
	//@Test
	public void deleteTeset() {
		mapper.delete(3l);
	}
	
	//@Test
	public void getList() {
		mapper.getList();
	}
	
	//@Test
	public void rnoRedTest() {
		mapper.rnoRead();
	}
	
	@Test
	public void getReplyCount() {
		for(long i=0;i<300;i++) {
		mapper.updateReplyCount(i);
		}
	}
	
}
