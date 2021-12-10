package com.green.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class QnaReplyVO {
	private Long rno;
	private Long qno;
	private String r_writer;
	private String r_content;
	private Date r_reg_date;
	private Date r_up_date;
}
