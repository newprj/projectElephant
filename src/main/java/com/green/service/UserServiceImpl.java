package com.green.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.UserMapper;
import com.green.vo.UserVO;

import lombok.Setter;

@Service
public class UserServiceImpl implements UserService{
	
	@Setter
	(onMethod_=@Autowired)
	UserMapper mapper;

	@Override
	public int signUp(UserVO vo) {
		
		return mapper.signUp(vo);
	}

}
