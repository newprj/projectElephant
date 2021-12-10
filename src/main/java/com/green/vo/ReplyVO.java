package com.green.vo;

import java.util.Date;

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
public class ReplyVO {
	private long rno; //번호
	private long cno; //번호
	private String content; //내용
	private String writer; //작성자
	private Date regdate; //작성일
}
