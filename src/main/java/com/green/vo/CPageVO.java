package com.green.vo;

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
public class CPageVO {
	private long rno;
	private String group_name;
	private String member;
	private String captain;
	private String Membership;
	private int memberLimit;
}
