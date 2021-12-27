package com.green.service;


import java.util.List;

import com.green.vo.AttachImageVO;
import com.green.vo.Cri;
import com.green.vo.Criteria;
import com.green.vo.SCri;
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

	public List<UserVO> list();
	public UserVO view(int uno);
	public List<UserVO> listPage(Cri cri);
	public int listCount();
	public List<UserVO> listSearch(SCri scri);
	public int countSearch(SCri scri);
	
	public void imageEnroll(AttachImageVO vo);
	
	public List<AttachImageVO> getAttachList(int id);



}
