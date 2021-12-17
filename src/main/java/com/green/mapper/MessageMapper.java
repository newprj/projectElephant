package com.green.mapper;

import org.apache.ibatis.annotations.Param;

import com.green.vo.MessageVO;

public interface MessageMapper {
	public void insertMsg(MessageVO vo);
	public MessageVO getMsg(@Param("group_name") String group_name, 
			@Param("user_id")String user_id);
	
	public int deleteMsg(Long mid);

}
