package com.green.service;

import java.util.List;

import com.green.vo.GUserVO;

public interface GUserService {
	
	
	public int groupSignUp(GUserVO vo);
	public List<GUserVO> listByGroup(String group_name);

}
