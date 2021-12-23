package com.green.service;

import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import java.util.stream.Collectors;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.GUserMapper;
import com.green.vo.GUserVO;



import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
public class GUserServiceImpl implements GUserService {
	
	@Setter(onMethod_=@Autowired)
	GUserMapper mapper;

	@Override
	public int groupSignUp(GUserVO vo) { 
		//insert
		System.out.println("서비스 group Signup" + vo);
		
		return mapper.groupSignUp(vo);
	}

	@Override
	public List<GUserVO> listByGroup(String group_name) {
		// 승인된 사용자만 
		List<GUserVO> list = mapper.listByGroup(group_name)
				.stream().filter( vo -> vo.getAuthorized().equals("Y")).collect(Collectors.toList());
		return list;
	}
	

	@Override
	public List<GUserVO> listByGroupAll(String group_name) {
		// 모든 사용자 //getList
		return mapper.listByGroup(group_name);
	}

	@Override
	public List<GUserVO> listByUSer(String user) {
		
		return mapper.listByUSer(user);
	}

	///////////////////////////
	
	@Override
	public int delete(GUserVO vo) {
		// TODO Auto-generated method stub
		return mapper.delete(vo);
	}

	@Override
	public void update(GUserVO vo) {
		// TODO Auto-generated method stub
		mapper.update(vo);
	}



	@Override
	public GUserVO read(String member) {
		// TODO Auto-generated method stub
		return mapper.read(member);
	}

	@Override
	public int memberLimit(String group_name) {
		// TODO Auto-generated method stub
		return mapper.memberLimit(group_name);
	}




	


}
