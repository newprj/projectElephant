package com.green.mapper;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.vo.GUserVO;
import com.green.vo.GroupVO;
import com.green.vo.UserVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MapperTests {
	
	@Setter(onMethod_=@Autowired)
	public GroupMapper gMapper;
	
	@Setter(onMethod_=@Autowired)
	public UserMapper uMapper;
	
	@Setter(onMethod_=@Autowired)
	public GUserMapper guMapper;
	
//	@Test
	public void signUptest() {
		for( int i=0; i<10; i++) {
			UserVO userVO = new UserVO();
			userVO.setEmail("bbb"+i+"@aaa.com");
			userVO.setName("userB"+i);
			userVO.setPassword("pass");
			userVO.setUser_id("bbb"+i);
			uMapper.signUp(userVO);
		}
	}
//	
//	@Test
	public void makegroupTest() {
		for(int i=0; i<10; i++) {
			GroupVO groupVO = new GroupVO();
			groupVO.setGroup_name("testname" + i);
			groupVO.setDescription("test description " + i);
			groupVO.setLeader(Long.valueOf(i));
			groupVO.setMember_number(4);
			groupVO.setSubject(" test ");
			gMapper.makeGroup(groupVO);
			
		}
	}
	
//	@Test
	public void groupsignup() {
		GUserVO vo = new GUserVO();
		vo.setGroup_name("test name 1");
		vo.setUser_id("bbb");
		guMapper.groupSignUp(vo);
	}
	
//	@Test
	public void showAll() {
		gMapper.showOne("test name 0");
	}
	

}
