package com.green.service;

import java.util.List;

import com.green.vo.UserVO;

public interface UserService {
	public List<UserVO> allList();
	public int insert(UserVO vo);
}
