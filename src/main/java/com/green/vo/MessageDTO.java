package com.green.vo;

import java.util.Date;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.messaging.handler.annotation.SendTo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MessageDTO {

	
	private String group;
	private String loginUser;
	private String msg;
	private Date sendTime;
}
