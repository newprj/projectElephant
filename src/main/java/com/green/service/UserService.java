package com.green.service;


import java.util.List;

import com.green.vo.UserVO;

public interface UserService {

	public int register(UserVO vo);
	public int modify(UserVO vo);
	public int delete(UserVO vo);
	public UserVO login(UserVO vo);
	public UserVO idCheck(String user_id);

	public List<UserVO> allList();
	public int userSusp(UserVO vo);

}
