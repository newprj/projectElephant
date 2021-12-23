package com.green.mapper;

import java.util.List;


import com.green.vo.GUserVO;
import com.green.vo.GroupVO;

public interface GUserMapper {
	
	public int groupSignUp(GUserVO vo); //insert
	public List<GUserVO> listByGroup(String group_name); //getList
	public List<GUserVO> listByUSer(String user);
	////
	public int delete (GUserVO vo);
	public void update (GUserVO vo);
	public void remove (GUserVO vo);
	public GUserVO read(String member);
	public int memberLimit(String group_name);

}
