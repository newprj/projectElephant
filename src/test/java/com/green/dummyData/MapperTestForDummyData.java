package com.green.dummyData;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.util.Calendar;
import java.util.List;
import java.util.Optional;
import java.util.function.IntConsumer;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.green.mapper.BoardMapper;
import com.green.mapper.CalendarMapper;
import com.green.mapper.GUserMapper;
import com.green.mapper.GroupMapper;
import com.green.mapper.ReplyMapper;
import com.green.mapper.UserMapper;
import com.green.service.GUserService;
import com.green.vo.BoardReplyVO;
import com.green.vo.BoardVO;
import com.green.vo.CalendarVO;
import com.green.vo.Criteria;
import com.green.vo.GUserVO;
import com.green.vo.GroupVO;
import com.green.vo.UserVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MapperTestForDummyData {
	
	@Setter(onMethod_=@Autowired)
	public GroupMapper gMapper;
	
	@Setter(onMethod_=@Autowired)
	public UserMapper uMapper;
	
	@Setter(onMethod_=@Autowired)
	public GUserMapper guMapper;
	
	@Setter(onMethod_=@Autowired)
	public GUserService service;
	
	@Setter(onMethod_=@Autowired)
	public BoardMapper bMapper;
	
	@Setter(onMethod_=@Autowired)
	public ReplyMapper replyMapper;
	
	@Setter(onMethod_=@Autowired)
	CalendarMapper mapper;
	
	// 유저 생성 
	//@Test
	public void signUp() {
		IntStream.rangeClosed(1,200).forEach( i-> {
			UserVO vo = new UserVO();
			vo.setUser_id("test" + i);
			vo.setPassword("test");
			vo.setName("이름"+i);
			vo.setEmail("a@a.com");
			uMapper.register(vo);
		});
	}
	
	//그룹 생성
	//@Test
	public void makeGroup() {
		String [] subject = {"코딩", "그림", "공부", "맛집", "피아노", "독서", "공연", "운동", "요가"};
		IntStream.rangeClosed(1, 60).forEach(i ->{
			int random = (int)(Math.random()*subject.length);
			GroupVO vo = new GroupVO();
			vo.setProfile("/resources/img/elephant.png");
			vo.setGroup_name(subject[random]+i);
			vo.setLeader("test"+i);
			vo.setSubject(subject[random]);
			vo.setDescription("<h1>이런분을 모집합니다</h1><p><br></p><p><img src='/display?fileName=2021%5C12%5C19%2Fa676df39-8542-422f-932f-2dd5aaea5df7_KakaoTalk_20211130_180951177.jpg' width='276' style=''>"
					+ "</p><ul><li>잘 노는 분</li><li><strong>잘 먹는 분</strong></li><li>깨끗한 분 </li></ul><p><br></p>");
			vo.setMember_number(5);
			gMapper.makeGroup(vo);
			GUserVO gUserVO = new GUserVO();
			gUserVO.setGroup_name(vo.getGroup_name());
			gUserVO.setUser_id(vo.getLeader());
			gUserVO.setAuthorized("Y");
			gUserVO.setLeader("Y");
			guMapper.groupSignUp(gUserVO);
		});

		
	}
	
	//@Test
	public void groupAuthorize() {
		List<GroupVO> List = gMapper.allList();
		IntStream.rangeClosed(1, 30).forEach(i ->{
			
			gMapper.GroupAuth(List.get(i).getGno(), "Y");
		});
	}
	
	//지원하기
//	@Test
	public void groupSignUP() {
		
		List<GroupVO> list = gMapper.showAll();
		int num = list.size();
		
		IntStream.rangeClosed(1, 500).forEach(i ->{
			int random = (int)(Math.random()*50)+42;
			try{
			GroupVO groupVO = list.get((int)(Math.random()*num));
			GUserVO groupUserVO = new GUserVO();
			groupUserVO.setUser_id("test"+random);
			groupUserVO.setGroup_name(groupVO.getGroup_name());
			groupUserVO.setAuthorized("N");
			groupUserVO.setLeader("N");
			guMapper.groupSignUp(groupUserVO);
			}catch (Exception e) {
				e.printStackTrace();
			}
		});
	}
	
	//게시글 등록
	//@Test
	public void resgisterTest() {
		BoardVO vo = new BoardVO();
		List<GroupVO> list = gMapper.showAll();
		int num = list.size();
		for(int i=0; i<400; i++) {
			GroupVO groupVO = list.get((int)(Math.random()*num));
			List<GUserVO> guserVoList = service.listByGroup(groupVO.getGroup_name());
			vo.setTitle("타이틀"+i );
			vo.setContent("내용은 조금더 길게 ");
			vo.setGroup_name(groupVO.getGroup_name());
			vo.setWriter((guserVoList.get((int)(Math.random()*guserVoList.size()))).getUser_id());
			if(i%10==0) {
				vo.setNotice('Y');
				vo.setTitle("공지   ==============" + vo.getTitle());
			}
			else vo.setNotice('N');
			bMapper.register(vo);
		}
	}
	
	//리플 등록
//	@Test
	public void registerReply() {
		List<GroupVO> list = gMapper.showAll();
		int num = list.size();
		
		IntStream.rangeClosed(1, 700).forEach(i -> {
			GroupVO groupVO = list.get((int)(Math.random()*num));
			List<GUserVO> userList = service.listByGroup(groupVO.getGroup_name());
			List<BoardVO> boardList = bMapper.showList(groupVO.getGroup_name());
			BoardReplyVO replyVO = new BoardReplyVO();
			BoardVO board = boardList.get((int)(Math.random()*boardList.size()));
 			replyVO.setBno(board.getBno());
 			replyVO.setReply("댓글이야 " + i);
 			GUserVO user = userList.get((int)(Math.random()*userList.size()));
 			replyVO.setReplyer(user.getUser_id());
 			replyMapper.registerReply(replyVO);
		});
	}
	
	//조회수 올리기
	//@Test
	public void viewCntUp() {
		List<GroupVO> list = gMapper.showAll();
		int num = list.size();
		
		IntStream.rangeClosed(1, 1000).forEach(IntConsumer ->{
			GroupVO groupVO = list.get((int)(Math.random()*num));
			String name = groupVO.getGroup_name();
			gMapper.updateViewCnt(name);
		});
		
	}
	
	//이벤트 등록
	//@Test
	public void registerEvent() {
		List<GroupVO> list = gMapper.showAll();
		int num = list.size();
		String [] color = {"#d25565", "#9775fa", "#ffa94d", "#74c0fc", "#f06595", "#63e6be", "#a9e34b", "#4d638c", "#495057"};
		
		IntStream.rangeClosed(1, 100).forEach(i -> {
			GroupVO groupVO = list.get((int)(Math.random()*num));
			List<GUserVO> userList = service.listByGroup(groupVO.getGroup_name());
			GUserVO user = userList.get((int)(Math.random()*userList.size()));
			CalendarVO vo = new CalendarVO();
			vo.setColor(color[(int)(Math.random()*color.length)]);
			vo.setTitle("일정 타이틀 " +i );
			vo.setEditable(true);
			vo.setLocation("서울");
			vo.setUser_(user.getUser_id());
			vo.setDescription_("일정 설명"+i);
			vo.setMember_(user.getUser_id());
			vo.setGroup_(user.getGroup_name());

			Calendar cal = Calendar.getInstance();
			cal.set(2021, Calendar.DECEMBER, 1);
			cal.add(Calendar.DATE, (int)(Math.random()*30));
			vo.setStartDate(cal.getTime());
			mapper.createEvent(vo);
			
		});
	}
	

	
	
	
}
