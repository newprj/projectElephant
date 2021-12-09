package com.green.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.vo.BoardReplyVO;
import com.green.vo.BoardVO;
import com.green.vo.Criteria;
import com.green.vo.GUserVO;
import com.green.vo.GroupVO;
import com.green.vo.UserVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import oracle.net.aso.b;

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
	
	@Setter(onMethod_=@Autowired)
	public BoardMapper bMapper;
	
	@Setter(onMethod_=@Autowired)
	public ReplyMapper replyMapper;
	
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(3);
		cri.setAmount(10);
		cri.setGroup_name("코끼리");
		
		List<BoardVO> list = bMapper.getListWithPaging(cri);
		list.forEach(BoardVO -> System.out.println(BoardVO));
		
	}
	
	
	//@Test
	public void replyupdateTest() {
		BoardReplyVO vo = replyMapper.getReplyOne(22L);
		
		replyMapper.updateReply(vo);
	}
	
//	@Test
	public void getDuplicated() {
//		gMapper.groupNameCheck("테스트");
		gMapper.groupNameCheck("중복검사");
		
	}

//	@Test
	public void getUser() {
		guMapper.listByGroup("테스트");
	}
	
//	@Test
	public void resgisterTest() {
		BoardVO vo = new BoardVO();
		for(int i=0; i<100; i++) {
			vo.setTitle("타이틀"+i );
			vo.setContent("내용은 조금더 길게 ");
			vo.setGroup_name("그룹이름");
			vo.setWriter("테스트유저");
			bMapper.register(vo);
		}
	}
	
//	@Test
	public void showAllTest() {
		bMapper.showList("테스트");
	}
	
//	@Test
	public void readTest() {
		bMapper.read(1L);
	}
	
//	@Test 
	public void updateTest() {
		BoardVO vo = bMapper.read(1L);
		vo.setTitle("변경된 타이틀");
		vo.setContent("내용도 변경 " );
		vo.setGroup_name(vo.getGroup_name());
		vo.setWriter(vo.getWriter());
		bMapper.update(vo);
	}
	
//	@Test
	public void delete() {
		bMapper.delete(2L);
	}
	
	
	
//	@Test
	public void signUptest() {
		for( int i=0; i<10; i++) {
			UserVO userVO = new UserVO();
			userVO.setEmail("bbb"+i+"@aaa.com");
			userVO.setName("userB"+i);
			userVO.setPassword("pass");
			userVO.setUser_id("bbb"+i);
			//uMapper.signUp(userVO);
		}
	}
//	
//	@Test
	public void makegroupTest() {
		for(int i=0; i<10; i++) {
			GroupVO groupVO = new GroupVO();
			groupVO.setGroup_name("테스트" + i);
			groupVO.setDescription("test description " + i);
			groupVO.setLeader("aaa");
			groupVO.setMember_number(4);
			groupVO.setSubject(" test ");
			gMapper.makeGroup(groupVO);
			
		}
	}
	
//	@Test
	public void groupsignup() {
		GUserVO vo = new GUserVO();
		vo.setGroup_name("테스트");
		vo.setUser_id("bbb");
		guMapper.groupSignUp(vo);
	}
	
//	@Test
	public void groupuserList() {
		guMapper.listByGroup("테스트");
	}
	
//	@Test
	public void showAll() {
		gMapper.showOne("test name 0");
	}
	
//	@Test
	public void deleteTest() {
		gMapper.deleteGroup("1");
	}
	

}
