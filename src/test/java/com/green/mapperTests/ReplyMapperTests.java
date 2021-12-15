package com.green.mapperTests;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.green.mapper.ReviewReplyMapper;
import com.green.vo.ReviewReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class ReplyMapperTests {
	@Setter(onMethod_=@Autowired)
	private ReviewReplyMapper mapper;
	
	@Test
	public void insertTest() {
		ReviewReplyVO vo = new ReviewReplyVO();
		vo.setContent("고생하셨어요");
		vo.setRno(3l);
		vo.setWriter("홍길동");
		mapper.insert(vo);
	}
	
	//@Test
	public void readTest() {
		mapper.read(1l);
	}
	
	//@Test
	public void updateTest() {
		ReviewReplyVO vo = new ReviewReplyVO();
		vo.setContent("고생했다");
		vo.setCno(19l);
		vo.setRno(47l);
		vo.setWriter("박지성");
		mapper.update(vo);
	}
	
	//@Test
	public void deleteTeset() {
		mapper.delete(3l);
	}
	
	//@Test
	public void getList() {
		mapper.getList(1l);
	}
	
	
	
}
