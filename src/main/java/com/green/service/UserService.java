package com.green.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.green.vo.Criteria;
import com.green.vo.UserVO;

public interface UserService {

	public int register(UserVO vo);
	public int modify(UserVO vo);
	public int delete(UserVO vo);
	public UserVO login(UserVO vo);
	public UserVO idCheck(String user_id);

	public List<UserVO> allList();
	public List<UserVO> listWithPaging(Criteria cri);
	public int totalCount(Criteria cri);
	public int userSusp(UserVO vo);
	
	public UserVO selectMaster(String user_id);
}
