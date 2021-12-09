package com.green.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.UserMapper;
import com.green.vo.UserVO;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
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



}
