package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.CalendarMapper;
import com.green.mapper.ChatMapper;
import com.green.vo.CalendarVO;
import com.green.vo.ChatRoomVO;
import com.green.vo.ChatVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ChatServiceImpl implements ChatService{
	
	@Setter(onMethod_=@Autowired)
	ChatMapper mapper;

	@Override
	public ChatRoomVO selectChatRoom(String room_id) {
		log.info("서비스에서 채팅방 검색");
		return mapper.selectChatRoom(room_id);
	}

	@Override
	public int insertMessage(ChatVO vo) {
		log.info("서비스에서 채팅방 입력");
		return mapper.insertMessage(vo);
	}

	@Override
	public ChatRoomVO searchRoom(ChatRoomVO vo) {
		log.info("서비스에서 채팅방 검색");
		return mapper.searchRoom(vo);
	}

	@Override
	public int createChat(ChatRoomVO vo) {
		log.info("서비스에서 채팅방 생성");
		return mapper.createChat(vo);
	}

	
}
