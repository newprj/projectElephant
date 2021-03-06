package com.green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.green.vo.Criteria;
import com.green.vo.GroupVO;

public interface GroupMapper {
	
	public int makeGroup(GroupVO vo);
	
	public List<GroupVO> showAll();
	public List<GroupVO> showLatest20();
	public List<GroupVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public GroupVO showOne(String group_name);
	public int deleteGroup (String group_name);
	public int groupNameCheck(String group_name);
	
	public int updateGroup(GroupVO vo);

	public int updateViewCnt(String group_name);


	//스터디 승인
	public List<GroupVO> NotAuthList(Criteria cri);
	public void GroupAuth(@Param("gno") Long gno,@Param("authorized") String authorized);
	
	//user page에 사용
	public List<GroupVO> myGroup(@Param("cri") Criteria cri, @Param("leader") String leader);
	public int myGrouptotal(@Param("cri") Criteria cri,@Param("leader") String leader);
	
	//더미테스트 용
	public List<GroupVO> allList();
}