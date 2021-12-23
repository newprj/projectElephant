package com.green.service;

import java.util.List;

import com.green.vo.Criteria;
import com.green.vo.GroupVO;

public interface GroupService {
	public int makeGroup(GroupVO vo);
	public List<GroupVO> showAll();
	public List<GroupVO> showLatest20();
	
	public GroupVO showOne(String group_name);
	public int deleteGroup (String group_name);
	public int groupNameCheck(String group_name);
	public int updateGroup(GroupVO vo);
	
	public void GroupAuth(Long gno,String authorized);
	public List<GroupVO> NotAuthList(Criteria cri);
	
	public List<GroupVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
}
