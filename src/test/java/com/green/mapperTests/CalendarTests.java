package com.green.mapperTests;

import org.apache.ibatis.binding.MapperRegistry;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.mapper.CalendarMapper;
import com.green.vo.CalendarVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CalendarTests {
	
	@Setter(onMethod_=@Autowired)
	CalendarMapper mapper;
	
//	@Test
	public void insertTest() {
	
		CalendarVO vo = new CalendarVO();
		vo.setColor("black");
		vo.setTitle("testTitle2");
//		vo.setEndDate("21-12-02");
		vo.setEditable(true);
//		vo.setLocation("서울");
		vo.setGroup_("테스트");
		vo.setUser_("aaa");
//		vo.setMember_("bbb");
		vo.setDescription_(" 설명입니다 " );
		mapper.createEvent(vo);
		
	}
	
//	@Test
	public void test2() {
		mapper.getMaxCid();
	}

	
	@Test 
	public void testAfterToday() {
		mapper.eventsAfterToday("그룹이름");
	}
	
//	@Test
	public void deleteTest() {
		mapper.deleteEvent(2L);
	}

	@Test
	public void showBYGRoup() {
		mapper.showEventByGroup("그룹이름").forEach(i -> System.out.println(i));
	}
	
//	@Test
	public void showByDAy() {
		mapper.showEventByDay("2021-12-01");
	}
	
	//@Test
	public void updateEvent() {
		CalendarVO vo = mapper.showEventOne(49L);
		vo.setLocation("마산");
		mapper.updateEvent(vo);
	}
	
}

