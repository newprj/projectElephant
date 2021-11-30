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
		// TODO Auto-generated method stub
		return mapper.groupSignUp(vo);
	}


}
