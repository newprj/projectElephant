package com.green.service;

import java.util.List;

import com.green.vo.GroupVO;

public interface GroupService {
	public int makeGroup(GroupVO vo);
	public List<GroupVO> showAll();
	public GroupVO showOne(String group_name);
	public int deleteGroup (String group_name);
	public int groupNameCheck(String group_name);
	
	public void GroupAuth(Long gno,String authorized);
}
