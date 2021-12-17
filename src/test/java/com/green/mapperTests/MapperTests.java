package com.green.mapperTests;

import java.sql.Date;
import java.util.List;
import java.util.function.IntConsumer;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.mapper.BoardMapper;
import com.green.mapper.GUserMapper;
import com.green.mapper.GroupMapper;
import com.green.mapper.ReplyMapper;
import com.green.mapper.UserMapper;
import com.green.vo.BoardReplyVO;
import com.green.vo.BoardVO;
import com.green.vo.Criteria;

import com.green.vo.GUserVO;
import com.green.vo.GroupVO;


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
	
	@Setter(onMethod_=@Autowired)
	public BoardMapper bMapper;
	
	@Setter(onMethod_=@Autowired)
	public ReplyMapper replyMapper;
	
	
	//@Test
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
		
		List<BoardVO> voList = bMapper.showList("그루비룸");
		 List<BoardVO> size = voList.stream().filter(vo -> vo.getNotice() == 'N').collect(Collectors.toList());
		
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
	public void makegroupTest() {
		for(int i=0; i<30; i++) {
			GroupVO groupVO = new GroupVO();
			groupVO.setGroup_name("테스트" + i);
			groupVO.setDescription("<p>말하면 니가 아니</p>" + i);
			groupVO.setLeader("aaa");
			groupVO.setMember_number(4);
			groupVO.setSubject("test"+i);
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
	
	
	//@Test
	public void registerTEst() {
		IntStream.rangeClosed(1, 100).forEach( i -> {
			BoardVO vo = new BoardVO();
			vo.setGroup_name("테스트그룹");
			vo.setNotice('N');
			vo.setTitle("테스트 타이틀" +i);
			vo.setContent(" 내용" );
			vo.setWriter("test");
			bMapper.register(vo);
		});
		
	}
	
	
	//@Test
	public void group() {
		List<GroupVO> list = gMapper.showAll();
		list.forEach(i -> {
			 guMapper.listByGroup(i.getGroup_name())
				.stream().filter( vo -> vo.getAuthorized() == 'Y').collect(Collectors.toList())
				.forEach(v -> log.info("  " + v));
		});
		
	}
	//@Test 
	public void testSearck() {
		Criteria cri = new Criteria();
		cri.setGroup_name("테스트그룹");
		cri.setKeyword("내용");
		cri.setType("TC");
		bMapper.getListWithPaging(cri).forEach(i->System.out.println(i));
	}
	
	//@Test
	public void testShow() {
		gMapper.showLatest20();
	}

	@Test
	public void testPagingGgroup() {
		Criteria cri = new Criteria();
		
		
		gMapper.getListWithPaging(cri).forEach(i -> System.out.println(i+"======================================================="));
	}
}
