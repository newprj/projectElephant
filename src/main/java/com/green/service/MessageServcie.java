package com.green.service;

import org.apache.ibatis.annotations.Param;

import com.green.vo.MessageVO;

public interface MessageServcie {

	public void insertMsg(MessageVO vo);
	public MessageVO getMsg(@Param("group_name") String group_name, 
			@Param("user_id")String user_id);
	
	public int deleteMsg(Long mid);
}
