package com.green.mapper;
import java.util.List;

import com.green.vo.UserVO;

public interface UserMapper {

	public int register(UserVO vo);
	public int modify(UserVO vo);
	public int delete(UserVO vo);
	public UserVO login(UserVO vo);
	public UserVO idCheck(String user_id);

	//admin 페이지에서 보려고 만든 것입니다.
	public List<UserVO> userSelect();
	public int susp(UserVO vo);

	//chatting
	public UserVO selectMaster(String user_id);
	
}
