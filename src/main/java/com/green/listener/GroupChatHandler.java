package com.green.listener;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.green.vo.MessageDTO;

import lombok.extern.log4j.Log4j;


@Log4j
@Component
public class GroupChatHandler extends TextWebSocketHandler{
	
	private Map<String, ArrayList<WebSocketSession>> roomList = new HashMap<>();
	private Map<WebSocketSession, String> sessionList = new HashMap<>();
	private Map<String, Set<String>> userList = new HashMap<>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
		System.out.println(" chatiing 을 위해 해당 페이지에 들어옴 " );
	}
	
	
	// 전송했을 때 
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		ObjectMapper objectMapper = new ObjectMapper();
		MessageDTO msg = objectMapper.readValue(message.getPayload(), MessageDTO.class);
		
		//json을 객체로 저장함 
		System.out.println(message.getPayload());
		if(roomList.get(msg.getGroup()) == null) {
			ArrayList<WebSocketSession> sList = new ArrayList<WebSocketSession>();
			sList.add(session);
			roomList.put(msg.getGroup(), sList);
			sessionList.put(session, msg.getGroup());
		}else if(sessionList.get(session) == null ) {
			roomList.get(msg.getGroup()).add(session);
			sessionList.put(session, msg.getGroup());
		}
		
		if(msg.getType().equals("open")) {
			if( userList.get(msg.getGroup())== null) {
				Set<String> userSet = new HashSet<String>();
				userList.put(msg.getGroup(), userSet);
			}
			userList.get(msg.getGroup()).add(msg.getUser());
		}else if(msg.getType().equals("close")) {
			userList.get(msg.getGroup()).remove(msg.getUser());
		}
		
		msg.setMember(userList.get(msg.getGroup()));
		
		for(WebSocketSession s : roomList.get(msg.getGroup())) {
			s.sendMessage(new TextMessage(msg.getMember()+"-"+msg.getUser() + "-" +msg.getMsg() +"-"+msg.getSendTime()+ "-" +msg.getType()));
		}
	}
	
	
	// 연결 끊음
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		
		if(sessionList.get(session) !=null) {
			roomList.get(sessionList.get(session)).remove(session);
		}
		log.info(" 퇴장" );
	}
	

}