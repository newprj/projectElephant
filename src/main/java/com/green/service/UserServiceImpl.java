package com.green.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.UserMapper;
import com.green.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserServiceImpl implements UserService{
	
	@Setter(onMethod_=@Autowired)
	private UserMapper mapper;

	@Override
	public UserVO allList() {
		log.info("2) 서비스에서 사용자 리스트");
		return mapper.userSelect();
	}

}
