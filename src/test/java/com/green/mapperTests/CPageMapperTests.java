package com.green.mapperTests;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.green.mapper.CPageMapper;
import com.green.vo.CPageVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class CPageMapperTests {
	@Setter(onMethod_=@Autowired)
	private CPageMapper mapper;
	
	//@Test
	public void insertTest() {
		CPageVO vo = new CPageVO();
		vo.setCaptain("야호1");
		vo.setGroup_name("야호");
		vo.setMember("야호2");
		vo.setRno(1);
		mapper.insert(vo);
	}
	
	//@Test
	public void readTest() {
		
	}
	
	//@Test
	public void updateTest() {
		
	}
	
	//@Test
	/*
	 * public void deleteTeset() { mapper.delete(member);
	 * 
	 * }
	 */
	
	@Test
	public void getList() {
		mapper.getList("코끼리");
	}
	
	
	
}
