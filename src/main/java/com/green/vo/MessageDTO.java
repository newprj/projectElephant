package com.green.vo;



import java.util.List;
import java.util.Set;

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

	private String type;
	private String group;
	private String user;
	private String msg;
	private String sendTime;
	private String longMsg;
	private Set<String> member;
	private String img;
	
}
