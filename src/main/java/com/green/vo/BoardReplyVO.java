package com.green.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class BoardReplyVO {
	
	private Long rno;
	private Long bno;
	private String reply;
	private String replyer;
	private Date replydate;
	private Date updateDate;
	
}
