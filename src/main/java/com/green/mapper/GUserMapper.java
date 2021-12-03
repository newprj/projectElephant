package com.green.mapper;

import java.util.List;

import com.green.vo.GUserVO;

public interface GUserMapper {
	
	public int groupSignUp(GUserVO vo);
	public List<GUserVO> listByGroup(String group_name);

}
