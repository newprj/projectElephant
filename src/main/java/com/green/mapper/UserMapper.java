package com.green.mapper;

import java.util.List;

import com.green.vo.UserVO;

public interface UserMapper {
	public List<UserVO> userSelect();
	public int userInsert(UserVO vo);
	
	public int susp(UserVO vo);
}
