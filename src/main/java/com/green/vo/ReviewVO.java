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
public class ReviewVO {
	private long rno; //번호
	private String group_name; //모임이름
	private String title; // 제목
	private String content; //내용
	private String writer; //작성자
	private Date regdate; //작성일
	private int reply_count; // 댓글 갯수
	private int view_count; // 조회수
	
}
