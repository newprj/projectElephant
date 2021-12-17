package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.GUserMapper;
import com.green.mapper.GroupMapper;
import com.green.vo.GUserVO;
import com.green.vo.GroupVO;

import lombok.Setter;

@Service
public class GroupServiceImpl implements GroupService{
	
	@Setter
	(onMethod_=@Autowired)
	GroupMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	GUserMapper umapper;

	@Override
	public int makeGroup(GroupVO vo) {
		System.out.println(" 서비스 vo " + vo);
		GUserVO groupLeader = new GUserVO(vo);
		umapper.groupSignUp(groupLeader);
		return mapper.makeGroup(vo);
	}

	@Override
	public List<GroupVO> showAll() {
		// TODO Auto-generated method stub
		return mapper.showAll();
	}

	@Override
	public GroupVO showOne(String group_name) {
		mapper.updateViewCnt(group_name);
		return mapper.showOne(group_name);
	}

	@Override
	public int deleteGroup(String group_name) {
		// TODO Auto-generated method stub
		return mapper.deleteGroup(group_name);
	}

	@Override
	public int groupNameCheck(String group_name) {
		// TODO Auto-generated method stub
		return mapper.groupNameCheck(group_name);
	}

	@Override
	public void GroupAuth(Long gno, String authorized) {
		
		mapper.GroupAuth(gno, authorized);
	}

	@Override
	public int updateGroup(GroupVO vo) {
		
		return mapper.updateGroup(vo);
	}

	@Override
	public List<GroupVO> showLatest20() {
		
		return mapper.showLatest20();
	}

	

}
