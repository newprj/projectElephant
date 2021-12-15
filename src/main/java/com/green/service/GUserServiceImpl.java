package com.green.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.GUserMapper;
import com.green.vo.GUserVO;
import com.green.vo.GroupVO;


import lombok.Setter;


@Service
public class GUserServiceImpl implements GUserService {
	
	@Setter(onMethod_=@Autowired)
	GUserMapper mapper;

	@Override
	public int groupSignUp(GUserVO vo) {
		System.out.println("서비스 group Signup" + vo);
		
		return mapper.groupSignUp(vo);
	}

	@Override
	public List<GUserVO> listByGroup(String group_name) {
		// TODO Auto-generated method stub
		return mapper.listByGroup(group_name);
	}

	@Override
	public List<GUserVO> listByUSer(String user) {
		
		return mapper.listByUSer(user);
	}



	


}
