package com.green.service;

import java.util.List;

import com.green.vo.AttachFileDTO;
import com.green.vo.ChatRoomVO;
import com.green.vo.ChatVO;


public interface ChatService {
	public ChatRoomVO selectChatRoom(String room_id);
	public int insertMessage(ChatVO vo);
	
	public ChatRoomVO searchRoom(ChatRoomVO vo);
	public int createChat(ChatRoomVO vo);
}
