package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.GroupMapper;
import com.green.vo.GroupVO;

import lombok.Setter;

@Service
public class GroupServiceImpl implements GroupService{
	
	@Setter
	(onMethod_=@Autowired)
	GroupMapper mapper;

	@Override
	public int makeGroup(GroupVO vo) {
		System.out.println(" 서비스 vo " + vo);
		return mapper.makeGroup(vo);
	}

	@Override
	public List<GroupVO> showAll() {
		// TODO Auto-generated method stub
		return mapper.showAll();
	}

	@Override
	public GroupVO showOne(String group_name) {
		// TODO Auto-generated method stub
		return mapper.showOne(group_name);
	}

	@Override
	public int deleteGroup(String group_name) {
		// TODO Auto-generated method stub
		return mapper.deleteGroup(group_name);
	}

	

}
