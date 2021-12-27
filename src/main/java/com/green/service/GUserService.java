package com.green.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.green.vo.Criteria;
import com.green.vo.GUserVO;
import com.green.vo.GroupVO;

public interface GUserService {
	

	public int groupSignUp(GUserVO vo); //insert
	public List<GUserVO> listByUSer(String user);
	////
	public int delete (String member);
	public void update (GUserVO vo);

	public GUserVO read(String member);
	public int memberLimit(String group_name);
	
	
	public List<GUserVO> listByGroupAll(String group_name); //getList
	public List<GUserVO> listByGroup(String group_name); 

	
	public List<GroupVO> joinGroup(@Param("cri") Criteria cri,@Param("user_id") String user_id);
	public int allGrouptotal(@Param("cri") Criteria cri,@Param("user_id") String user_id);

}
