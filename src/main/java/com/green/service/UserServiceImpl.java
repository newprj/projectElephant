package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.UserMapper;
import com.green.vo.StudyVO;
import com.green.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserServiceImpl implements UserService{
	
	@Setter(onMethod_=@Autowired)
	private UserMapper mapper;

	@Override
	public List<UserVO> allList() {
		log.info("2) 서비스에서 사용자 리스트");
		return mapper.userSelect();
	}

	@Override
	public int insert(UserVO vo) {
		log.info("2) 서비스에서 사용자 insert");
		return mapper.userInsert(vo);
	}

	@Override
	public int userSusp(UserVO vo) {
		log.info("2) 서비스에서 사용자 계정 정지, 해제");
		return mapper.susp(vo);
	}

}
