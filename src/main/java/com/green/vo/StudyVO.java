package com.green.vo;

import java.util.Date;
import java.util.List;

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
public class StudyVO {
	private Long sno;
	private String group_name;
	private String leader;
	private String subject;
	private String description;
	private int member_number;
}
