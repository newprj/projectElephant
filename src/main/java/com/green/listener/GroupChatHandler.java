package com.green.listener;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;



import lombok.extern.log4j.Log4j;



@Log4j
@Component
public class GroupChatHandler extends TextWebSocketHandler{
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
		log.info(" chatiing 을 위해 해당 페이지에 들어옴 " );
		sessionList.add(session);
		/*
		 * for(WebSocketSession s : sessionList ) { s.sendMessage(new
		 * TextMessage(session.getId() +": 입장 ")); }
		 */
		
		
	}
	
	// 전송했을 때 
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
		log.info(" 메시지 전송~~ ");
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(message.getPayload()));
		}
	}
	
	
	// 연결 끊음
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		
		sessionList.remove(session);
		/*
		 * for(WebSocketSession s : sessionList) { s.sendMessage(new TextMessage(
		 * session.getId() + ": 님 퇴장 ")); }
		 */
		log.info(" 퇴장" );
	}
	

}