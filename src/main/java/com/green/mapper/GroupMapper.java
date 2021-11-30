package com.green.mapper;

import java.util.List;

import com.green.vo.GroupVO;

public interface GroupMapper {
	
	public int makeGroup(GroupVO vo);
	public List<GroupVO> showAll();
	public GroupVO showOne(String group_name);
	public int deleteGroup (String group_name);

}
