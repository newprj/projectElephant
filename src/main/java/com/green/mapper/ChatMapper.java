package com.green.mapper;

import com.green.vo.ChatRoomVO;
import com.green.vo.ChatVO;

public interface ChatMapper {
	public ChatRoomVO selectChatRoom(String room_id);
	public int insertMessage(ChatVO vo);
	//방 만들기
	public ChatRoomVO searchRoom(ChatRoomVO vo);
	public int createChat(ChatRoomVO vo);
}
