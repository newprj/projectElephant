package com.green.listener;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.green.mapper.ChatMapper;
import com.green.service.ChatService;
import com.green.service.UserService;
import com.green.vo.ChatRoomVO;
import com.green.vo.ChatVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChattingHandler extends TextWebSocketHandler{

private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	
	private static int i=0;
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		i++;
		log.info(" chatiing 을 위해 해당 페이지에 들어옴 " );
		sessionList.add(session);
		for(WebSocketSession s : sessionList ) {
			s.sendMessage(new TextMessage(session.getId() +": 입장"));
		}
	}
	
	// 전송했을 때 
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
		log.info(" 메시지 전송~~ ");
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage( session.getId() + ":" +message.getPayload()));
		}
	}
	
	
	// 연결 끊음
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		i--;
		sessionList.remove(session);
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage( session.getId() + ": 님 퇴장"));
		}
		log.info(" 퇴장" );
	}
}
