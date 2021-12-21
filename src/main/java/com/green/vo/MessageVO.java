package com.green.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MessageVO {
	
	private Long mid;
	private String msg;
	private String group_name;
	private String user_id;
	
	public MessageVO(MessageDTO dto) {
		this.msg = dto.getLongMsg();
		this.group_name = dto.getGroup();
		this.user_id = dto.getUser();
	}
	
}
