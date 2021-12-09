package com.green.mapper;
import java.util.List;

import com.green.vo.UserVO;

public interface UserMapper {

	public int register(UserVO vo);
	public int modify(UserVO vo);
	public int delete(UserVO vo);
	public UserVO login(UserVO vo);
	public UserVO idCheck(String user_id);

	public List<UserVO> userSelect();
	public int susp(UserVO vo);

	
}
