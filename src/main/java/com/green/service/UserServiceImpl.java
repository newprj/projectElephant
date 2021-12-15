package com.green.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.UserMapper;
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

	
	
	
}
