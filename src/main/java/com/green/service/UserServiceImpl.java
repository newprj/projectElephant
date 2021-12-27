package com.green.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.UserMapper;
import com.green.vo.AttachImageVO;
import com.green.vo.Cri;
import com.green.vo.Criteria;
import com.green.vo.SCri;
import com.green.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserServiceImpl implements UserService {
	
	@Setter(onMethod_=@Autowired)
	private UserMapper usermapper;

	@Override
	public int register(UserVO vo) {
		return usermapper.register(vo);
	}

	@Override
	public int modify(UserVO vo) {
		return usermapper.modify(vo);
	}

	@Override
	public int delete(UserVO vo) {
		return usermapper.delete(vo);
	}

	@Override
	public UserVO login(UserVO vo) {
		return usermapper.login(vo);
	}

	@Override
	public UserVO idCheck(String user_id) {
		return usermapper.idCheck(user_id);
	}

	@Override
	public List<UserVO> allList() {
		log.info("2) 서비스에서 사용자 리스트");
		return usermapper.userSelect();
	}

	@Override
	public int userSusp(UserVO vo) {
		log.info("2) 서비스에서 사용자 계정 정지, 해제");
		return usermapper.susp(vo);
	}

	@Override
	public UserVO selectMaster(String user_id) {
		log.info("2) 서비스에서 마스터 사용자 검색");
		return usermapper.selectMaster(user_id);
	}

	@Override
	public List<UserVO> listWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return usermapper.listWithPaging(cri);
	}

	@Override
	public int totalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return usermapper.totalCount(cri);
		
	}

	@Override
	public List<UserVO> list() {
		return usermapper.list();
	}

	@Override
	public UserVO view(int uno) {
		return usermapper.view(uno);
	}

	@Override
	public List<UserVO> listPage(Cri cri) {
		return usermapper.listPage(cri);
	}

	@Override
	public int listCount() {
		return usermapper.listCount();
	}

	@Override
	public List<UserVO> listSearch(SCri scri) {
		return usermapper.listSearch(scri);
	}

	@Override
	public int countSearch(SCri scri) {
		return usermapper.countSearch(scri);
	}

	@Override
	public void imageEnroll(AttachImageVO vo) {
		usermapper.imageEnroll(vo);
		
	}

	@Override
	public List<AttachImageVO> getAttachList(int id) {
		return usermapper.getAttachList(id);
	}
	
	
	
}
