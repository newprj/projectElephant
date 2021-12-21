package com.green.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.green.mapper.MessageMapper;
import com.green.vo.MessageVO;

import lombok.Setter;

public class MessageServcieImpl implements MessageServcie{
	
	@Setter(onMethod_=@Autowired)
	MessageMapper mapper;

	@Override
	public void insertMsg(MessageVO vo) {
		mapper.insertMsg(vo);
		
	}

	@Override
	public MessageVO getMsg(String group_name, String user_id) {
		// TODO Auto-generated method stub
		return mapper.getMsg(group_name, user_id);
	}

	@Override
	public int deleteMsg(Long mid) {
		// TODO Auto-generated method stub
		return mapper.deleteMsg(mid);
	}

}
