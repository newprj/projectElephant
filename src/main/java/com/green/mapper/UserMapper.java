package com.green.mapper;

import com.green.vo.UserVO;

public interface UserMapper {

	public int register(UserVO vo);
	public int modify(UserVO vo);
	public int delete(UserVO vo);
	public UserVO login(UserVO vo);
	public UserVO idCheck(String user_id);

}
