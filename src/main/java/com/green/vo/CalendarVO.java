package com.green.vo;

import java.sql.Date;

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
public class CalendarVO {

	private Long cid;
	private String title;
	private String startDate;
	private String endDate;
	private boolean editable;
	private String color;
	private String description_;
	private String location;
	private String group_;
	private String user_;
	private String member_;
	
}
